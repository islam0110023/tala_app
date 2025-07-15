import 'package:flutter/material.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_profile_like_2.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_screen_handling.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_upper_profile_like_2.dart';

class ProfileLike2ScreenBody extends StatelessWidget {
  const ProfileLike2ScreenBody({super.key, required this.profileFormKey});
  final GlobalKey<CustomFieldsProfileLike2State> profileFormKey ;

  @override
  Widget build(BuildContext context) {
    return  CustomScreenHandling(
      child: CustomScrollView(
        slivers: [
         const SliverToBoxAdapter(child: CustomUpperProfileLike2()),
          SliverToBoxAdapter(child: CustomFieldsProfileLike2(key:profileFormKey ,)),
        ],
      ),
    );
  }
}
