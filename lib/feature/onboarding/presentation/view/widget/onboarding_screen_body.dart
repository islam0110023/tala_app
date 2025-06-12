import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_button.dart';
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
          SizedBox(height: AppDimensions.h70),
          Image.asset(AppImage.kOnboardingLogo, fit: BoxFit.contain),
          SizedBox(height: AppDimensions.h70),
          const DescriptionSizeBoxWidget(),
          SizedBox(height: AppDimensions.h31),
          const CustomButton(),
          SizedBox(height: AppDimensions.h31),
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
