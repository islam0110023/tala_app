import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_genres_music_buttons.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomActionPassions extends StatelessWidget {
  const CustomActionPassions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h32),
        CustomButton(
          onTap: () {
            final selectedGenres = CustomGenresMusicButtons.getSelectedGenres(
              AppConstant.kGenresPassion,
            );
            if (selectedGenres.length <= 5 && selectedGenres.isNotEmpty) {
              final cubit = BlocProvider.of<UserFormCubit>(context);
              cubit.setPassions(selectedGenres);
              FocusScope.of(context).unfocus();

              GoRouter.of(
                context,
              ).push(AppRoutes.profileLike1Screen, extra: cubit);
            } else {
              AppConstant.buildShowSnackBar(
                context,
                'Please Select Interests Passions Up To Five',
              );
            }
          },
          name: LocaleKeys.next.tr(),
        ),
        SizedBox(height: AppDimensions.h16),
      ],
    );
  }
}
