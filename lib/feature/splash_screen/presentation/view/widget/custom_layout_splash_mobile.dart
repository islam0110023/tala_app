import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';

class CustomLayoutSplashMobile extends StatefulWidget {
  const CustomLayoutSplashMobile({super.key});

  @override
  State<CustomLayoutSplashMobile> createState() =>
      _CustomLayoutSplashMobileState();
}

class _CustomLayoutSplashMobileState extends State<CustomLayoutSplashMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceLogoY;
  late Animation<double> _fadeLogo;
  late Animation<Offset> _slideTala;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Bounce effect for logo (y-axis translation)
    _bounceLogoY = Tween<double>(
      begin: -80,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    // Fade effect with delay
    _fadeLogo = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Slide Tala text from bottom
    _slideTala = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: AppDimensions.w2_5,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeLogo.value,
                child: Transform.translate(
                  offset: Offset(0, _bounceLogoY.value),
                  child: SizedBox(
                    width: 254,
                    child: Image.asset(AppImage.kLogoImage),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 200,
            left: 70,
            child: SlideTransition(
              position: _slideTala,
              child: SizedBox(
                width: 120,
                child: Image.asset(AppImage.kTalaImage, fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
