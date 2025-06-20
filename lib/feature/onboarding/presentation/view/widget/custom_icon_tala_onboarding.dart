import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';

class CustomIconTalaOnBoarding extends StatelessWidget {
  const CustomIconTalaOnBoarding({
    super.key,
    required this.top,
    required this.left,
  });
  final double top, left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.width < 600 ? top : top * .9,
      left: MediaQuery.of(context).size.width < 600 ? left : left * 0.65,
      child: SvgPicture.asset(
        AppImage.kMashbakIcon,
        width: AppDimensions.r30,
        height: AppDimensions.r30,
      ),
    );
  }
}
