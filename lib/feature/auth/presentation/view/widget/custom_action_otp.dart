import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/auth/presentation/manager/save_user_auth_cubit/save_user_auth_cubit.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_otp.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomActionOtp extends StatelessWidget {
  const CustomActionOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final isNewPassword = extra['isNewPassword'] as bool;
    // final cubit = extra['cubit'] as UserFormCubit?;
    return Column(
      children: [
        const CustomFieldsOtp(),
        SizedBox(height: AppDimensions.h32),
        Text(LocaleKeys.didntReceiveOtp.tr(), style: Styling.textStyle15),
        SizedBox(height: AppDimensions.h16),
        Text(
          LocaleKeys.resendCode.tr(),

          textAlign: TextAlign.center,
          style: Styling.textStyleBlack15,
        ),
        SizedBox(height: AppDimensions.h70),
        BlocConsumer<SaveUserAuthCubit, SaveUserAuthState>(
          listener: (context, state) {
            if (state is SaveUserAuthSuccess) {
              final cubit = BlocProvider.of<UserFormCubit>(context);
              GoRouter.of(
                context,
              ).pushReplacement(AppRoutes.profileSetInfoScreen, extra: cubit);
            }
            if (state is SaveUserAuthFailure) {
              AppConstant.buildShowSnackBar(context, state.errMessage);
            }
          },
          builder: (context, state) {
            return state is SaveUserAuthLoading
                ? const CircularProgressIndicator(color: AppColor.kPrimaryPink)
                : CustomButton(
                    onTap: () {
                      if (isNewPassword) {
                        GoRouter.of(
                          context,
                        ).pushReplacement(AppRoutes.newPasswordScreen);
                      } else {
                        final cubit = BlocProvider.of<UserFormCubit>(context);
                        final user = cubit.firstBuild();
                        BlocProvider.of<SaveUserAuthCubit>(
                          context,
                        ).saveUser(user);
                      }
                    },
                    name: LocaleKeys.verify.tr(),
                  );
          },
        ),
      ],
    );
  }
}
