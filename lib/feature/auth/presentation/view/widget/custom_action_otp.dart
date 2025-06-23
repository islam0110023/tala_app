import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_otp.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomActionOtp extends StatelessWidget {
  const CustomActionOtp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomFieldsOtp(),
        SizedBox(height: AppDimensions.h32),
        Text(LocaleKeys.didntReceiveOtp.tr(), style: Styling.textStyle15),
        SizedBox(height: AppDimensions.h16),
        Text(
          LocaleKeys.resendCode.tr(),

          textAlign: TextAlign.center,
          style: Styling.textStyleBlack15,
        ),
        SizedBox(height: AppDimensions.h70),
        CustomButton(onTap: () {
          GoRouter.of(context).pushReplacement(AppRoutes.profileSetInfoScreen);
        }, name: LocaleKeys.verify.tr()),
      ],
    );
  }
}