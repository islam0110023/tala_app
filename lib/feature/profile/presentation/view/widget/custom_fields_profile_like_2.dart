import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_drop_down_select.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsProfileLike2 extends StatefulWidget {
  const CustomFieldsProfileLike2({super.key});

  @override
  State<CustomFieldsProfileLike2> createState() =>
      CustomFieldsProfileLike2State();
}

class CustomFieldsProfileLike2State extends State<CustomFieldsProfileLike2> {
  List<String> q1 = [];
  List<String> q2 = [];
  List<String> q3 = [];
  List<String> q4 = [];
  List<String> q5 = [];
  UserPersonality setAllValues() {
    return UserPersonality(
      enjoyTravelling: q1,
      kindPerson: q2,
      discoveringMusic: q3,
      attendingWith: q4,
      farAway: q5,
    );
  }

  bool validate() {
    if (q1.isEmpty || q2.isEmpty || q3.isEmpty || q4.isEmpty || q5.isEmpty) {
      AppConstant.buildShowSnackBar(
        context,
        LocaleKeys.please_fill_all_fields.tr(),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDownSelect(
          hint: LocaleKeys.choose_what_you_like.tr(),
          options: AppConstant.loveTravelOptions,
          label: LocaleKeys.travel_or_local.tr(),
          onChanged: (p0) => q1 = p0,
        ),
        SizedBox(height: AppDimensions.h16),
        CustomDropDownSelect(
          hint: LocaleKeys.choose_event_hint.tr(),
          options: AppConstant.personalityOptions,
          label: LocaleKeys.personality_preference.tr(),
          onChanged: (p0) => q2 = p0,
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          hint: LocaleKeys.discover_hint_2.tr(),
          options: AppConstant.discoverOptions,
          label: LocaleKeys.discover_music_2.tr(),
          onChanged: (p0) => q3 = p0,
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          hint: LocaleKeys.concert_company_hint.tr(),
          options: AppConstant.concertCompanyOptions,
          label: LocaleKeys.concert_company.tr(),
          onChanged: (p0) => q4 = p0,
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          options: AppConstant.travelOptions,
          label: LocaleKeys.travel_distance.tr(),
          hint: LocaleKeys.travel_distance_hint.tr(),
          onChanged: (p0) => q5 = p0,
        ),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}
