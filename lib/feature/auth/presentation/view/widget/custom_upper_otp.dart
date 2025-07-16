import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';

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
              'Delete',
              'If you go back now, your account will be deleted.',
            );
            if (result == OkCancelResult.ok) {
              await FirebaseAuth.instance.currentUser!.delete();
              GoRouter.of(context).pop();
            }

            // GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }
}
