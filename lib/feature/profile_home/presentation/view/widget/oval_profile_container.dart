import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class OvalProfileContainer extends StatelessWidget {
  const OvalProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -AppDimensions.h200,
      left: -AppDimensions.w10,
      child: Container(
        width: AppDimensions.w667,
        height: AppDimensions.h532,
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, 0.00),
            end: Alignment(1.62, 0.97),
            colors: [AppColor.kContainerGradient1, AppColor.kContainerGradient2],
          ),
          shape: OvalBorder(),
          shadows: [
            BoxShadow(
              color: AppColor.kBoxShadowColor,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
