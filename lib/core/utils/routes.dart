import 'package:go_router/go_router.dart';
import 'package:tala_app/feature/splash_screen/presentation/view/splash_screen.dart';

class AppRoutes {
  static const splashScreen = '/';
  static const onBoardingScreen = '/onboarding';

  static final route = GoRouter(
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onBoardingScreen,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
