import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomFieldsOtp extends StatelessWidget {
  const CustomFieldsOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: PinTheme(
        width: AppDimensions.w53,
        height: MediaQuery.of(context).size.width < 600
            ? AppDimensions.h45
            : AppDimensions.h45 * 1.5,
        textStyle: Styling.textStyle16,

        decoration: BoxDecoration(
          color: AppColor.kTextFieldColor,
          borderRadius: BorderRadius.circular(AppDimensions.r7),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: AppDimensions.w60,
        height: MediaQuery.of(context).size.width < 600
            ? AppDimensions.h52
            : AppDimensions.h52 * 1.5,
        textStyle: Styling.textStyleBlack12,
        decoration: BoxDecoration(
          color: AppColor.kTextFieldColor,
          borderRadius: BorderRadius.circular(AppDimensions.r7),
          border: Border.all(
            width: AppDimensions.r1_8,
            color: AppColor.kColorBorderOtp,
          ),
        ),
      ),
      autofocus: true,
    );
  }
}
