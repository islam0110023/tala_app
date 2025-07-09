import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});
  final bool isNewPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: AppDimensions.h47),
                    CustomArrowBack(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    CustomTitle(
                      title: LocaleKeys.sendCode.tr(),
                      textFont: 28.sp,
                    ),
                    SizedBox(height: AppDimensions.h7),
                    Text(
                      LocaleKeys.resetPassword.tr(),
                      textAlign: TextAlign.center,
                      style: Styling.textStyleGray16,
                    ),
                    SizedBox(height: AppDimensions.h47),
                    CustomTextField(hint: LocaleKeys.email.tr()),
                    SizedBox(height: AppDimensions.h51),
                    CustomButton(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push(AppRoutes.otpScreen, extra: isNewPassword);
                      },
                      name: LocaleKeys.send.tr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
