import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_forget_password_login.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFormLogin extends StatefulWidget {
  const CustomFormLogin({super.key});

  @override
  State<CustomFormLogin> createState() => _CustomFormLoginState();
}

class _CustomFormLoginState extends State<CustomFormLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.disabled;

      final loginParam = LoginParam(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      BlocProvider.of<AuthCubit>(context).login(loginParam);
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          AppConstant.buildShowSnackBar(context, state.errMessage);
        } else if (state is LoginSuccess) {
          GoRouter.of(context).go(AppRoutes.chatsScreen);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                hint: LocaleKeys.emailOrPhone.tr(),
              ),
              SizedBox(height: AppDimensions.h23),
              CustomTextField(
                controller: passwordController,
                hint: LocaleKeys.password.tr(),
                password_flag: true,
              ),
              SizedBox(height: AppDimensions.h33),
              CustomForgetPasswordLogin(
                onTap: () =>
                    GoRouter.of(context).push(AppRoutes.forgetPasswordScreen),
              ),
              SizedBox(height: AppDimensions.h36),
              state is LoginLoading
                  ? const CircularProgressIndicator(
                      color: AppColor.kPrimaryPink,
                    )
                  : CustomButton(
                      onTap: () => _submitForm(context),
                      name: LocaleKeys.login.tr(),
                    ),
            ],
          ),
        );
      },
    );
  }
}
