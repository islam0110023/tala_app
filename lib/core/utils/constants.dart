import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/model/genre_model.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

abstract class AppConstant {
  static const kFontFamily = 'Lato';
  static const kFontFamilyInter = 'Inter';
  static const kDurationSplash = 2;
  static final List<String> kGenderOptions = [
    LocaleKeys.male.tr(),
    LocaleKeys.female.tr(),
  ];
  static final List<GenreModel> kGenres = [
    GenreModel(name: LocaleKeys.rock.tr()),
    GenreModel(name: LocaleKeys.classical.tr()),
    GenreModel(name: LocaleKeys.hiphop.tr()),
    GenreModel(name: LocaleKeys.jazz.tr()),
    GenreModel(name: LocaleKeys.rap.tr()),
    GenreModel(name: LocaleKeys.country.tr()),
    GenreModel(name: LocaleKeys.indie.tr()),
    GenreModel(name: LocaleKeys.arabian.tr()),
  ];
  static final List<GenreModel> kGenresPassion = [
    GenreModel(name: LocaleKeys.gaming.tr(), imgUrl: AppImage.kPassionGaming),
    GenreModel(name: LocaleKeys.dance.tr(), imgUrl: AppImage.kPassionDance),
    GenreModel(name: LocaleKeys.arts.tr(), imgUrl: AppImage.kPassionArts),
    GenreModel(name: LocaleKeys.nature.tr(), imgUrl: AppImage.kPassionNature),
    GenreModel(
      name: LocaleKeys.photography.tr(),
      imgUrl: AppImage.kPassionPhotography,
    ),
    GenreModel(
      name: LocaleKeys.concerts.tr(),
      imgUrl: AppImage.kPassionConcert,
    ),
    GenreModel(name: LocaleKeys.travel.tr(), imgUrl: AppImage.kPassionTravel),
    GenreModel(name: LocaleKeys.music.tr(), imgUrl: AppImage.kPassionMusic),
  ];

  static List<String> kWords = [
    LocaleKeys.redefining.tr(),
    LocaleKeys.social.tr(),
    LocaleKeys.connection.tr(),
    LocaleKeys.and.tr(),
    LocaleKeys.concert.tr(),
    LocaleKeys.experiences.tr(),
    LocaleKeys.into.tr(),
  ];
  static List<String> kQ1Choices = [
    LocaleKeys.rock_concert.tr(),
    LocaleKeys.rap_battle.tr(),
    LocaleKeys.jazz_night.tr(),
    LocaleKeys.classical_orchestra.tr(),
    LocaleKeys.music_festivals.tr(),
  ];
  static List<String> kQ3Choices = [
    LocaleKeys.every_week.tr(),
    LocaleKeys.once_a_month.tr(),
    LocaleKeys.every_few_months.tr(),
    LocaleKeys.rarely.tr(),
    LocaleKeys.never.tr(),
  ];

  static List<String> kQ4Choices = [LocaleKeys.yes.tr(), LocaleKeys.no.tr()];
  static List<String> travelOptions = [
    LocaleKeys.within_my_city.tr(),
    LocaleKeys.another_city_nearby.tr(),
    LocaleKeys.anywhere_in_country.tr(),
    LocaleKeys.even_abroad.tr(),
    LocaleKeys.dont_travel.tr(),
  ];
  static List<String> personalityOptions = [
    LocaleKeys.talkative_energetic.tr(),
    LocaleKeys.calm_chill.tr(),
    LocaleKeys.adventurous.tr(),
    LocaleKeys.artistic_deep.tr(),
  ];
  static List<String> discoverOptions = [
    LocaleKeys.discover_through_friends.tr(),
    LocaleKeys.discover_social_media.tr(),
    LocaleKeys.discover_music_apps.tr(),
    LocaleKeys.discover_concerts.tr(),
    LocaleKeys.discover_online.tr(),
  ];
  static List<String> concertCompanyOptions = [
    LocaleKeys.always_with_friends.tr(),
    LocaleKeys.prefer_with_date.tr(),
    LocaleKeys.enjoy_both.tr(),
    LocaleKeys.prefer_solo.tr(),
  ];
  static List<String> loveTravelOptions = [
    LocaleKeys.love_traveling.tr(),
    LocaleKeys.prefer_local.tr(),
    LocaleKeys.both_fine.tr(),
  ];

  static void precacheAppImages(BuildContext context) {
    final List<AssetImage> imagesToPrecache = [
      const AssetImage(AppImage.kLogoImage),
      const AssetImage(AppImage.kTalaImage),
      const AssetImage(AppImage.kOnboardingLogo),
      const AssetImage(AppImage.kOnboarding2),
      const AssetImage(AppImage.kOnboarding1),
    ];

    for (final image in imagesToPrecache) {
      precacheImage(image, context);
    }
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  buildShowSnackBar(
    BuildContext context,
    String message, [
    ContentType type = ContentType.failure,
    String title = 'Oops',
  ]) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          messageTextStyle: Styling.textStyle10.copyWith(fontSize: 15),
          contentType: type,
        ),
      ),
    );
  }

  static Future<void> showSignOutConfirmationDialog(
    BuildContext context,
  ) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: 'Sign Out',
      message: 'Are you sure you want to sign out?',
      okLabel: 'Yes, Sign Out',
      cancelLabel: 'Cancel',
      barrierDismissible: false,
    );

    if (result == OkCancelResult.ok) {
      await FirebaseAuth.instance.signOut();

      GoRouter.of(context).go(AppRoutes.loginScreen);
    }
  }
}
