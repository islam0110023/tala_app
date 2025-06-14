import 'package:flutter/material.dart';
import 'package:tala_app/core/model/genre_model.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class GenreButton extends StatefulWidget {
  const GenreButton({super.key, required this.genre});
  final GenreModel genre;

  @override
  State<GenreButton> createState() => _GenreButtonState();
}

class _GenreButtonState extends State<GenreButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimensions.r18),
      onTap: () {
        widget.genre.isSelected = !widget.genre.isSelected;
        setState(() {

        });
      },
      child: Card(
        color: widget.genre.isSelected ? AppColor.kPrimaryPink : AppColor.kSugarWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppDimensions.r18),
        ),
        elevation: 5,
        child: Center(
          child: Text(
            widget.genre.name,
            textAlign: TextAlign.center,
            style: Styling.textStyleB20.copyWith(
              color: widget.genre.isSelected ? AppColor.kWhite1 : AppColor.kLightPink,
            ),
          ),
        ),
      ),
    );
  }
}
