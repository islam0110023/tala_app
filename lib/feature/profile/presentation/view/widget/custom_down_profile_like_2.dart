import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_profile_like_2.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomDownProfileLike2 extends StatelessWidget {
  const CustomDownProfileLike2({super.key, required this.profileFormKey});
  final GlobalKey<CustomFieldsProfileLike2State> profileFormKey;

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
                final personality = profileFormKey.currentState!.setAllValues();
                final cubit = BlocProvider.of<UserFormCubit>(context);
                cubit.setPersonality(personality);
                final userModel = cubit.build();
                print(userModel.toMap());
              }
            },
            name: LocaleKeys.next.tr(),
          ),
          SizedBox(height: AppDimensions.h20),
        ],
      ),
    );
  }
}
