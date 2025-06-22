import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomSignWithAuth extends StatelessWidget {
  const CustomSignWithAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: AppDimensions.w40,
          height: AppDimensions.h1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.kWhite, AppColor.kLightGray],
              stops: const [0, .5],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.r8),
          child: Text(LocaleKeys.orSignInWith.tr(), style: Styling.textStyle15),
        ),
        Container(
          width: AppDimensions.w40,
          height: AppDimensions.h1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.kWhite, AppColor.kLightGray],
              stops: const [0, .5],
            ),
          ),
        ),
      ],
    );
  }
}
