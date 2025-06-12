import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(color: Color(0x478B00B7)),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x4D8B00B7), Color(0xffff4f9d), Color(0xffDB0165)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0, .38, .87],
              transform: GradientRotation(0),
            ),
          ),
        ),
        Positioned(
          top: 207.h,
          left: 70.w,
          child: SizedBox(
            width: size.width * .65,
            child: FittedBox(child: Image.asset("assets/images/logo_tala.png")),
          ),
        ),
        Positioned(
          top: 410.h,
          left: 142.w,
          child: SizedBox(
            width: size.width * .3,
            child: FittedBox(child: Image.asset("assets/images/Tala.png")),
          ),
        ),
      ],
    );
  }
}
