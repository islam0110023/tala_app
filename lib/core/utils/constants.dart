import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/model/genre_model.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

abstract class AppConstant{
  static const kFontFamily='Lato';
  static const kFontFamilyInter='Inter';
  static const kDurationSplash=2;
  static final List<GenreModel> kGenres = [
    GenreModel(name: 'Rock'),
    GenreModel(name: 'Classical'),
    GenreModel(name: 'Hi-Hop'),
    GenreModel(name: 'Jazz'),
    GenreModel(name: 'Each of the above'),
    GenreModel(name: 'Country'),
    GenreModel(name: 'Indie'),
    GenreModel(name: 'Rock'),
  ];
  static final List<GenreModel> kGenresPassion = [
    GenreModel(name: 'Gaming', imgUrl: AppImage.kPassionGaming),
    GenreModel(name: 'Dance', imgUrl: AppImage.kPassionDance),
    GenreModel(name: 'Arts', imgUrl: AppImage.kPassionArts),
    GenreModel(name: 'Nature', imgUrl: AppImage.kPassionNature),
    GenreModel(name: 'Photography', imgUrl: AppImage.kPassionPhotography),
    GenreModel(name: 'Concerts', imgUrl: AppImage.kPassionConcert),
    GenreModel(name: 'Travel', imgUrl: AppImage.kPassionTravel),
    GenreModel(name: 'Music', imgUrl: AppImage.kPassionMusic),
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


}
