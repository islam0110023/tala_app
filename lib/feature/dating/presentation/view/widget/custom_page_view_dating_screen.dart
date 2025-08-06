import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/dating/domain/params/match_user_params.dart';
import 'package:tala_app/feature/dating/domain/usa_case/get_today_scroll_count_usa_case.dart';
import 'package:tala_app/feature/dating/domain/usa_case/reset_scroll_if_new_day_use_case.dart';
import 'package:tala_app/feature/dating/domain/usa_case/save_scroll_use_case.dart';
import 'package:tala_app/feature/dating/presentation/manager/get_matches_user/get_matches_user_cubit.dart';
import 'package:tala_app/feature/dating/presentation/manager/get_user_vector/get_user_vector_cubit.dart';
import 'package:tala_app/feature/dating/presentation/manager/match_user_provider.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_item_page_dating.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_item_page_dating_skeletonizer.dart';

class CustomPageViewDatingScreen extends StatefulWidget {
  const CustomPageViewDatingScreen({super.key});

  @override
  State<CustomPageViewDatingScreen> createState() =>
      _CustomPageViewDatingScreenState();
}

class _CustomPageViewDatingScreenState
    extends State<CustomPageViewDatingScreen> {
  late PageController controller;
  int currentIndex = 0;

  bool canScroll = false;
  int dailyScrollLimit = 15;
  int scrollsToday = 0;
  bool _isFirstTime = true;
  bool hasShownLimitMessage = false;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    startScrollTimer();
    resetScroll();
    loadTodayScroll();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstTime) {
      _isFirstTime = false;
      getUserVector();
    }
  }

  void loadTodayScroll() async {
    final result = await getIt<GetTodayScrollCountUsaCase>().call();
    result.fold(
      (l) => AppConstant.buildShowSnackBar(context, l.errMessage),
      (r) => setState(() {
        scrollsToday = r;
      }),
    );
  }

  void resetScroll() async {
    await getIt<ResetScrollIfNewDayUseCase>().call();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getUserVector() {
    final cubit = context.read<GetUserVectorCubit>();
    cubit.getUserVector(FirebaseAuth.instance.currentUser!.uid);
  }

  void startScrollTimer() {
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        canScroll = true;
      });
    });
  }

  void onPageChanged(int index) async {
    if (index > currentIndex && !canScroll) {
      controller.jumpToPage(currentIndex);
      return;
    }
    if (scrollsToday >= dailyScrollLimit) {
      if (!hasShownLimitMessage) {
        hasShownLimitMessage = true;
        AppConstant.buildShowSnackBar(context, 'Reached daily limit');
      }
      controller.jumpToPage(currentIndex);
      return;
    }
    await getIt<SaveScrollUseCase>().call(1);

    scrollsToday++;
    hasShownLimitMessage = false;

    setState(() {
      currentIndex = index;
      canScroll = false;
    });

    startScrollTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserVectorCubit, GetUserVectorState>(
      listener: (context, state) {
        if (state is GetUserVectorSuccess) {
          final cubit = context.read<GetMatchesUserCubit>();
          final params = MatchUserParams(
            vector: state.userData.vector,
            gender: state.userData.gender,
            excludeIds: [FirebaseAuth.instance.currentUser!.uid],
            interestFilter: null,
          );
          cubit.getMatchesUser(params);
        }
        if (state is GetUserVectorFailure) {
          AppConstant.buildShowSnackBar(context, state.errMessage);
        }
      },
      child: BlocBuilder<GetMatchesUserCubit, GetMatchesUserState>(
        builder: (context, state) {
          if (state is GetMatchesUserLoaded || state is GetMatchesUserInitial) {
            return const Skeletonizer(
              enabled: true,
              child: CustomItemPageDatingSkeletonizer(),
            );
          } else if (state is GetMatchesUserSuccess) {
            return Skeletonizer(
              enabled: false,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: controller,
                physics: canScroll
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                onPageChanged: onPageChanged,
                itemCount: state.matches.length,
                itemBuilder: (context, index) {
                  return MatchUserProvider(
                    matchUser: state.matches[index],
                    child: CustomItemPageDating(
                      key: PageStorageKey(state.matches[index].uid),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(
                'Something went wrong,Try again later',
                textAlign: TextAlign.center,
                style: Styling.textStyle32.copyWith(
                  color: AppColor.kPrimaryPink,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
