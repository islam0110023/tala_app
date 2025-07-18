import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_drop_down_select.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_text_field_profile.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsProfileLike1 extends StatefulWidget {
  const CustomFieldsProfileLike1({super.key});

  @override
  State<CustomFieldsProfileLike1> createState() =>
      CustomFieldsProfileLike1State();
}

class CustomFieldsProfileLike1State extends State<CustomFieldsProfileLike1> {
  late TextEditingController favArtistsController;
  late TextEditingController favVenueController;

  // Selected values from dropdowns
  List<String> q1Selections = [];
  List<String> q3Selections = [];
  List<String> q4Selections = [];
  @override
  void initState() {
    super.initState();
    favArtistsController = TextEditingController();
    favVenueController = TextEditingController();
  }

  @override
  void dispose() {
    favArtistsController.dispose();
    favVenueController.dispose();
    super.dispose();
  }

  MusicLike getAllSelectedValues() {
    return MusicLike(
      musicEvent: q1Selections,
      concertVenue: favVenueController.text,
      favoriteArtists: favArtistsController.text,
      liveMusic: q3Selections,
      likesDiscovering: q4Selections.contains(LocaleKeys.yes.tr()) ? true : false,
    );
  }

  bool validate() {
    if (q1Selections.isEmpty ||
        q3Selections.isEmpty ||
        q4Selections.isEmpty ||
        favArtistsController.text.isEmpty ||
        favVenueController.text.isEmpty ||
        favArtistsController.text.isEmpty) {
      AppConstant.buildShowSnackBar(context, LocaleKeys.please_select_all_fields.tr());
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDownSelect(
          hint: LocaleKeys.choose_event_hint.tr(),
          options: AppConstant.kQ1Choices,
          label: LocaleKeys.which_event_never_miss.tr(),
          onChanged: (values) => q1Selections = values,
        ),
        SizedBox(height: AppDimensions.h16),
        CustomTextFieldProfile(
          hint: LocaleKeys.top_fav_artists_hint.tr(),
          label: LocaleKeys.top_fav_artists_label.tr(),
          controller: favArtistsController,
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          hint: LocaleKeys.how_often_hint.tr(),
          options: AppConstant.kQ3Choices,
          label: LocaleKeys.how_often_attend.tr(),
          onChanged: (values) => q3Selections = values,
        ),
        SizedBox(height: AppDimensions.h16),

        CustomDropDownSelect(
          hint: LocaleKeys.discover_hint.tr(),
          options: AppConstant.kQ4Choices,
          label: LocaleKeys.discover_new_artists.tr(),
          multiSelect: false,
          onChanged: (values) => q4Selections = values,
        ),
        SizedBox(height: AppDimensions.h16),

        CustomTextFieldProfile(
          hint: LocaleKeys.fav_venue_hint.tr(),
          label: LocaleKeys.fav_venue_label.tr(),
          controller: favVenueController,
        ),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}
