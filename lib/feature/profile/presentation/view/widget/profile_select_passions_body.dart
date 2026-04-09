import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_action_passions.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_genres_music_buttons.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_passions_labels.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_upper_passions.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/gradient_rectangle_blur.dart';

class ProfileSelectPassionsBody extends StatelessWidget {
  const ProfileSelectPassionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientRectangleBlur(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.w25),
          child: Column(
            children: [
              const CustomUpperPassions(),
              const CustomPassionsLabels(),
              CustomGenresMusicButtons(genres: AppConstant.kGenresPassion),
              const CustomActionPassions(),
            ],
          ),
        ),
      ],
    );
  }
}
