import 'package:flutter/material.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/login_screen_body.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/new_password_screen_body.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewPasswordScreenBody(),
    );
  }
}
