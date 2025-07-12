import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_action_login.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_login.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_upper_login.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

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
              CustomUpperLogin(),
              CustomFormLogin(),
              CustomActionLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
