import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_drop_down_select.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_text_field_profile.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsProfileLike1 extends StatelessWidget {
  const CustomFieldsProfileLike1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDownSelect(
          hint: LocaleKeys.choose_event_hint.tr(),
          options: AppConstant.kQ1Choices,
          label: LocaleKeys.which_event_never_miss.tr(),
        ),
        SizedBox(height: AppDimensions.h16),
        CustomTextFieldProfile(
          hint: LocaleKeys.top_fav_artists_hint.tr(),
          label: LocaleKeys.top_fav_artists_label.tr(),
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          hint: LocaleKeys.how_often_hint.tr(),
          options: AppConstant.kQ3Choices,
          label: LocaleKeys.how_often_attend.tr(),
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          hint: LocaleKeys.discover_hint.tr(),
          options: AppConstant.kQ4Choices,
          label: LocaleKeys.discover_new_artists.tr(),
          multiSelect: false,
        ),
        SizedBox(height: AppDimensions.h16),

        CustomTextFieldProfile(
          hint: LocaleKeys.fav_venue_hint.tr(),
          label: LocaleKeys.fav_venue_label.tr(),
        ),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}
