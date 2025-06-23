import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_action_otp.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_page_text_body.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_upper_otp.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
      child: const Column(
        children: [CustomUpperOtp(), CustomPageTextBody(), CustomActionOtp()],
      ),
    );
  }
}
