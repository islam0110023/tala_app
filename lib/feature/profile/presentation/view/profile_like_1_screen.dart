import 'package:flutter/material.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_down_profile_like_1.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_profile_like_1.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_like_1_screen_body.dart';

class ProfileLike1Screen extends StatelessWidget {
   ProfileLike1Screen({super.key});
  final GlobalKey<CustomFieldsProfileLike1State> profileFormKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ProfileLike1ScreenBody(profileFormKey: profileFormKey,),
      bottomNavigationBar: CustomDownProfileLike1(profileFormKey: profileFormKey,),
    );
  }
}
