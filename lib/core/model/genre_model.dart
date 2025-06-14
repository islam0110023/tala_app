import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';

class GenreModel {
  GenreModel( {this.imgUrl=null, required this.name, this.isSelected = false});

  final String name;
  bool isSelected;
  final String? imgUrl;
}
