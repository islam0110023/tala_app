import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomRoundedIcon extends StatelessWidget {
  const CustomRoundedIcon({
    super.key, required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.r50,
      height: AppDimensions.r50,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(),
      ),
      child: IconButton(onPressed: (){}, icon: Icon(icon,color: AppColor.kPrimaryPink)),
    );
  }
}