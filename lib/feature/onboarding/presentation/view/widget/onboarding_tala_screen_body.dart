import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_image_tala_onboarding.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_image_text_onboarding.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_oval_dash_over_flow.dart';

class OnboardingTalaScreenBody extends StatelessWidget {
  const OnboardingTalaScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        CustomOvalDashOverFlow(x: AppDimensions.w125, y: -AppDimensions.h740),
        CustomOvalDashOverFlow(x: -AppDimensions.w125, y: -AppDimensions.h590),
        CustomOvalDashOverFlow(x: AppDimensions.w100, y: -AppDimensions.h470),
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
        Align(
          alignment: Alignment(
            0,
            MediaQuery.of(context).size.width < 600 ? 0.4 : 0.3,
          ),
          child: TextImageShader(
            width: AppDimensions.w150,
            name: 'TALA',
            textStyle: Styling.textStyle50,
          ),
        ),

        Align(
          alignment: Alignment(0, .58),
          child: Image.asset('assets/images/Frame 5415.png', width: 238.w),
        ),
        Align(
          alignment: MediaQuery.of(context).size.width < 600
              ? Alignment(-.19, .67)
              : Alignment(-.14, .67),
          child: Image.asset('assets/images/Frame 5416.png', width: 190.w),
        ),
      ],
    );
  }
}
