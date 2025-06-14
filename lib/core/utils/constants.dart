import 'package:flutter/material.dart';
import 'package:tala_app/core/model/genre_model.dart';

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
