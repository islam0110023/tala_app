import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({
    super.key, required this.onTap, required this.text,
  });
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppDimensions.w212,
        height: AppDimensions.h36,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColor.kPrimaryPink,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.r20),
          boxShadow: const [
            BoxShadow(
              color: AppColor.kBoxShadowColor,
              blurRadius: 6,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: Styling.homeTextButton,
          ),
        ),
      ),
    );
  }
}