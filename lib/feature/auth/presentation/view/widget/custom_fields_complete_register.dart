import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsCompleteRegister extends StatelessWidget {
  const CustomFieldsCompleteRegister({
    super.key,
    required this.yourNameController,
    required this.lastNameController,
    required this.phoneNumberController,
  });
  final TextEditingController yourNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: LocaleKeys.yourName.tr(),
          controller: yourNameController,
        ),
        SizedBox(height: AppDimensions.h18),
        CustomTextField(
          hint: LocaleKeys.lastName.tr(),
          controller: lastNameController,
        ),
        SizedBox(height: AppDimensions.h18),
        CustomTextField(
          hint: LocaleKeys.phoneNumber.tr(),
          textInputType: TextInputType.phone,
          controller: phoneNumberController,
        ),
        SizedBox(height: AppDimensions.h18),
      ],
    );
  }
}
