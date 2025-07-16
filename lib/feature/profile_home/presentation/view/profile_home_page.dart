import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_home_pages_header.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/custom_person_profile.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/oval_profile_container.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/profile_options_list.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.kProfileScaffold,
        child: Stack(
          children: [
            const OvalProfileContainer(),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.w20, vertical: AppDimensions.h49),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomHomePagesHeader(title: LocaleKeys.profile.tr(),),
                  SizedBox(height: AppDimensions.h24),
                  const CustomPersonProfile(name: 'Esar Later',),
                  SizedBox(height: AppDimensions.h30),
                  const ProfileOptionsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}








