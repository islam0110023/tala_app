import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
    required this.onTap,
    this.arrowColor = AppColor.kLightPink,
  });
  final VoidCallback onTap;
  final Color arrowColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.r30),
        child: Icon(Icons.arrow_back_ios_new, color: arrowColor),
      ),
    );
  }
}
