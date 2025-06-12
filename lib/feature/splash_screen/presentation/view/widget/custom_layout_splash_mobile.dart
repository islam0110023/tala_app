import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';

class CustomLayoutSplashMobile extends StatelessWidget {
  const CustomLayoutSplashMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: AppDimensions.w2_5,
      child: Stack(
        clipBehavior: Clip.none,

        children: [
          Positioned(
            child: SizedBox(
              width: 254,
              child: Image.asset(AppImage.kLogoImage),
            ),
          ),
          Positioned(
            top: 200,
            left: 70,
            child: SizedBox(
              width: 120,
              child: Image.asset(AppImage.kTalaImage, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
