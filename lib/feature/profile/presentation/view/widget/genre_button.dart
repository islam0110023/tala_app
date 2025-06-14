import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class GenreButton extends StatelessWidget {
  final String genre;

  GenreButton(this.genre);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = ['Jazz', 'Each of the above'].contains(genre);
    return Container(
      width: AppDimensions.w150,
      height: AppDimensions.h110,
      decoration: BoxDecoration(
        gradient: isSelected
            ? null
            : const LinearGradient(
          begin: Alignment(0.50, -0.00),
          end: Alignment(0.50, 1.00),
          colors: [Color(0xFFEFEFEF), Color(0xD8EFEFEF)],
        ),
        color: isSelected ? const Color(0xFFDB0165) : null,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x285B0E6D),
            blurRadius: 14,
            offset: Offset(5, 5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
            genre,
            textAlign: TextAlign.center,
            style: Styling.textStyleB20.copyWith(color: isSelected ? Colors.white : AppColor.kLightPink)
        ),
      ),
    );
  }
}