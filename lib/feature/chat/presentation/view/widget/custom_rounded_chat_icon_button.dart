import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomRoundedChatButton extends StatelessWidget {
  const CustomRoundedChatButton({
    super.key,
    required this.icon,
    this.isPrimary = true,
    required this.radius,
    required this.onPressed,
  });
  final IconData icon;
  final bool isPrimary;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: ShapeDecoration(
        color: (isPrimary) ? AppColor.kWhite : AppColor.kPrimaryPink,
        shape: OvalBorder(
          side: BorderSide(
            width: AppDimensions.r2,
            color: AppColor.kBorderChatColor,
          ),
        ),
        shadows: (isPrimary)
            ? const [
                BoxShadow(
                  color: AppColor.kBorderShadowColor,
                  blurRadius: 14,
                  offset: Offset(5, 5),
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: AppDimensions.r24,
          color: (isPrimary) ? AppColor.kPrimaryPink : AppColor.kWhite,
        ),
      ),
    );
  }
}
