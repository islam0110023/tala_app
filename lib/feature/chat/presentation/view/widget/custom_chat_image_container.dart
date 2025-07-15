import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomChatImageContainer extends StatelessWidget {
  const CustomChatImageContainer({
    super.key,
    required this.img,
    required this.radius,
    this.withBorder = false,
  });
  final AssetImage img;
  final double radius;

  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        border: (withBorder)
            ? Border.all(color: AppColor.kGray, width: AppDimensions.r2)
            : null,
        image: DecorationImage(image: img, fit: BoxFit.cover),
      ),
    );
  }
}
