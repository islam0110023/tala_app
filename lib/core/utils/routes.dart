import 'package:go_router/go_router.dart';
import 'package:tala_app/feature/auth/presentation/view/login_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/new_password_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/register_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_slide_screen.dart';
import 'package:tala_app/feature/profile/presentation/profile_set_info_screen.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/splash_screen.dart';

class AppRoutes {
  static const splashScreen = '/';
  static const onBoardingScreen = '/onboarding';
  static const loginScreen = '/login';
  static const registerScreen = '/register';
  static const profileSetInfoScreen = '/profile';
  static const newPasswordScreen = '/new_password';
  static const onBoardingSlideScreen = '/onboarding_slide';


  static final route = GoRouter(
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
    ],
  );
}
