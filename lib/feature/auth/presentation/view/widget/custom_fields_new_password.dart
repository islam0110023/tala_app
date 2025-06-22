import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsNewPassword extends StatelessWidget {
  const CustomFieldsNewPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: LocaleKeys.password.tr(),
          password_flag: true,
        ),
        SizedBox(height: AppDimensions.h18),
        CustomTextField(
          hint: LocaleKeys.confirmPassword.tr(),
          password_flag: true,
        ),
      ],
    );
  }
}
