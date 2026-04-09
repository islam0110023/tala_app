import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({
    super.key,
    this.isSelected = false,
    required this.text,
  });
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.w17,
        vertical: AppDimensions.h11,
      ),
      decoration: (!isSelected)
          ? BoxDecoration(
              border: GradientBoxBorder(
                gradient: const LinearGradient(
                  colors: [AppColor.kPrimaryPink, AppColor.kPurple],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                width: AppDimensions.r2,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.r25),
            )
          : null,
      child: Text(text),
    );
  }
}
