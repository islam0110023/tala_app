import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomPageTextBody extends StatelessWidget {
  const CustomPageTextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h42),
        CustomTitle(title: LocaleKeys.verifyCode.tr(), textFont: 28),
        SizedBox(height: AppDimensions.h28),
        Text(
          LocaleKeys.pleaseEnterCode.tr(),
          style: Styling.textStyleGray16,
          textAlign: TextAlign.center,
        ),
        Text(
          '${FirebaseAuth.instance.currentUser?.email ?? 'example@gmail.com'}',
          style: Styling.textStyle16.copyWith(color: AppColor.kPrimaryPink),
        ),
        Lottie.asset(AppImage.kClockLottie, height: 250.h),

        // SizedBox(height: AppDimensions.h23),
        // Text(LocaleKeys.orToNumber.tr(), style: Styling.textStyleGray16),
        // Text(
        //   '+963 -----',
        //   style: Styling.textStyle16.copyWith(color: AppColor.kPrimaryPink),
        // ),
        SizedBox(height: AppDimensions.h23),
      ],
    );
  }
}
