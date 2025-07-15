import 'package:flutter/material.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_profile_like_1.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_screen_handling.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_upper_profile_like_1.dart';

class ProfileLike1ScreenBody extends StatelessWidget {
  const ProfileLike1ScreenBody({super.key, required this.profileFormKey});
  final GlobalKey<CustomFieldsProfileLike1State> profileFormKey;

  @override
  Widget build(BuildContext context) {
    return  CustomScreenHandling(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CustomUpperProfileLike1()),
          SliverToBoxAdapter(child: CustomFieldsProfileLike1(key: profileFormKey,)),
        ],
      ),
    );
  }
}
