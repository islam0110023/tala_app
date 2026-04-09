import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_profile_like_1.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomDownProfileLike1 extends StatelessWidget {
  const CustomDownProfileLike1({super.key, required this.profileFormKey});
  final GlobalKey<CustomFieldsProfileLike1State> profileFormKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            onTap: () {
              if (profileFormKey.currentState!.validate()) {
                final musicLike = profileFormKey.currentState!
                    .getAllSelectedValues();
                final cubit = BlocProvider.of<UserFormCubit>(context);
                cubit.setMusicLike(musicLike);
                FocusScope.of(context).unfocus();

                GoRouter.of(
                  context,
                ).push(AppRoutes.profileLike2Screen, extra: cubit);
              }
            },
            name: LocaleKeys.next.tr(),
          ),
          SizedBox(height: AppDimensions.h16),
        ],
      ),
    );
  }
}
