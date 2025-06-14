import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_button.dart';

class CustomActionPassions extends StatelessWidget {
  const CustomActionPassions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h32),
        CustomButton(onTap: () {}, name: 'Next'),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}