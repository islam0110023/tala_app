import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomFirstCardDating extends StatelessWidget {
  const CustomFirstCardDating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: AppDimensions.h377,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.kLightCloud,
              AppColor.kSoftPinkAura,
              AppColor.kVibrantRoseGlow
            ],
            stops: [0.2, .5, .7],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Elena', style: Styling.textStyle32),
            Text('23 years,Mönchen', style: Styling.textStyle18),
            Text('• Hiking', style: Styling.textStyle14),
          ],
        ),
      ),
    );
  }
}
