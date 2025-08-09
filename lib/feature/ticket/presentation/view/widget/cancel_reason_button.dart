import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CancelReasonButton extends StatelessWidget {
  const CancelReasonButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.width,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: AppDimensions.h61,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.kPrimaryPink : AppColor.kWhite,
          borderRadius: BorderRadius.circular(AppDimensions.r15),
          boxShadow: const [
            BoxShadow(
              color: AppColor.kBoxShadowColor,
              blurRadius: 14,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: isSelected
                ? Styling.textStyle13600Pink.copyWith(color: AppColor.kWhite)
                : Styling.textStyle13600Pink.copyWith(
                    color: AppColor.kColorOnboarding,
                  ),
          ),
        ),
      ),
    );
  }
}
