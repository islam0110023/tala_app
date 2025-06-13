import 'package:flutter/material.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/onboarding_slide_screen_body.dart';

class OnboardingSlideScreen extends StatelessWidget {
  const OnboardingSlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingSlideScreenBody(),
    );
  }
}
