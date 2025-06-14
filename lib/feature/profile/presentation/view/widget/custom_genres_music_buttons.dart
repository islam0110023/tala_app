import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/genre_button.dart';

class CustomGenresMusicButtons extends StatelessWidget {
  const CustomGenresMusicButtons({
    super.key,
    required this.genres,
  });

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < genres.length; i += 2)
          Padding(
            padding: EdgeInsets.only(bottom: AppDimensions.h16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenreButton(genres[i]),
                if (i + 1 < genres.length)
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppDimensions.w16,
                    ),
                    child: GenreButton(genres[i + 1]),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}