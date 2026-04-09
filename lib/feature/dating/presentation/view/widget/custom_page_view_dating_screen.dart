import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/subscription_dialog.dart';
import 'package:tala_app/feature/dating/data/data_source/dating_remote_data_source.dart';
import 'package:tala_app/feature/dating/domain/params/match_user_params.dart';
import 'package:tala_app/feature/dating/presentation/manager/get_matches_user/get_matches_user_cubit.dart';
import 'package:tala_app/feature/dating/presentation/manager/get_user_vector/get_user_vector_cubit.dart';
import 'package:tala_app/feature/dating/presentation/manager/match_user_provider.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_item_page_dating.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_item_page_dating_skeletonizer.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

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
  bool _isFirstTime = true;
  bool isLimitReached = false;
  bool _isConsumingScroll = false;
  bool hasShownLimitMessage = false;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    startScrollTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLimitOnEnter();
    });
    // resetScroll();
    // loadTodayScroll();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstTime) {
      _isFirstTime = false;
      getUserVector();
    }
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

  // void onPageChanged(int index) async {
  //   if (index > currentIndex && !canScroll) {
  //     controller.jumpToPage(currentIndex);
  //     return;
  //   }
  //   // if (scrollsToday >= dailyScrollLimit) {
  //   //   if (!hasShownLimitMessage) {
  //   //     hasShownLimitMessage = true;
  //   //     AppConstant.buildShowSnackBar(context, 'Reached daily limit');
  //   //   }
  //   //   controller.jumpToPage(currentIndex);
  //   //   return;
  //   // }
  //   await getIt<SaveScrollUseCase>().call(1);
  //
  //   scrollsToday++;
  //   hasShownLimitMessage = false;
  //
  //   setState(() {
  //     currentIndex = index;
  //     canScroll = false;
  //   });
  //
  //   startScrollTimer();
  // }
  void onPageChanged(int index) async {
    if (index < currentIndex) {
      setState(() => currentIndex = index);
      return;
    }

    if (isLimitReached) {
      if (!hasShownLimitMessage) {
        hasShownLimitMessage = true;
        AppConstant.buildShowSnackBar(
          context,
          LocaleKeys.dailyMessageLimitReached.tr(),
        );
      }
      controller.jumpToPage(currentIndex);
      return;
    }

    if (!canScroll) {
      controller.jumpToPage(currentIndex);
      return;
    }

    setState(() {
      currentIndex = index;
      canScroll = false;
    });

    startScrollTimer();

    if (_isConsumingScroll) return;
    _isConsumingScroll = true;

    try {
      await getIt<DatingRemoteDataSource>().checkAndConsumeScroll();

      hasShownLimitMessage = false;
    } on FirebaseFunctionsException catch (e) {
      debugPrint('AppFailure.fromException: $e');

      if (e.code == 'permission-denied') {
        isLimitReached = true;

        if (!hasShownLimitMessage) {
          hasShownLimitMessage = true;
          showDialog(
            context: context,
            useSafeArea: false,
            animationStyle: const AnimationStyle(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            builder: (context) {
              return SubscriptionDialog(
                message: LocaleKeys.dailyMessageLimitReached.tr(),
                onTap: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        }
      } else {
        AppConstant.buildShowSnackBar(context, LocaleKeys.unexpected.tr());
      }
    } catch (e) {
      AppConstant.buildShowSnackBar(context, LocaleKeys.unexpected.tr());
    }

    _isConsumingScroll = false;
  }

  Future<void> checkLimitOnEnter() async {
    try {
      await getIt<DatingRemoteDataSource>().checkAndConsumeScroll();
    } on FirebaseFunctionsException catch (e) {
      if (e.code == 'permission-denied') {
        setState(() {
          isLimitReached = true;
        });
        showDialog(
          context: context,
          useSafeArea: false,
          animationStyle: const AnimationStyle(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          builder: (context) {
            return SubscriptionDialog(
              message: LocaleKeys.dailyMessageLimitReached.tr(),
              onTap: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      }
    } catch (_) {}
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
