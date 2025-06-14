import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class GradientRectangleBlur extends StatelessWidget {
  const GradientRectangleBlur({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.identity()..translate(0.0, -230)..rotateZ(0.4),
      width: double.infinity,
      height: AppDimensions.h555,
      decoration: ShapeDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          colors: [AppColor.kPrimaryPink, AppColor.kWhite],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}