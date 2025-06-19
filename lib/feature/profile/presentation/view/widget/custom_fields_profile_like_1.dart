import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_drop_down_profile.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_text_field_profile.dart';

class CustomFieldsProfileLike1 extends StatelessWidget {
  const CustomFieldsProfileLike1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDropDownProfile(
          hint: 'Choose what you like',
          options: AppConstant.kWords,
          label: 'What genres of music do you enjoy the most?',
        ),
        SizedBox(height: AppDimensions.h16),
        const CustomTextFieldProfile(
          hint: 'write your top favorite artists or bands',
          label: ' Who are you top three favorite artists or bands?',
        ),
        SizedBox(height: AppDimensions.h16),

        const CustomDropDownProfile(
          hint: 'Write how often you attend live music events',
          options: AppConstant.kWords,
          label: 'How often do you attend live music events? ',
        ),
        SizedBox(height: AppDimensions.h16),

        const CustomDropDownProfile(
          hint: 'Enter your thoughts',
          options: AppConstant.kWords,
          label:
          'Are you passionate about discovering new artists or do you stick to your favorites?',
        ),
        SizedBox(height: AppDimensions.h16),

        const CustomTextFieldProfile(
          hint: 'Enter your favorite concert venue',
          label: 'What’s your favorite concert venue and why?',
        ),
      ],
    );
  }
}
