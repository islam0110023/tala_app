import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/manager/save_user_cubit/save_user_cubit.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_profile_like_2.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomDownProfileLike2 extends StatelessWidget {
  const CustomDownProfileLike2({super.key, required this.profileFormKey});

  final GlobalKey<CustomFieldsProfileLike2State> profileFormKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaveUserCubit, SaveUserState>(
      listener: (context, state) {
        if (state is SaveUserSuccess) {
          AppConstant.buildShowSnackBar(
            context,
            LocaleKeys.profile_completed.tr(),
            ContentType.success,
            LocaleKeys.welcome.tr(),
          );

          GoRouter.of(context).go(AppRoutes.homeScreen);
        }
        if (state is SaveUserFailure) {
          AppConstant.buildShowSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              state is SaveUserLoading
                  ? const CircularProgressIndicator(
                      color: AppColor.kPrimaryPink,
                    )
                  : CustomButton(
                      onTap: () async {
                        final isConnected = await AppConstant.isConnected();
                        if (!isConnected) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(LocaleKeys.noInternetConnection.tr())),
                          );
                          return;
                        }
                        if (profileFormKey.currentState!.validate()) {
                          final personality = profileFormKey.currentState!
                              .setAllValues();
                          final cubit = BlocProvider.of<UserFormCubit>(context);
                          cubit.setPersonality(personality);
                          final uid = FirebaseAuth.instance.currentUser!.uid;
                          cubit.setUid(uid);
                          cubit.setComplete();
                          final userModel = cubit.build();
                          BlocProvider.of<SaveUserCubit>(
                            context,
                          ).saveUser(userModel);
                          FocusScope.of(context).unfocus();

                        }
                      },
                      name: LocaleKeys.next.tr(),
                    ),
              SizedBox(height: AppDimensions.h20),
            ],
          ),
        );
      },
    );
  }
}
