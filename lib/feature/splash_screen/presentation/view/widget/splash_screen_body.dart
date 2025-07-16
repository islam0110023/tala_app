import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/widget/custom_layout_splash_ipad.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/widget/custom_layout_splash_mobile.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToOnboarding();
  }

  void navigateToOnboarding() {
    Future.delayed(const Duration(seconds: AppConstant.kDurationSplash), () {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
      } else {
        GoRouter.of(context).pushReplacement(AppRoutes.onBoardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppColor.kPurple),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.kLightPurple,
                AppColor.kLightPink,
                AppColor.kPrimaryPink,
              ],
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
