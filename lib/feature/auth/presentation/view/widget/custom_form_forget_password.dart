import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/services/internet_services.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/feature/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFormForgetPassword extends StatefulWidget {
  const CustomFormForgetPassword({super.key});

  @override
  State<CustomFormForgetPassword> createState() =>
      _CustomFormForgetPasswordState();
}

class _CustomFormForgetPasswordState extends State<CustomFormForgetPassword> {
  late TextEditingController emailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          if (context.canPop()) {
            context.pop();
          }
          AppConstant.buildShowSnackBar(
            context,
            LocaleKeys.check_email.tr(),
            ContentType.success,
            LocaleKeys.success.tr(),
          );
          if (context.canPop()) {
            context.pop();
          }
        }
        if (state is ResetPasswordFailure) {
          if (context.canPop()) {
            context.pop();
          }
          AppConstant.buildShowSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              hint: LocaleKeys.email.tr(),
              controller: emailController,
            ),
            SizedBox(height: AppDimensions.h51),
            CustomButton(
              onTap: () async {
                final isConnected = getIt<InternetService>().isConnected;
                if (!isConnected) {
                  AppConstant.buildShowSnackBar(
                    context,
                    LocaleKeys.noInternetConnection.tr(),
                  );
                  return;
                }
                AppConstant.showLoadingDialog(context);
                context.read<ResetPasswordCubit>().resetPassword(
                  emailController.text,
                );
                FocusScope.of(context).unfocus();
              },
              name: LocaleKeys.send.tr(),
            ),
          ],
        );
      },
    );
  }
}
