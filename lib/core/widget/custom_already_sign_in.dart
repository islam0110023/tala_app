import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomAlreadySignIn extends StatelessWidget {
  const CustomAlreadySignIn({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ?',
          style: Styling.textStyle16
        ),
        SizedBox(width: AppDimensions.w16),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'Sign in',
            style: Styling.textStyleB16,
          ),
        ),
      ],
    );
  }
}
