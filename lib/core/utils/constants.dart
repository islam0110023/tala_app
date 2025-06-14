import 'package:flutter/material.dart';
import 'package:tala_app/core/model/genre_model.dart';
import 'package:tala_app/core/utils/asset_image.dart';

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

  static const List<String> kWords = [
    'Redefining',
    'Social',
    'Connection',
    'And',
    'Concert',
    'Experiences',
    'into',
  ];
 static void precacheAppImages(BuildContext context) {
    final List<AssetImage> imagesToPrecache = [
      const AssetImage('assets/images/logo_tala.png'),
      const AssetImage('assets/images/Tala.png'),
      const AssetImage('assets/images/onboarding_logo.png'),
      const AssetImage('assets/images/on boarding 12 (2).png'),
      const AssetImage('assets/images/on boarding 13.png'),
    ];

    for (final image in imagesToPrecache) {
      precacheImage(image, context);
    }
  }


}
