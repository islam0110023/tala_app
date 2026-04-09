import 'dart:async';

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
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomActionOtp extends StatefulWidget {
  const CustomActionOtp({super.key});

  @override
  State<CustomActionOtp> createState() => _CustomActionOtpState();
}

class _CustomActionOtpState extends State<CustomActionOtp> {
  Timer? timer;
  int resendSeconds = 60;
  int currentSeconds = 0;
  Timer? _timer;
  bool canResend = true;
  int resendCount = 0;

  final int maxResendAttempts = 5;
  void startTimer() {
    _timer?.cancel();
    setState(() {
      canResend = false;
      currentSeconds = resendSeconds;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentSeconds == 0) {
        timer.cancel();
        setState(() {
          canResend = true;
        });
      } else {
        setState(() {
          currentSeconds--;
        });
      }
    });
  }

  Future<void> resendEmail() async {
    if (!canResend) return;
    if (resendCount >= maxResendAttempts) {
      AppConstant.buildShowSnackBar(
        context,
        'You reached max resend attempts',
        ContentType.help,
      );
      GoRouter.of(context).go(AppRoutes.loginScreen);
      return;
    }

    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    AppConstant.buildShowSnackBar(
      context,
      'Verification email sent',
      ContentType.help,
    );

    resendCount++;

    resendSeconds = (30 + (resendCount * 60)).clamp(60, 360);

    startTimer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        if (!mounted) return;

        final cubit = BlocProvider.of<UserFormCubit>(context);
        GoRouter.of(
          context,
        ).pushReplacement(AppRoutes.profileSetInfoScreen, extra: cubit);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final isNewPassword = extra['isNewPassword'] as bool;
    // final cubit = extra['cubit'] as UserFormCubit?;
    return Column(
      children: [
        // const CustomFieldsOtp(),
        SizedBox(height: AppDimensions.h32),
        Text(LocaleKeys.didntReceiveOtp.tr(), style: Styling.textStyle15),
        SizedBox(height: AppDimensions.h16),
        if (resendCount >= maxResendAttempts)
          Text(
            'Too many attempts. Try again later or login again',
            style: Styling.textStyle15.copyWith(color: Colors.red),
          )
        else if (!canResend)
          Text('Resend in ${currentSeconds}s', style: Styling.textStyle15),
        if (!canResend || resendCount >= maxResendAttempts)
          SizedBox(height: AppDimensions.h16),

        TextButton(
          // onPressed: () async{
          //   await FirebaseAuth.instance.currentUser!
          //       .sendEmailVerification();
          //   AppConstant.buildShowSnackBar(
          //     context,
          //     'Verification email sent',
          //     ContentType.help,
          //   );
          // },
          onPressed: (canResend && resendCount < maxResendAttempts)
              ? resendEmail
              : null,
          child: Text(
            resendCount >= maxResendAttempts
                ? 'Limit reached'
                : LocaleKeys.resendCode.tr(),

            textAlign: TextAlign.center,
            style: Styling.textStyleBlack15,
          ),
        ),
        SizedBox(height: AppDimensions.h30),
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
            if (isNewPassword) {
              GoRouter.of(context).pushReplacement(AppRoutes.newPasswordScreen);
            } else {
              await FirebaseAuth.instance.currentUser!.reload();

              final user = FirebaseAuth.instance.currentUser;

              if (user != null && user.emailVerified) {
                final cubit = BlocProvider.of<UserFormCubit>(context);

                GoRouter.of(
                  context,
                ).pushReplacement(AppRoutes.profileSetInfoScreen, extra: cubit);
              } else {
                AppConstant.buildShowSnackBar(
                  context,
                  'Please verify your email first',
                );
              }
            }
          },
          name: LocaleKeys.verify.tr(),
        ),
      ],
    );
  }
}
