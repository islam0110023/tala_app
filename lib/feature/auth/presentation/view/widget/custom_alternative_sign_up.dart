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
import 'package:tala_app/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomAlternativeSignUp extends StatelessWidget {
  const CustomAlternativeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserCompleteCubit, GetUserCompleteState>(
      listener: (context, state) {
        if (state is GetUserCompleteNotComplete) {
          context.pop();
          GoRouter.of(context).push(AppRoutes.completeSocialRegisterScreen);
        }
        if (state is GetUserCompleteIsComplete) {
          context.pop();
          GoRouter.of(context).push(AppRoutes.homeScreen);
        }
        if (state is GetUserCompleteFailure) {
          context.pop();
          AppConstant.buildShowSnackBar(context, state.errMessage);
        }
      },
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SignUpWithGoogleFailure) {
            context.pop();
            AppConstant.buildShowSnackBar(context, state.errMessage);
          }
          if (state is SignUpWithGoogleSuccess) {
            final cubit = context.read<RegisterCubit>();
            final isNewUser =
                cubit.registerEntity!.credential.additionalUserInfo!.isNewUser;
            if (isNewUser) {
              context.pop();
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
              CustomSignWithIcon(img: AppImage.kAppleIcon, onTap: () {}),
              SizedBox(width: AppDimensions.w20),
              CustomSignWithIcon(
                img: AppImage.kGoogleIcon,
                onTap: () {
                  final isConnected = getIt<InternetService>().isConnected;
                  if (!isConnected) {
                    AppConstant.buildShowSnackBar(
                      context,
                      LocaleKeys.noInternetConnection.tr(),
                    );
                    return;
                  }
                  AppConstant.showLoadingDialog(context);
                  context.read<RegisterCubit>().registerWithGoogle();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
