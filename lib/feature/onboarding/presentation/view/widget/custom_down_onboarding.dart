import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomDownOnboarding extends StatelessWidget {
  const CustomDownOnboarding({
    super.key,
    required this.pageController,
    required this.index, required this.onTap,
  });

  final PageController pageController;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppDimensions.h49,
      left: AppDimensions.r25,
      right: AppDimensions.r25,
      child: Row(
        children: [
          const Spacer(),
          SizedBox(width: AppDimensions.w20),
          SmoothPageIndicator(
            controller: pageController,
            count: 2,
            effect: CustomizableEffect(
              activeDotDecoration: DotDecoration(
                color: AppColor.kLightPink,
                width: AppDimensions.r11,
                height: AppDimensions.r11,
                borderRadius: BorderRadius.circular(AppDimensions.r8),
              ),
              dotDecoration: DotDecoration(
                color: AppColor.kDotIndicator,
                width: AppDimensions.r8,
                height: AppDimensions.r8,
                borderRadius: BorderRadius.circular(AppDimensions.r8),
              ),
              spacing: AppDimensions.r8,
            ),
          ),

          const Spacer(),
          InkWell(
            onTap: onTap,
            splashColor: AppColor.kLightPink,
            child: Container(
              width: AppDimensions.w54,
              height: AppDimensions.w45,

              decoration: ShapeDecoration(
                color: AppColor.kPrimaryPink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.r8),
                ),
              ),
              child: Icon(
                CupertinoIcons.arrow_right,
                size: AppDimensions.r30,
                color: AppColor.kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
