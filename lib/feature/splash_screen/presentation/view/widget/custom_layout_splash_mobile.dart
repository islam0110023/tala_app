import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/asset_image.dart';

class CustomLayoutSplashMobile extends StatelessWidget {
  const CustomLayoutSplashMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final heightF = 2.5.h;
    return Center(
      heightFactor: heightF,
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
