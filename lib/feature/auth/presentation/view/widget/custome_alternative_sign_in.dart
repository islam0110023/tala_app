import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/widget/custom_sign_with_icon.dart';

class CustomAlternativeSignIn extends StatelessWidget {
  const CustomAlternativeSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSignWithIcon(img: AppImage.kAppleIcon, onTap: () {}),
        SizedBox(width: AppDimensions.w20),
        CustomSignWithIcon(img: AppImage.kGoogleIcon, onTap: () {}),
      ],
    );
  }
}
