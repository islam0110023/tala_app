import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_icon_tala_onboarding.dart';

class CustomImageTalaOnBoarding extends StatelessWidget {
  const CustomImageTalaOnBoarding({
    super.key,
    required this.left,
    required this.top,
    required this.image,
    required this.angle,
  });
  final double left, top;
  final String image;
  final double angle;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: [
            Transform.rotate(
              angle: angle,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                width: AppDimensions.r110,
                height: AppDimensions.r110,
              ),
            ),
            CustomIconTalaOnBoarding(
              top: -AppDimensions.h40,
              left: AppDimensions.w65,
            ),
          ],
        ),
      ),
    );
  }
}
