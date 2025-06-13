import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';

class CustomFieldsRegister extends StatelessWidget {
  const CustomFieldsRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h51),
        const CustomTextField(hint: 'Your Name'),
        SizedBox(height: AppDimensions.h5),
        const CustomTextField(hint: 'Last Name'),
        SizedBox(height: AppDimensions.h5),
        const CustomTextField(
          hint: 'Email',
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: AppDimensions.h5),
        const CustomTextField(
          hint: 'Phone number',
          textInputType: TextInputType.phone,
        ),
        SizedBox(height: AppDimensions.h5),
        const CustomTextField(hint: 'Password', password_flag: true),
        SizedBox(height: AppDimensions.h20),
      ],
    );
  }
}
