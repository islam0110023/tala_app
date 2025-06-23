import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_otp.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
      child: Column(
        children: [
          SizedBox(height: AppDimensions.h47),
          CustomArrowBack(onTap: () {}),
          SizedBox(height: AppDimensions.h42),
          CustomTitle(title: LocaleKeys.verifyCode.tr(), textFont: 28),
          SizedBox(height: AppDimensions.h28),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              LocaleKeys.pleaseEnterCode.tr(),
              style: Styling.textStyleGray16,
            ),
          ),
          Text(
            'example@gmail.com',
            style: Styling.textStyle16.copyWith(color: AppColor.kPrimaryPink),
          ),
          SizedBox(height: AppDimensions.h23),
          Text(LocaleKeys.orToNumber.tr(), style: Styling.textStyleGray16),
          Text(
            '+963 -----',
            style: Styling.textStyle16.copyWith(color: AppColor.kPrimaryPink),
          ),
          SizedBox(height: AppDimensions.h23),
          const CustomFieldsOtp(),
          SizedBox(height: AppDimensions.h32),
          Text(LocaleKeys.didntReceiveOtp.tr(), style: Styling.textStyle15),
          SizedBox(height: AppDimensions.h16),
          Text(
            LocaleKeys.resendCode.tr(),

            textAlign: TextAlign.center,
            style: Styling.textStyleBlack15,
          ),
          SizedBox(height: AppDimensions.h70),
          CustomButton(onTap: () {}, name: LocaleKeys.verify.tr()),
        ],
      ),
    );
  }
}

