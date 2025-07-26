import 'package:flutter/material.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0);
    startScrollTimer();
  }

  void startScrollTimer() {
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        canScroll = true;
      });
    });
  }

  void onPageChanged(int index) {
    if (!canScroll) {
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
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return const CustomItemPageDating();
      },
    );
  }
}
