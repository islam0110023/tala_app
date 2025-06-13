import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_animate_container.dart';

class OnboardingTagScreenBody extends StatelessWidget {
  const OnboardingTagScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.kOnboarding2),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          const CustomAnimateContainer(),
          SizedBox(height: AppDimensions.h106,)
        ],
      ),
    );
  }
}
