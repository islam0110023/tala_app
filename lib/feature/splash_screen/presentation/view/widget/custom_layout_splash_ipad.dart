import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/asset_image.dart';

class CustomLayoutSplashIpad extends StatelessWidget {
  const CustomLayoutSplashIpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 2.2.h,
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
