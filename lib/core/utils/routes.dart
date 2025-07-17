import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/save_user_auth_cubit/save_user_auth_cubit.dart';
import 'package:tala_app/feature/auth/presentation/view/forget_password_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/login_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/new_password_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/otp_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/register_screen.dart';
import 'package:tala_app/feature/chat/presentation/view/chat_screen.dart';
import 'package:tala_app/feature/chat/presentation/view/chats_screen.dart';
import 'package:tala_app/feature/home/presentation/view/home_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_slide_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_tags_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_tala_screen.dart';
import 'package:tala_app/feature/profile/presentation/manager/save_user_cubit/save_user_cubit.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_like_1_screen.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_like_2_screen.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_music_preferences_screen.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_select_passions_screen.dart';
import 'package:tala_app/feature/profile/presentation/view/profile_set_info_screen.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/splash_screen.dart';

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

  static final route = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
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
          ],
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RegisterCubit(getIt())),
            BlocProvider(create: (context) => UserFormCubit()),
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
            providers: [
              BlocProvider.value(value: value),
              BlocProvider(create: (context) => SaveUserAuthCubit(getIt())),
            ],
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
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
