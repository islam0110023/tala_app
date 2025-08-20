import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomInfoReviewCard extends StatelessWidget {
  const CustomInfoReviewCard({
    super.key, required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.r10),
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.circular(AppDimensions.r20),
        border: Border.all(color: AppColor.kPrimaryPink, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.r8,
          vertical: AppDimensions.r24,
        ),
        child: widget,
      ),
    );
  }
}