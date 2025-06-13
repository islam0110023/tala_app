import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';

class CustomFieldsNewPassword extends StatelessWidget {
  const CustomFieldsNewPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          hint: 'Password',
          password_flag: true,
        ),
        SizedBox(height: AppDimensions.h18),
        const CustomTextField(
          hint: 'Confirm Password',
          password_flag: true,
        ),
      ],
    );
  }
}
