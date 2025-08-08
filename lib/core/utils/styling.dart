import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/constants.dart';

abstract class Styling {
  static final textStyle20 = TextStyle(
    color: AppColor.kBlack,
    fontSize: 20.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w800,
  );
  static final textStyle10 = TextStyle(
    color: AppColor.kWhite1,
    fontSize: 10.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w800,
  );
  static final textStyleB20 = TextStyle(
    color: AppColor.kWhite,
    fontSize: 20.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w800,
  );
  static final textStyle16 = TextStyle(
    color: AppColor.kBlack,
    fontSize: 16.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w400,
  );
  static final textStyleB16 = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 16.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
    decorationColor: AppColor.kPrimaryPink,
  );
  static final textStyleB12 = TextStyle(
    color: AppColor.kMediumPurple,
    fontSize: 12.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    decorationColor: AppColor.kMediumPurple,
  );
  static final textStyle15 = TextStyle(
    color: AppColor.kGray,
    fontSize: 15.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final textStyle13 = TextStyle(
    color: AppColor.kBlack.withAlpha(128),
    fontSize: 13.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w500,
  );
  static final textStyleBlack12 = TextStyle(
    color: AppColor.kBlack,
    fontSize: 12.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w400,
  );
  static final textStyleGray16 = TextStyle(
    color: AppColor.kGray,
    fontSize: 16.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final textStyle36 = TextStyle(
    color: AppColor.kWhite,
    fontSize: 36.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.30,
  );
  static final textStyle50 = TextStyle(
    color: AppColor.kBlack,
    fontSize: 50.sp,
    fontFamily: AppConstant.kFontFamilyInter,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.30.h,
  );
  static final textStyle45 = TextStyle(
    color: AppColor.kBlack,
    fontSize: 45.sp,
    fontFamily: AppConstant.kFontFamilyInter,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.30.h,
  );
  static final textStyle16700 = TextStyle(
    color: AppColor.kWhite,
    fontSize: 16.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final textStyle18 = TextStyle(
    color: AppColor.kWhite,
    fontSize: 18.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final textStyleP20 = TextStyle(
    color: AppColor.kColorOnboarding,
    fontSize: 20.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final textStyleBlack15 = TextStyle(
    color: AppColor.kBlack1,
    fontSize: 15.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
  static final nameChatStyle = TextStyle(
    color: AppColor.kColorOnboarding,
    fontSize: 14.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final chatsHintStyle = TextStyle(
    color: AppColor.kColorOnboarding,
    fontSize: 10.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final timeChatStyle = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 10.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final messageNumberStyle = TextStyle(
    color: AppColor.kWhite,
    fontSize: 8.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final chatNumberStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final chatStateStyle = TextStyle(
    color: AppColor.kGray,
    fontSize: 11.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final searchHintStyle = TextStyle(
    color: AppColor.kColorOnboarding,
    fontSize: 12.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final chatFieldStyle = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 10.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final tabStyle = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 16.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final searchHomeHintStyle = TextStyle(
    color: AppColor.kGray,
    fontSize: 14.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w500,
  );
  static final homeTextButton = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 15.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final textSpanKeyStyle = TextStyle(
    color: AppColor.kColorOnboarding,
    fontSize: 10.40.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final textSpanValueStyle = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 10.40.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w400,
  );
  static final homeContainerLabelStyle = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 15.13.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w500,
  );
  static final textNavBar = TextStyle(
    fontSize: 12.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final textStyle18700Purple = TextStyle(
    color: AppColor.kColorOnboarding,
    fontSize: 18.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final textStyle14700White = TextStyle(
    color: AppColor.kWhite,
    fontSize: 14.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
    height: 1.29,
  );
  static final textStyle10700LightGray = TextStyle(
    color: AppColor.kLightGray,
    fontSize: 10.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
    height: 1.80,
  );
  static final textStyle13600Pink = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 13.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.38,
  );
  static final textStyle11400Black = TextStyle(
    color: AppColor.kBlack,
    fontSize: 11.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w400,
    height: 1.27,
  );
  static final textStyle32 = TextStyle(
    color: AppColor.kWhite1,
    fontSize: 32.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w800,
  );
  static final textStyle14 = TextStyle(
    color: AppColor.kWhite1,
    fontSize: 14.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static final textStyleDating20 = TextStyle(
    color: AppColor.kColorDatingTitle ,
    fontSize: 20.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static final textStyle18800Purple = TextStyle(
    color: AppColor.kColorDatingTitle,
    fontSize: 18.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w800,
  );
  static final textStyleEventTitle = TextStyle(
    color: AppColor.kWhite,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstant.kFontFamily,
    fontSize: 12.sp,
    shadows: const [
      Shadow(
        color: AppColor.kBlack54,
        blurRadius: 6,
      )
    ],
  );
  static final textStyle12900PrimaryPink = TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 12.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w900,
    height: 1.50,
  );
  static final textStyle8900PrimaryPink= TextStyle(
    color: AppColor.kPrimaryPink,
    fontSize: 8.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w900,
    height: 1.50,
  );
  static final textStyle10600Ticket = TextStyle(
    color: AppColor.kTicketDetails,
    fontSize: 12.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
    height: 1.26,
  );
  static final textStyle16800Purple = textStyle18800Purple.copyWith(fontSize: 14.sp);
  static final textStyle12600ReviewInfo = TextStyle(
    color: AppColor.kTicketReviewText,
    fontSize: 12.sp,
    fontFamily: AppConstant.kFontFamily,
    fontWeight: FontWeight.w600,
  );


}
