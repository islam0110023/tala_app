import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/model/genre_model.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/genre_button.dart';

class CustomGenresMusicButtons extends StatelessWidget {
  const CustomGenresMusicButtons({super.key, required this.genres});

  final List<GenreModel> genres;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppDimensions.w10,
          mainAxisSpacing: AppDimensions.h10,
          childAspectRatio: 150.w/110.h,
        ),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return GenreButton(genre: genres[index]);
        },
      ),
    );
  }
}
