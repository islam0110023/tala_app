import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/routes.dart';

void main() {
  runApp(const TalaApp());
}

class TalaApp extends StatelessWidget {
  const TalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:MediaQuery.of(context).size.width<600? const Size(393, 852):const Size(393*1.3, 852*1.2),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: AppRoutes.route,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
