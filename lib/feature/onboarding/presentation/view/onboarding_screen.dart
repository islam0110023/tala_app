import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/description_sizedbox_widget.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/onboarding_screen_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),
                Image.asset(
                  'assets/image1.png',
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 70.h),
                const DescriptionSizeBoxWidget(),
                SizedBox(height: 40.h),
                const CustomButton(),
                SizedBox(height: 31.h),
                const CustomSignInOnBoarding(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSignInOnBoarding extends StatelessWidget {
  const CustomSignInOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign in',
            style: TextStyle(
              color: const Color(0xFFDB0165),
              fontSize: 16.sp,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(5, 5),
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFDB0165),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 15.h,
            horizontal: 30.w,
          ),
        ),
        child: Text(
          'Start Your Unique Experience!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}


