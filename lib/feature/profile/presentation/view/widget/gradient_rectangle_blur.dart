import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class GradientRectangleBlur extends StatelessWidget {
  const GradientRectangleBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: AppDimensions.w600,
      child: Container(
        transform: Matrix4.identity()
          ..translate(AppDimensions.w_80, AppDimensions.h_250)
          ..rotateZ(0),
        width: double.infinity,
        height: AppDimensions.h800,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius:MediaQuery.of(context).size.width<600? .6:.55,
            center: Alignment.center,
            colors: [AppColor.kPrimaryPink.withAlpha(192), AppColor.kWhite],
            stops: const [0.3, 1],
          ),
        ),
      ),
    );
  }
}
