import 'package:flutter/material.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_down_profile_like_1.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_like_1_screen_body.dart';

class ProfileLike1Screen extends StatelessWidget {
  const ProfileLike1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileLike1ScreenBody(),
      bottomNavigationBar: CustomDownProfileLike1(),
    );
  }
}
