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
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Center(
                heightFactor: 2.2.h,
                child: Stack(
                  clipBehavior: Clip.none,

                  children: [
                    Positioned(
                      child: SizedBox(
                        width: 400,
                        child: Image.asset("assets/images/logo_tala.png"),
                      ),
                    ),
                    Positioned(
                      top: 300,
                      left: 105,
                      child: SizedBox(
                        width: 200,
                        child: Image.asset(
                          "assets/images/Tala.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                heightFactor: 2.5,
                child: Stack(
                  clipBehavior: Clip.none,

                  children: [
                    Positioned(
                      child: SizedBox(
                        width: 254,
                        child: Image.asset("assets/images/logo_tala.png"),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 70,
                      child: SizedBox(
                        width: 120,
                        child: Image.asset(
                          "assets/images/Tala.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
