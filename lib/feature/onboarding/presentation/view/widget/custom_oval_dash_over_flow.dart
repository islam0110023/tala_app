import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomOvalDashOverFlow extends StatelessWidget {
  const CustomOvalDashOverFlow({super.key, required this.x, required this.y});
  final double x, y;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: MediaQuery.of(context).size.width < 600
          ? Offset(x, y)
          : Offset(x*0.8, y*1.1),
      child: OverflowBox(
        maxWidth: double.infinity,
        child: DottedBorder(
          options: OvalDottedBorderOptions(
            dashPattern: [15, 10],
            strokeWidth: AppDimensions.r2,
            color: AppColor.kTitleColor,
          ),
          child: SizedBox(
            width: AppDimensions.w824,
            height: AppDimensions.h900,
          ),
        ),
      ),
    );
  }
}
