import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomForgetPasswordLogin extends StatelessWidget {
  const CustomForgetPasswordLogin({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Forget Password?',
        textAlign: TextAlign.center,
        style: Styling.textStyleB12,
      ),
    );
  }
}
