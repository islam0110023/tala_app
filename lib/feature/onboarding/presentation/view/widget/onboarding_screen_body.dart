import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/description_sizedbox_widget.dart';

class OnboardingScreenBody extends StatelessWidget {
  const OnboardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70.h),
          Image.asset(AppImage.kOnboardingLogo, fit: BoxFit.contain),
          SizedBox(height: 70.h),
          const DescriptionSizeBoxWidget(),
          SizedBox(height: 40.h),
          const CustomButton(),
          SizedBox(height: 31.h),
          CustomAlreadySignIn(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
