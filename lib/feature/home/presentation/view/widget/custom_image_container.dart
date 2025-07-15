import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.h240,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage(AppImage.kImageTest),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r20),
        ),
      ),
    );
  }
}
