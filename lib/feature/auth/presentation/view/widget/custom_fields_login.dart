import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_forget_password_login.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsLogin extends StatelessWidget {
  const CustomFieldsLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(hint: LocaleKeys.emailOrPhone.tr()),
        SizedBox(height: AppDimensions.h23),
        CustomTextField(hint: LocaleKeys.password.tr(), password_flag: true),
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
