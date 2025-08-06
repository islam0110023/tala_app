import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/feature/auth/presentation/manager/get_user_complete_cubit/get_user_complete_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/save_user_auth_cubit/save_user_auth_cubit.dart';
import 'package:tala_app/feature/auth/presentation/view/complete_social_register_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/forget_password_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/login_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/new_password_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/otp_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/register_screen.dart';
import 'package:tala_app/feature/chat/presentation/view/chat_screen.dart';
import 'package:tala_app/feature/chat/presentation/view/chats_screen.dart';
import 'package:tala_app/feature/dating/presentation/manager/get_matches_user/get_matches_user_cubit.dart';
import 'package:tala_app/feature/dating/presentation/manager/get_user_vector/get_user_vector_cubit.dart';
import 'package:tala_app/feature/home/presentation/view/home_screen.dart';
import 'package:tala_app/feature/home/presentation/view/search_screen.dart';
import 'package:tala_app/feature/notification/presentation/view/notification_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_slide_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_tags_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_tala_screen.dart';
import 'package:tala_app/feature/profile/presentation/manager/open_ai_cubit/open_ai_cubit.dart';
import 'package:tala_app/feature/profile/presentation/manager/save_user_cubit/save_user_cubit.dart';
import 'package:tala_app/feature/profile/presentation/manager/store_vector_cubit/store_vector_cubit.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_like_1_screen.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_like_2_screen.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_music_preferences_screen.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_select_passions_screen.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_set_info_screen.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/splash_screen.dart';
import 'package:tala_app/main.dart';

class AppRoutes {
  static const splashScreen = '/';
  static const onBoardingScreen = '/onboarding';
  static const loginScreen = '/login';
  static const registerScreen = '/register';
  static const profileSetInfoScreen = '/profile';
  static const newPasswordScreen = '/new_password';
  static const onBoardingSlideScreen = '/onboarding_slide';
  static const onBoardingTagsScreen = '/onboarding_tags';
  static const profileMusicPreferencesScreen =
      '/profile_music_preferences_screen';
  static const profileSelectPassionsScreen = '/profile_select_passion_screen';
  static const profileLike1Screen = '/profile_like_1_screen';
  static const profileLike2Screen = '/profile_like_2_screen';
  static const onBoardingTalaScreen = '/onboarding_tala_screen';
  static const otpScreen = '/otp_screen';
  static const chatsScreen = '/chats_screen';
  static const chatScreen = '/chat_screen';
  static const forgetPasswordScreen = '/forget_password_screen';
  static const homeScreen = '/home_screen';
  static const notificationScreen = '/notification_screen';
  static const completeSocialRegisterScreen =
      '/complete_social_register_screen';
  static const searchScreen = '/search_screen';

  static final route = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetUserCompleteCubit(getIt())),
          ],
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: onBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginCubit(getIt(), getIt())),
            BlocProvider(create: (context) => GetUserCompleteCubit(getIt())),
            BlocProvider(create: (context) => UserFormCubit()),
          ],
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RegisterCubit(getIt(), getIt())),
            BlocProvider(create: (context) => UserFormCubit()),
            BlocProvider(create: (context) => SaveUserAuthCubit(getIt())),
            BlocProvider(create: (context) => GetUserCompleteCubit(getIt())),
          ],
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: profileSetInfoScreen,
        builder: (context, state) {
          final cubit = state.extra as UserFormCubit;
          return MultiBlocProvider(
            providers: [BlocProvider.value(value: cubit)],
            child: const ProfileSetInfoScreen(),
          );
        },
      ),
      GoRoute(
        path: newPasswordScreen,
        builder: (context, state) => const NewPasswordScreen(),
      ),
      GoRoute(
        path: onBoardingSlideScreen,
        builder: (context, state) => const OnboardingSlideScreen(),
      ),
      GoRoute(
        path: onBoardingTagsScreen,
        builder: (context, state) => const OnboardingTagsScreen(),
      ),
      GoRoute(
        path: profileMusicPreferencesScreen,
        builder: (context, state) {
          final cubit = state.extra as UserFormCubit;
          return MultiBlocProvider(
            providers: [BlocProvider.value(value: cubit)],
            child: const ProfileMusicPreferencesScreen(),
          );
        },
      ),
      GoRoute(
        path: profileSelectPassionsScreen,
        builder: (context, state) {
          final value = state.extra as UserFormCubit;
          return MultiBlocProvider(
            providers: [BlocProvider.value(value: value)],
            child: const ProfileSelectPassionsScreen(),
          );
        },
      ),
      GoRoute(
        path: profileLike1Screen,
        builder: (context, state) {
          final value = state.extra as UserFormCubit;
          return MultiBlocProvider(
            providers: [BlocProvider.value(value: value)],
            child: ProfileLike1Screen(),
          );
        },
      ),
      GoRoute(
        path: profileLike2Screen,
        builder: (context, state) {
          final value = state.extra as UserFormCubit;
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: value),
              BlocProvider(create: (context) => SaveUserCubit(getIt())),
              BlocProvider(create: (context) => OpenAiCubit(getIt())),
              BlocProvider(create: (context) => StoreVectorCubit(getIt())),
            ],
            child: ProfileLike2Screen(),
          );
        },
      ),
      GoRoute(
        path: onBoardingTalaScreen,
        builder: (context, state) => const OnboardingTalaScreen(),
      ),
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ResetPasswordCubit(getIt()),
          child: const ForgetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: otpScreen,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final value = extra['cubit'] as UserFormCubit;
          return MultiBlocProvider(
            providers: [BlocProvider.value(value: value)],
            child: const OtpScreen(),
          );
        },
      ),
      GoRoute(
        path: chatsScreen,
        builder: (context, state) => const ChatsScreen(),
      ),
      GoRoute(
        path: chatScreen,
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetUserVectorCubit(getIt())),
            BlocProvider(create: (context) => GetMatchesUserCubit(getIt())),
          ],
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: notificationScreen,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: completeSocialRegisterScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserFormCubit()),
            BlocProvider(create: (context) => SaveUserAuthCubit(getIt())),
          ],
          child: const CompleteSocialRegisterScreen(),
        ),
      ),
      GoRoute(
        path: searchScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SearchScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  final offset =
                      Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                      );
                  return SlideTransition(position: offset, child: child);
                },
          );
        },
      ),
    ],
  );
}
