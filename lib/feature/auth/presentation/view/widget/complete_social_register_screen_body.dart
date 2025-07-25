import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_form_complete_social_register.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_upper_complete_register.dart';

class CompleteSocialRegisterScreenBody extends StatelessWidget {
  const CompleteSocialRegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
          child: const Column(
            children: [
              CustomUpperCompleteRegister(),
              CustomFormCompleteSocialRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
