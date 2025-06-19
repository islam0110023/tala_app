import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_button.dart';

class CustomActionPassions extends StatelessWidget {
  const CustomActionPassions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h32),
        CustomButton(onTap: () {
          GoRouter.of(context).push(AppRoutes.profileLike1Screen);
        }, name: 'Next'),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}