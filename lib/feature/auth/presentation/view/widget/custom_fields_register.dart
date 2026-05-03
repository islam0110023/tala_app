import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsRegister extends StatelessWidget {
  const CustomFieldsRegister({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.onChanged,
  });
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController password;
  final void Function(PhoneNumber)? onChanged;

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
        IntlPhoneField(
          onChanged: onChanged,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: LocaleKeys.phoneNumber.tr(),
            fillColor: AppColor.kTextFieldColor,
            filled: true,
            hintStyle: Styling.textStyle13,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppDimensions.r16,
              vertical: AppDimensions.r20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.r15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.r15),
              borderSide: BorderSide(
                color: AppColor.kPrimaryPink,
                width: AppDimensions.w2_2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppDimensions.r15),
            ),
          ),
          validator: (value) {
            if (value == null || value.number.isEmpty) {
              return '${LocaleKeys.please_enter.tr()} ${LocaleKeys.phoneNumber.tr()}';
            }
            return null;
          },
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
