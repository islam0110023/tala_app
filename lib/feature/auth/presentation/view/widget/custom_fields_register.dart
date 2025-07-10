import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsRegister extends StatelessWidget {
  const CustomFieldsRegister({super.key, required this.firstName, required this.lastName, required this.email, required this.phone, required this.password});
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h51),
        CustomTextField(hint: LocaleKeys.yourName.tr(), controller: firstName),
        SizedBox(height: AppDimensions.h5),
        CustomTextField(hint: LocaleKeys.lastName.tr(), controller: lastName),
        SizedBox(height: AppDimensions.h5),
        CustomTextField(
          hint: LocaleKeys.email.tr(),
          textInputType: TextInputType.emailAddress,
          controller: email,
        ),
        SizedBox(height: AppDimensions.h5),
        CustomTextField(
          hint: LocaleKeys.phoneNumber.tr(),
          textInputType: TextInputType.phone,
          controller: phone,
        ),
        SizedBox(height: AppDimensions.h5),
        CustomTextField(
          hint: LocaleKeys.password.tr(),
          password_flag: true,
          controller: password,
        ),
        SizedBox(height: AppDimensions.h20),
      ],
    );
  }
}
