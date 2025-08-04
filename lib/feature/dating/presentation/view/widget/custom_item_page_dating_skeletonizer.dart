import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomItemPageDatingSkeletonizer extends StatelessWidget {
  const CustomItemPageDatingSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.kOnboarding1),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Container(
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
                  AppColor.kVibrantRoseGlow,
                ],
                stops: [0.2, .5, .7],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Unknown', style: Styling.textStyle32),
                Text('23 years, Unknown', style: Styling.textStyle18),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Text('• Unknown', style: Styling.textStyle14);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
