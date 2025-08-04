import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:tala_app/core/model/genre_model.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

abstract class AppConstant {
  static const kFontFamily = 'Poppins';
  static const kFontFamily2 = 'Lato';
  static const kFontFamilyInter = 'Inter';
  static const kDurationSplash = 2;
  static const pineconeApiKey =
      'pcsk_BPAiy_BFB9iHbBLspoV4MHyYBkr7NWhhNdDTu7zv5AM4Ew6BFtbmukZw9QVYi1uEvNYmr';

  static const apiKeyOpenAi =
      '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';

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

  static Future<OkCancelResult> showSignOutConfirmationDialog(
    BuildContext context,
    String title,
    String message,
  ) async {
    return await showOkCancelAlertDialog(
      context: context,
      title: title,
      message: message,
      okLabel: '${LocaleKeys.yes.tr()}, $title',
      cancelLabel: LocaleKeys.cancel.tr(),
      barrierDismissible: false,
    );
  }

  static Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    return await InternetConnectionChecker.instance.hasConnection;
  }

  static final List<int> notifications = List.generate(5, (index) => index);

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: AppDimensions.r140),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r15),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.r12),
            child: SizedBox(
              width: AppDimensions.r60,
              height: AppDimensions.r60,
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? const Center(child: CupertinoActivityIndicator())
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kPrimaryPink,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  static List<num> addNoise(List<num> vector, [double noise = 0.01]) {
    final random = Random();
    return vector.map((v) => v + (random.nextDouble() * noise)).toList();
  }

  static int calculateAge(String dateOfBirth) {
    try {
      final dob = DateFormat('dd/MM/yyyy').parse(dateOfBirth);
      final today = DateTime.now();
      int age = today.year - dob.year;
      if (today.month < dob.month ||
          (today.month == dob.month && today.day < dob.day)) {
        age--;
      }
      return age;
    } catch (e) {
      return 0;
    }
  }
}
