import 'package:go_router/go_router.dart';
import 'package:tala_app/feature/auth/presentation/view/forget_password_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/login_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/new_password_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/otp_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/register_screen.dart';
import 'package:tala_app/feature/chat/presentation/view/chat_screen.dart';
import 'package:tala_app/feature/chat/presentation/view/chats_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_slide_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_tags_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_tala_screen.dart';
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
  static const profileMusicPreferencesScreen = '/profile_music_preferences_screen';
  static const profileSelectPassionsScreen = '/profile_select_passion_screen';
  static const profileLike1Screen = '/profile_like_1_screen';
  static const profileLike2Screen = '/profile_like_2_screen';
  static const onBoardingTalaScreen = '/onboarding_tala_screen';
  static const otpScreen = '/otp_screen';
  static const chatsScreen = '/chats_screen';
  static const chatScreen = '/chat_screen';
  static const forgetPasswordScreen = '/forget_password_screen';




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
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: profileSetInfoScreen,
        builder: (context, state) => const ProfileSetInfoScreen(),
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
        builder: (context, state) => const ProfileMusicPreferencesScreen(),
      ),
      GoRoute(
        path: profileSelectPassionsScreen,
        builder: (context, state) => const ProfileSelectPassionsScreen(),
      ),
      GoRoute(
        path: profileLike1Screen,
        builder: (context, state) => const ProfileLike1Screen(),
      ),
      GoRoute(
        path: profileLike2Screen,
        builder: (context, state) => const ProfileLike2Screen(),
      ),
      GoRoute(
        path: onBoardingTalaScreen,
        builder: (context, state) => const OnboardingTalaScreen(),
      ),
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: otpScreen,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: chatsScreen,
        builder: (context, state) => const ChatsScreen(),
      ),
      GoRoute(
        path: chatScreen,
        builder: (context, state) => const ChatScreen(),
      ),

    ],
  );
}
