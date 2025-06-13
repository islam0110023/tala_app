import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomAnimateContainer extends StatefulWidget {
  const CustomAnimateContainer({super.key});

  @override
  State<CustomAnimateContainer> createState() => _CustomAnimateContainerState();
}

class _CustomAnimateContainerState extends State<CustomAnimateContainer>
    with SingleTickerProviderStateMixin {
  final List<String> words = [
    'Redefining',
    'Social',
    'Connection',
    'And',
    'Concert',
    'Experiences',
    'into',
  ];

  int currentIndex = 0;
  Timer? _timer;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.12,
    ).chain(CurveTween(curve: Curves.elasticInOut)).animate(_controller);

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (currentIndex < words.length - 1) {
        setState(() {
          currentIndex++;
        });
        _controller.forward(from: 0);
      } else {
        timer.cancel();
        GoRouter.of(context).push(AppRoutes.loginScreen);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String currentWord = words[currentIndex];

    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: IntrinsicWidth(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.r5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.r8),
              gradient: const LinearGradient(
                colors: [AppColor.kPrimaryPink, AppColor.kTagsColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.5, 0.7],
              ),
            ),
            child: Text(currentWord, style: Styling.textStyle50),
          ),
        ),
      ),
    );
  }
}
