import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';

class GenreModel {
  GenreModel({required this.name, this.isSelected = false});

  final String name;
  bool isSelected;
  final Color selectedColor = AppColor.kPrimaryPink;
  final Color notSelectedColor = AppColor.kSugarWhite;
  final Color selectedTextColor = AppColor.kWhite1;
  final Color notSelectedTextColor = AppColor.kLightPink;
}
