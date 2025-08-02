import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/services/internet_services.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/core/widget/custom_sign_with_icon.dart';
import 'package:tala_app/feature/auth/presentation/manager/get_user_complete_cubit/get_user_complete_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomAlternativeSignIn extends StatelessWidget {
  const CustomAlternativeSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserCompleteCubit, GetUserCompleteState>(
      listener: (context, state) {
        if (state is GetUserCompleteNotCompleteWithSocial) {
          if (context.canPop()) {
            context.pop();
          }
          GoRouter.of(context).push(AppRoutes.completeSocialRegisterScreen);
        }
        if (state is GetUserCompleteIsCompleteWithSocial) {
          if (context.canPop()) {
            context.pop();
          }
          GoRouter.of(context).push(AppRoutes.homeScreen);
        }
        if (state is GetUserCompleteFailureWithSocial) {
          if (context.canPop()) {
            context.pop();
          }
          AppConstant.buildShowSnackBar(context, state.errMessage);
        }
      },
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginWithGoogleFailure) {
            if (context.canPop()) {
              context.pop();
            }
            AppConstant.buildShowSnackBar(context, state.errMessage);
          }
          if (state is LoginWithGoogleSuccess) {
            final cubit = context.read<LoginCubit>();
            final isNewUser =
                cubit.loginEntity!.credential.additionalUserInfo!.isNewUser;
            if (isNewUser) {
              if (context.canPop()) {
                context.pop();
              }
              GoRouter.of(context).push(AppRoutes.completeSocialRegisterScreen);
            } else {
              context.read<GetUserCompleteCubit>().getUserComplete(
                FirebaseAuth.instance.currentUser!.uid,
              );
            }
          }
        },
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSignWithIcon(
                img: AppImage.kAppleIcon,
                onTap: () {
                  //GoRouter.of(context).push(AppRoutes.completeSocialRegisterScreen);
                },
              ),
              SizedBox(width: AppDimensions.w20),
              CustomSignWithIcon(
                img: AppImage.kGoogleIcon,
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
                  context.read<LoginCubit>().loginWithGoogle();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
