import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';

class GradientRectangleBlur extends StatelessWidget {
  const GradientRectangleBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.identity()
        ..translate(0.0, -250.0)
        ..rotateZ(0),
      width: double.infinity,
      height: 800,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: .7,
          center: Alignment.center,
          colors: [AppColor.kPrimaryPink.withAlpha(192), AppColor.kWhite],
          stops: const [0.5, 1],
        ),
      ),
    );
  }
}
