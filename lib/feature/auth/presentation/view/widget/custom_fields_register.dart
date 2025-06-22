import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsRegister extends StatelessWidget {
  const CustomFieldsRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h51),
        CustomTextField(hint:LocaleKeys.yourName.tr()),
        SizedBox(height: AppDimensions.h5),
        CustomTextField(hint:LocaleKeys.lastName.tr()),
        SizedBox(height: AppDimensions.h5),
        CustomTextField(
          hint:LocaleKeys.email.tr(),
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: AppDimensions.h5),
        CustomTextField(
          hint:LocaleKeys.phoneNumber.tr(),
          textInputType: TextInputType.phone,
        ),
        SizedBox(height: AppDimensions.h5),
        CustomTextField(hint: LocaleKeys.password.tr(), password_flag: true),
        SizedBox(height: AppDimensions.h20),
      ],
    );
  }
}
