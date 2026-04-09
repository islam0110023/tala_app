import 'package:flutter/material.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_down_profile_like_2.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_profile_like_2.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_like_2_screen_body.dart';

class ProfileLike2Screen extends StatelessWidget {
  ProfileLike2Screen({super.key});
  final GlobalKey<CustomFieldsProfileLike2State> profileFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileLike2ScreenBody(profileFormKey: profileFormKey),
      bottomNavigationBar: CustomDownProfileLike2(
        profileFormKey: profileFormKey,
      ),
    );
  }
}
