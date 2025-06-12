import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomSignWithIcon extends StatelessWidget {
  const CustomSignWithIcon({super.key, required this.img, required this.onTap});
  final VoidCallback onTap;
  final String img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.r40,
        height: AppDimensions.r40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: AppColor.kLightGray,
            width: AppDimensions.w0_6,
          ),
        ),
        child: SvgPicture.asset(
          img,
          width: AppDimensions.r24,
          height: AppDimensions.r24,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
