import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomContainerProfileImage extends StatelessWidget {
  const CustomContainerProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.w145,
      height: AppDimensions.h145,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: AppColor.kBoxShadowColor,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        CupertinoIcons.person,
        size: 85.sp,
        color: AppColor.kPrimaryPink,
      ),
    );
  }
}