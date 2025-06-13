import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_button_onboarding.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/description_sizedbox_widget.dart';

class OnboardingScreenBody extends StatelessWidget {
  const OnboardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: AppDimensions.h70),
          Image.asset(
            AppImage.kOnboardingLogo,
            fit: BoxFit.contain,
            width: double.infinity,
            height: 389.h,
          ),
          SizedBox(height: AppDimensions.h31),
          const DescriptionSizeBoxWidget(),
          SizedBox(height: AppDimensions.h31),
          CustomButtonOnboarding(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.onBoardingSlideScreen);
            },
          ),
          SizedBox(height: AppDimensions.h31),
          CustomAlreadySignIn(
            name1: 'Already have an account ?',
            name2: 'Sign in',
            onTap: () {
              GoRouter.of(context).push(AppRoutes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
