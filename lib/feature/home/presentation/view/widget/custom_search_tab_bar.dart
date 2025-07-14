import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomHomeSearch extends StatelessWidget {
  const CustomHomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppDimensions.h42,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColor.kPrimaryPink,
            width: 1.sp,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.r25),
          boxShadow: const [
            BoxShadow(
              color: AppColor.kBoxShadowColor,
              blurRadius: 6,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            hintText: 'Search...',
            hintStyle: Styling.searchHomeHintStyle
          ),
        ),
      ),
    );
  }
}