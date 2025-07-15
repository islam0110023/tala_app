import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_drop_down_select.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsProfileLike2 extends StatelessWidget {
  const CustomFieldsProfileLike2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDownSelect(
          hint: LocaleKeys.choose_what_you_like.tr(),
          options: AppConstant.loveTravelOptions,
          label: LocaleKeys.travel_or_local.tr(),
        ),
        SizedBox(height: AppDimensions.h16),
        CustomDropDownSelect(
          hint: LocaleKeys.choose_event_hint.tr(),
          options: AppConstant.personalityOptions,
          label: LocaleKeys.personality_preference.tr(),
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          hint: LocaleKeys.discover_hint_2.tr(),
          options: AppConstant.discoverOptions,
          label: LocaleKeys.discover_music_2.tr(),
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          hint: LocaleKeys.concert_company_hint.tr(),
          options: AppConstant.concertCompanyOptions,
          label:LocaleKeys.concert_company.tr(),
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          options: AppConstant.travelOptions,
          label:LocaleKeys.travel_distance.tr(),
          hint: LocaleKeys.travel_distance_hint.tr(),
        ),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}
