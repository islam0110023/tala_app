import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_sign_with_icon.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          SizedBox(height: 106),
          CustomTitle(title:'Ready To Make Unforgettable\nMemories Again?',),
          SizedBox(height: 49),
          CustomTextField(hint: 'Email or Phone number'),
          SizedBox(height: 23),
          CustomTextField(hint: 'Password', password_flag: true),
          SizedBox(height: 33),
          SizedBox(
            width: 343,
            child: Text(
              'Forget Password?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFB147C7),
                fontSize: 12,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
                decorationColor: const Color(0xFFB147C7),
              ),
            ),
          ),
          SizedBox(height: 36),
          CustomButton(),
          SizedBox(height: 167),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 1,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xffFFFFFF),
                        Color(0xff808080),
                  ])
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'or sign in with',
                  style: TextStyle(
                    color: const Color(0xFF808080),
                    fontSize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 1,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff808080),
                          Color(0xffFFFFFF),

                        ])
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSignWithIcon(img: AppImage.kAppleIcon, onTap: () {  },),
              SizedBox(width: 20),
              CustomSignWithIcon(img: AppImage.kGoogleIcon, onTap: () {  },)
            ],
          ),
          SizedBox(height: 32,),
          CustomAlreadySignIn(onTap: (){}),
        ],
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 309,
      height: 55,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF692A7E),
          fontSize: 20,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}




