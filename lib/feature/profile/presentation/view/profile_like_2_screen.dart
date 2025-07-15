import 'package:flutter/material.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_down_profile_like_2.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_like_2_screen_body.dart';

class ProfileLike2Screen extends StatelessWidget {
  const ProfileLike2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileLike2ScreenBody(),
      bottomNavigationBar: CustomDownProfileLike2(),
    );
  }
}
