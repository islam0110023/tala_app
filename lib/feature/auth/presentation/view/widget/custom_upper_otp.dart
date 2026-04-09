import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomUpperOtp extends StatelessWidget {
  const CustomUpperOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h47),
        CustomArrowBack(
          onTap: () async {
            final result = await AppConstant.showSignOutConfirmationDialog(
              context,
              LocaleKeys.delete.tr(),
              LocaleKeys.if_you_go_back_now.tr(),
            );
            if (result == OkCancelResult.ok) {
              final result = await showTextInputDialog(
                context: context,
                title: 'Confirm Password',
                message: 'Enter your password to continue',
                textFields: [
                  const DialogTextField(
                    hintText: 'Password',
                    obscureText: true,
                  ),
                ],
              );
              if (result != null && result.isNotEmpty) {
                final password = result.first;

                try {
                  final user = FirebaseAuth.instance.currentUser!;

                  final credential = EmailAuthProvider.credential(
                    email: user.email!,
                    password: password,
                  );

                  await user.reauthenticateWithCredential(credential);

                  await user.delete();

                  if (context.canPop()) {
                    context.pop();
                  }
                } catch (e) {
                  AppConstant.buildShowSnackBar(
                    context,
                    'Wrong password or error occurred',
                  );
                }
              }
            }

            // GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }
}
