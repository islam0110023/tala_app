import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_image_tala_onboarding.dart';

class CustomImagesTalaOnBoarding extends StatelessWidget {
  const CustomImagesTalaOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,

      children: [
        CustomImageTalaOnBoarding(
          angle: 1,
          top: MediaQuery.of(context).size.width < 600
              ? AppDimensions.h90
              : AppDimensions.h90 * 1.15,
          left: AppDimensions.w65,
          image: AppImage.kImageTalaOnboarding1,
        ),

        CustomImageTalaOnBoarding(
          angle: 1,
          top: MediaQuery.of(context).size.width < 600
              ? AppDimensions.h200
              : AppDimensions.h200 * 1.2,
          left: MediaQuery.of(context).size.width < 600
              ? AppDimensions.w260
              : AppDimensions.w260 * 1.35,
          image: AppImage.kImageTalaOnboarding2,
        ),
        CustomImageTalaOnBoarding(
          angle: 1,
          top: MediaQuery.of(context).size.width < 600
              ? AppDimensions.h395
              : AppDimensions.h395 * 1.15,
          left: MediaQuery.of(context).size.width < 600
              ? AppDimensions.w115
              : AppDimensions.w115 * 1.35,
          image: AppImage.kImageTalaOnboarding3,
        ),
      ],
    );
  }
}
