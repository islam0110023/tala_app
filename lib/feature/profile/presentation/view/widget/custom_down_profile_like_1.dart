import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_button.dart';

class CustomDownProfileLike1 extends StatelessWidget {
  const CustomDownProfileLike1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(onTap: () {}, name: 'Next'),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}
