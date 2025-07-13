import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

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
        }, name: LocaleKeys.next.tr()),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}