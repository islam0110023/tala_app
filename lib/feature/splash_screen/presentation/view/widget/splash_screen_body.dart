import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/widget/custom_layout_splash_ipad.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/widget/custom_layout_splash_mobile.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color(0x478B00B7)),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x4D8B00B7), Color(0xffff4f9d), Color(0xffDB0165)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0, .38, .87],
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return const CustomLayoutSplashIpad();
            } else {
              return const CustomLayoutSplashMobile();
            }
          },
        ),
      ],
    );
  }
}


