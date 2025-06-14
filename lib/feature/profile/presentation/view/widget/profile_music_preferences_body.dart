import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_genres_music_buttons.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/gradient_rectangle_blur.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_progress_bar.dart';

class ProfileMusicPreferencesBody extends StatelessWidget {
  ProfileMusicPreferencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientRectangleBlur(),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.w25,
              vertical: AppDimensions.h53,
            ),
            child: Column(
              children: [
                SizedBox(height: AppDimensions.h9),
                const ProfileProgressBar(done: 0.75,),
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
                const CustomGenresMusicButtons(genres: AppConstant.kGenres),
                SizedBox(height: AppDimensions.h32),
                CustomButton(onTap: () {}, name: 'Next'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}







