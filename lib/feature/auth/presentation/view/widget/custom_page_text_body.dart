import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomPageTextBody extends StatelessWidget {
  const CustomPageTextBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}