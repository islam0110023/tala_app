import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tala_app/feature/dating/presentation/manager/get_user_vector/get_user_vector_cubit.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_item_page_dating.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0);
    startScrollTimer();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isFirstTime) {
      _isFirstTime = false;
      getUserVector();
    }
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

  void onPageChanged(int index) {
    if (index > currentIndex && !canScroll) {
      controller.jumpToPage(currentIndex);
      return;
    }

    setState(() {
      currentIndex = index;
      canScroll = false;
    });

    startScrollTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserVectorCubit, GetUserVectorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is GetUserVectorLoading,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: controller,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return const CustomItemPageDating();
            },
          ),
        );
      },
    );
  }
}
