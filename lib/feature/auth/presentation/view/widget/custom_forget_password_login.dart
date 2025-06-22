import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomForgetPasswordLogin extends StatelessWidget {
  const CustomForgetPasswordLogin({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        LocaleKeys.forgotPassword.tr(),
        textAlign: TextAlign.center,
        style: Styling.textStyleB12,
      ),
    );
  }
}
