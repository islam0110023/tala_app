import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            ? Border.all(color: Colors.grey, width: 2.r)
            : null,
        image: DecorationImage(image: img, fit: BoxFit.cover),
      ),
    );
  }
}
