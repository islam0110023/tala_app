import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/services/internet_services.dart';
import 'package:tala_app/core/services/notification_service/push_notification_service.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/feature/auth/presentation/manager/get_user_complete_cubit/get_user_complete_cubit.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/widget/custom_layout_splash_ipad.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/widget/custom_layout_splash_mobile.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToOnboarding();
  }

  void navigateToOnboarding() {
    Future.delayed(const Duration(seconds: AppConstant.kDurationSplash), () {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final uid = user.uid;
        final isConnected = getIt<InternetService>().isConnected;
        if (!isConnected) {
          GoRouter.of(context).go(AppRoutes.onBoardingScreen);

          AppConstant.buildShowSnackBar(
            context,
            LocaleKeys.noInternetConnection.tr(),
          );
          return;
        }
        context.read<GetUserCompleteCubit>().getUserComplete(uid);
        // GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
      } else {
        GoRouter.of(context).go(AppRoutes.onBoardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserCompleteCubit, GetUserCompleteState>(
      listener: (context, state) {
        if (state is GetUserCompleteIsComplete) {
          if (PushNotificationsServices.pendingChatId != null) {
            final chat = PushNotificationsServices.pendingChatId!;
            PushNotificationsServices.pendingChatId = null;

            AppRoutes.route.push(AppRoutes.chatScreen, extra: chat);
          } else {
            GoRouter.of(context).go(AppRoutes.homeScreen);
          }
        }
        if (state is GetUserCompleteNotComplete ||
            state is GetUserCompleteFailure) {
          GoRouter.of(context).go(AppRoutes.onBoardingScreen);
        }
      },
      child: Stack(
        children: [
          Container(color: AppColor.kPurple),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.kLightPurple,
                  AppColor.kLightPink,
                  AppColor.kPrimaryPink,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0, .38, .87],
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return const CustomLayoutSplashIpad();
              } else {
                return const CustomLayoutSplashMobile();
              }
            },
          ),
        ],
      ),
    );
  }
}
