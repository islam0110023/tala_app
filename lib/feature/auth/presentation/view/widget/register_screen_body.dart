import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_alternative_sign_up.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_form_register.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_sign_with_auth.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.h47),

              CustomArrowBack(
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
              SizedBox(height: AppDimensions.h28),
              CustomTitle(title: LocaleKeys.createAccount.tr()),
              const CustomFormRegister(),
              SizedBox(height: AppDimensions.h41),
              const CustomSignWithAuth(),
              SizedBox(height: AppDimensions.h23),
              const CustomAlternativeSignUp(),
              SizedBox(height: AppDimensions.h20),
              CustomAlreadySignIn(
                name1: LocaleKeys.alreadyHaveAccount.tr(),
                name2: LocaleKeys.signIn.tr(),
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
