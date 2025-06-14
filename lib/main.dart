import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const TalaApp());
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
        builder: (context, child) {
          AppConstant.precacheAppImages(context);

          return child!;
        },
        theme: ThemeData(scaffoldBackgroundColor: AppColor.kWhite1),
        routerConfig: AppRoutes.route,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
