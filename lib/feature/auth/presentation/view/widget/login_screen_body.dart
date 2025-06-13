import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_forget_password_login.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_sign_with_auth.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custome_alternative_sign_in.dart';

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
          child: Column(
            children: [
              SizedBox(height: AppDimensions.h47),
              CustomArrowBack(onTap: () {
                GoRouter.of(context).pop();
              }),
              SizedBox(height: AppDimensions.h33),
              const CustomTitle(
                title: 'Ready To Make Unforgettable\nMemories Again?',
              ),
              SizedBox(height: AppDimensions.h49),
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
              CustomButton(onTap: () {}, name: 'Login'),
              SizedBox(height: AppDimensions.h167),
              const CustomSignWithAuth(),
              SizedBox(height: AppDimensions.h16),
              const CustomAlternativeSignIn(),
              SizedBox(height: AppDimensions.h31),
              CustomAlreadySignIn(
                name2: 'Sign Up Now!',
                name1: 'New to the scene?',
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.registerScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
