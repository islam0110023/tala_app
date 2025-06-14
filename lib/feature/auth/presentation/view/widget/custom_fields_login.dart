import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_forget_password_login.dart';

class CustomFieldsLogin extends StatelessWidget {
  const CustomFieldsLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(hint: 'Email or Phone number'),
        SizedBox(height: AppDimensions.h23),
        const CustomTextField(hint: 'Password', password_flag: true),
        SizedBox(height: AppDimensions.h33),
        CustomForgetPasswordLogin(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.newPasswordScreen);
          },
        ),
        SizedBox(height: AppDimensions.h36),
      ],
    );
  }
}
