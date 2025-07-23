import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/firebase_options.dart';
import 'package:tala_app/generated/codegen_loader.g.dart';
import 'package:tala_app/my_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    EasyLocalization.ensureInitialized(),
    GoogleSignIn.instance.initialize(
      serverClientId:
          '665998326850-4j6p02pe9k0vdiujmio5dqcrbe3sstup.apps.googleusercontent.com',
    ),
  ]);
  setUpServices();
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'assets/translate',
      fallbackLocale: const Locale('en'),
      startLocale: _detectDeviceLocale(),
      assetLoader: const CodegenLoader(),
      child: const TalaApp(),
    ),
  );
}

class TalaApp extends StatelessWidget {
  const TalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size.height < 700
          ? const Size(393, 852 * 1.15)
          : MediaQuery.of(context).size.width < 600
          ? const Size(393, 852)
          : const Size(393 * 1.2, 852 * 1.2),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        builder: (context, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppConstant.precacheAppImages(context);
          });
          final double scale = MediaQuery.of(
            context,
          ).textScaler.scale(1.0).clamp(1.0, 1.1);

          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          );
        },
        theme: ThemeData(scaffoldBackgroundColor: AppColor.kWhite1),
        routerConfig: AppRoutes.route,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

Locale _detectDeviceLocale() {
  final deviceLocale = PlatformDispatcher.instance.locale;

  return deviceLocale.languageCode == 'de'
      ? const Locale('de')
      : const Locale('en');
}
