import 'package:flutter/material.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreenBody(),
    );
  }
}
