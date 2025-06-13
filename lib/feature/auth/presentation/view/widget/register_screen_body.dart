import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/check_agree_terms.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_sign_with_auth.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custome_alternative_sign_in.dart';

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
              SizedBox(height: AppDimensions.h70),
              const CustomTitle(
                title: 'Creat Your Account',
              ),
              SizedBox(height: AppDimensions.h58),
              const CustomTextField(hint: 'Your Name'),
              SizedBox(height: AppDimensions.h5,),
              const CustomTextField(hint: 'Last Name'),
              SizedBox(height: AppDimensions.h5,),
              const CustomTextField(hint: 'Email'),
              SizedBox(height: AppDimensions.h5,),
              const CustomTextField(hint: 'Phone number'),
              SizedBox(height: AppDimensions.h5,),
              const CustomTextField(hint: 'Password', password_flag: true),
              SizedBox(height: AppDimensions.h20),
              CheckAgreeTerms(),
              SizedBox(height: AppDimensions.h47),
              CustomButton(onTap: () {}, name: 'Sign up'),
              SizedBox(height: AppDimensions.h41),
              const CustomSignWithAuth(),
              SizedBox(height: AppDimensions.h23),
              const CustomAlternativeSignIn(),
              SizedBox(height: AppDimensions.h20),
              CustomAlreadySignIn(onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}