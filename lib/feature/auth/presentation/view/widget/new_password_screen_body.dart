import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_sign_with_auth.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custome_alternative_sign_in.dart';

class NewPasswordScreenBody extends StatelessWidget {
  const NewPasswordScreenBody({super.key});

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
                title: 'New Password',
              ),
              SizedBox(height: AppDimensions.h7),
              Text(
                  'Your new password must be different from\npreviously used passwords',
                  textAlign: TextAlign.center,
                  style:Styling.textStyleGray16
              ),
              SizedBox(height: AppDimensions.h33,),
              const CustomTextField(hint: 'Password',password_flag: true,),
              SizedBox(height: AppDimensions.h18),
              const CustomTextField(hint: 'Confirm Password', password_flag: true),
              SizedBox(height: AppDimensions.h51),
              CustomButton(onTap: () {}, name: 'Creat New Password'),
            ],
          ),
        ),
      ),
    );
  }
}

