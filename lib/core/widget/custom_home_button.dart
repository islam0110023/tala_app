import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        width: AppDimensions.w212,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.r11,
        ),
        decoration: BoxDecoration(
          color: AppColor.kWhite1,
          border: Border.all(
            color: AppColor.kPrimaryPink,
            width: AppDimensions.r2,
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
        child: Text(text, style: Styling.homeTextButton),
      ),
    );
  }
}
