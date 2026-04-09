import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomRoundedIcon extends StatelessWidget {
  const CustomRoundedIcon({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.r50,
      height: AppDimensions.r50,
      decoration: const ShapeDecoration(
        color: AppColor.kWhite1,
        shape: OvalBorder(),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColor.kPrimaryPink, size: AppDimensions.r24),
      ),
    );
  }
}
