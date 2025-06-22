import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_drop_down_profile.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_text_field_profile.dart';

class CustomFieldsProfileLike2 extends StatelessWidget {
  const CustomFieldsProfileLike2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDownProfile(
          hint: 'Choose what you like',
          options: AppConstant.kWords,
          label: 'Do you enjoy traveling for concerts or prefer local shows?',
        ),
        SizedBox(height: AppDimensions.h16),
        const CustomTextFieldProfile(
          hint: "Describe the best concert you've ever attended",
          label: ' What’s the best concert you’ve ever attended and why?',
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownProfile(
          hint: 'Write how you usually find new music',
          options: AppConstant.kWords,
          label: 'How do you usually discover new music? ',
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownProfile(
          hint: 'Enter your thoughts',
          options: AppConstant.kWords,
          label:
              'Do you prefer attending concert with friends, or with a date?',
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownProfile(
          options: AppConstant.kWords,
          label:
              'How far would you travel to see your favorite artist or band perform?',
          hint: 'Write how far you would travel for a concert',
        ),
      ],
    );
  }
}
