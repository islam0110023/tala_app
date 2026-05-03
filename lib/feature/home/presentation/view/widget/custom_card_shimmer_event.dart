import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/shimmer_effect.dart';

class CustomCardShimmerEvent extends StatelessWidget {
  const CustomCardShimmerEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.r8),

      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColor.kContainerGradient, AppColor.kWhite1],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        border: Border.all(
          color: AppColor.kHomeContainerBorder,
          width: AppDimensions.r2,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.r20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerEffect(
            width: double.infinity,
            height: 240.h,
          ),
          SizedBox(height: AppDimensions.h10),
          ShimmerEffect(
            width: 250.w,
            height: 24.h,
          ),
          SizedBox(height: AppDimensions.h10),
          ShimmerEffect(
            width: 200.w,
            height: 20.h,
          ),
          SizedBox(height: AppDimensions.h10),
          ShimmerEffect(
            width: 200.w,
            height: 20.h,
          ),
          SizedBox(height: AppDimensions.h10),
          Align(
            alignment: Alignment.center,
            child: ShimmerEffect(
              width: 212.w,
              height: 36.h,
            ),
          ),
        ],
      ),
    );
  }
}
