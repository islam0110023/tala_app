import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_genres_music_buttons.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/gradient_rectangle_blur.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_progress_bar.dart';

class ProfileMusicPreferencesBody extends StatelessWidget {
  const ProfileMusicPreferencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientRectangleBlur(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.w25),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.h47),
              const ProfileProgressBar(done: 1),
              SizedBox(height: AppDimensions.h52),
              Text(
                'What genres of music do you enjoy the most?',
                style: Styling.textStyle16700,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.h12),
              Text(
                'You can select up to five interests',
                style: Styling.textStyle16700.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppDimensions.h32),
              CustomGenresMusicButtons(genres: AppConstant.kGenres),
              SizedBox(height: AppDimensions.h32),
              CustomButton(onTap: () {
                GoRouter.of(context).push(AppRoutes.profileSelectPassionsScreen);
              }, name: 'Next'),
              SizedBox(height: AppDimensions.h16),
            ],
          ),
        ),
      ],
    );
  }
}
