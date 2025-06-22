import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_images_shader.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_images_tala_on_boarding.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_nav_tala_on_boarding.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_oval_dashes_tala_on_boarding.dart';

class OnboardingTalaScreenBody extends StatelessWidget {
  const OnboardingTalaScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        const CustomOvalDashesTalaOnBoarding(),
        const CustomImagesTalaOnBoarding(),
        const CustomImagesShader(),
        CustomNavTalaOnBoarding(onTap: () {
          GoRouter.of(context).push(AppRoutes.loginScreen);
        }),
      ],
    );
  }
}



