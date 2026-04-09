import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/services/internet_services.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/presentation/manager/get_user_complete_cubit/get_user_complete_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_forget_password_login.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
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
      AppConstant.showLoadingDialog(context);

      BlocProvider.of<LoginCubit>(context).login(loginParam);
      FocusScope.of(context).unfocus();
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserCompleteCubit, GetUserCompleteState>(
      listener: (context, state) {
        if (state is GetUserCompleteFailure) {
          if (context.canPop()) {
            context.pop();
          }
          AppConstant.buildShowSnackBar(context, state.errMessage);
        }
        if (state is GetUserCompleteIsComplete) {
          if (context.canPop()) {
            context.pop();
          }
          GoRouter.of(context).go(AppRoutes.homeScreen);
        }
        if (state is GetUserCompleteNotComplete) {
          final cubit = BlocProvider.of<UserFormCubit>(context);

          if (context.canPop()) {
            context.pop();
          }
          GoRouter.of(
            context,
          ).push(AppRoutes.profileSetInfoScreen, extra: cubit);
        }
      },
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            if (context.canPop()) {
              context.pop();
            }
            AppConstant.buildShowSnackBar(context, state.errMessage);
          }
          if (state is LoginEmailVerified) {
            if (context.canPop()) {
              context.pop();
            }
            AppConstant.buildShowSnackBar(
              context,
              'Please verify your email first',
            );
            final cubit = BlocProvider.of<UserFormCubit>(context);
            GoRouter.of(context).push(
              AppRoutes.otpScreen,
              extra: {'isNewPassword': false, 'cubit': cubit},
            );
          }
          if (state is LoginSuccess) {
            final uid = context
                .read<LoginCubit>()
                .loginEntity!
                .credential
                .user!
                .uid;

            context.read<GetUserCompleteCubit>().getUserComplete(uid);
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
                    _submitForm(context);
                  },
                  name: LocaleKeys.login.tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
