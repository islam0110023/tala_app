import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_genres_music_buttons.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/gradient_rectangle_blur.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_progress_bar.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

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
                LocaleKeys.what_music_genres.tr(),
                style: Styling.textStyle16700,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.h12),
              Text(
                LocaleKeys.select_up_to_five.tr(),
                style: Styling.textStyle16700.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppDimensions.h32),
              CustomGenresMusicButtons(genres: AppConstant.kGenres),
              SizedBox(height: AppDimensions.h32),
              CustomButton(
                onTap: () {
                  passDataToForm(context);
                },
                name: LocaleKeys.next.tr(),
              ),
              SizedBox(height: AppDimensions.h16),
            ],
          ),
        ),
      ],
    );
  }

  void passDataToForm(BuildContext context) {
    final selectedGenres =
        CustomGenresMusicButtons.getSelectedGenres(
          AppConstant.kGenres,
        );
    if (selectedGenres.isNotEmpty) {
      final cubit = BlocProvider.of<UserFormCubit>(context);
      cubit.setMusicType(selectedGenres);
      GoRouter.of(
        context,
      ).push(AppRoutes.profileSelectPassionsScreen, extra: cubit);
    } else {
      AppConstant.buildShowSnackBar(
        context,
        'Please Select Interests Music',
      );
    }
  }
}
