import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_home_pages_header.dart';
import 'package:tala_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/custom_person_profile.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/oval_profile_container.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/profile_options_list.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class ProfileHomePageBody extends StatelessWidget {
  const ProfileHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<HomeCubit>().user;
    return Stack(
      children: [
        const OvalProfileContainer(),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.r25,
            vertical: AppDimensions.r49,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomHomePagesHeader(title: LocaleKeys.profile.tr()),
              SizedBox(height: AppDimensions.h24),
              CustomPersonProfile(name: user?.name ?? ''),
              SizedBox(height: AppDimensions.h30),
              const ProfileOptionsList(),
            ],
          ),
        ),
      ],
    );
  }
}
