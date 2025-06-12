import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';

class CustomLayoutSplashIpad extends StatelessWidget {
  const CustomLayoutSplashIpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: AppDimensions.w2_2,
      child: Stack(
        clipBehavior: Clip.none,

        children: [
          Positioned(
            child: SizedBox(
              width: 400,
              child: Image.asset(AppImage.kLogoImage),
            ),
          ),
          Positioned(
            top: 300,
            left: 105,
            child: SizedBox(
              width: 200,
              child: Image.asset(AppImage.kTalaImage, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
