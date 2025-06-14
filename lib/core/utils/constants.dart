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

}
