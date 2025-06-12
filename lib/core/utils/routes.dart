import 'package:go_router/go_router.dart';
import 'package:tala_app/feature/auth/presentation/view/login_screen.dart';
import 'package:tala_app/feature/auth/presentation/view/register_screen.dart';
import 'package:tala_app/feature/onboarding/presentation/view/onboarding_screen.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/splash_screen.dart';

class AppRoutes {
  static const splashScreen = '/';
  static const onBoardingScreen = '/onboarding';
  static const loginScreen = '/login';
  static const registerScreen = '/register';

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
    ],
  );
}
