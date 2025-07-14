import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_already_sign_in.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_sign_with_auth.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custome_alternative_sign_in.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomActionLogin extends StatelessWidget {
  const CustomActionLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h167),
        const CustomSignWithAuth(),
        SizedBox(height: AppDimensions.h16),
        const CustomAlternativeSignIn(),
        SizedBox(height: AppDimensions.h31),
        CustomAlreadySignIn(
          name2:LocaleKeys.signUpNow.tr(),
          name1:LocaleKeys.newToScene.tr(),
          onTap: () {
            GoRouter.of(context).push(AppRoutes.registerScreen);
          },
        ),
      ],
    );
  }
}
