import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class GradientRectangleBlur extends StatelessWidget {
  const GradientRectangleBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.identity()
        ..translate(0.0, AppDimensions.h_250)
        ..rotateZ(0),
      width: double.infinity,
      height: AppDimensions.h800,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius:MediaQuery.of(context).size.width<600? .7:.55,
          center: Alignment.center,
          colors: [AppColor.kPrimaryPink.withAlpha(192), AppColor.kWhite],
          stops: const [0.5, 1],
        ),
      ),
    );
  }
}
