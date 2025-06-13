import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_new_password.dart';

class NewPasswordScreenBody extends StatelessWidget {
  const NewPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: AppDimensions.h47),
                    CustomArrowBack(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    const CustomTitle(title: 'New Password', textFont: 28),
                    SizedBox(height: AppDimensions.h7),
                    Text(
                      'Your new password must be different from\npreviously used passwords',
                      textAlign: TextAlign.center,
                      style: Styling.textStyleGray16,
                    ),
                    SizedBox(height: AppDimensions.h33),
                    const CustomFieldsNewPassword(),
                    SizedBox(height: AppDimensions.h51),
                    CustomButton(onTap: () {}, name: 'Create New Password'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
