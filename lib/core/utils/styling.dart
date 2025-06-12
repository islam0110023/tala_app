import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/constants.dart';

abstract class Styling{

  static final textStyle20=TextStyle(
    color: AppColor.kBlack,
    fontSize: 20.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w800,
  );
  static final textStyleB20=TextStyle(
    color: AppColor.kWhite,
    fontSize: 20.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w800,
  );
  static final textStyle16=TextStyle(
    color: AppColor.kBlack,
    fontSize: 16.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w400,
  );
  static final textStyleB16=TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 16.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
    decorationColor: AppColor.kPrimaryPink,
  );
  static final textStyleB12=TextStyle(
    color: AppColor.kMediumPurple,
    fontSize: 12.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    decorationColor: AppColor.kMediumPurple,
  );
  static final textStyle15=TextStyle(
    color: AppColor.kGray,
    fontSize: 15.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final textStyle13=TextStyle(
    color: AppColor.kBlack.withAlpha(128),
    fontSize: 13.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w500,
  );

}