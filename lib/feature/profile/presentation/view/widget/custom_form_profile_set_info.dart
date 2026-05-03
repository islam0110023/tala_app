import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/core/services/internet_services.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_set_profile.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFormProfileSetInfo extends StatefulWidget {
  const CustomFormProfileSetInfo({super.key});

  @override
  State<CustomFormProfileSetInfo> createState() =>
      _CustomFormProfileSetInfoState();
}

class _CustomFormProfileSetInfoState extends State<CustomFormProfileSetInfo> {
  late TextEditingController name;
  late TextEditingController date;
  late TextEditingController location;
  String gender = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    name = TextEditingController();
    date = TextEditingController();
    location = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    date.dispose();
    location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomFieldsSetProfile(
            name: name,
            gender: gender,
            date: date,
            location: location,
            onTap: () {
              showDatePicker(
                context: context,
                firstDate: DateTime(1900),

                lastDate: DateTime.now(),
              ).then((value) {
                if (value != null) {
                  date.text =
                      "${value.day.toString().padLeft(2, "0")}/${value.month.toString().padLeft(2, "0")}/${value.year.toString()}";
                }
              });
            },
            onChanged: (p0) {
              setState(() {
                gender = p0!;
              });
            },
          ),
          SizedBox(height: AppDimensions.h42),
          CustomButton(
            onTap: () async {
              // final isConnected = getIt<InternetService>().isConnected;
              // if (!isConnected) {
              //   AppConstant.buildShowSnackBar(
              //     context,
              //     LocaleKeys.noInternetConnection.tr(),
              //   );
              //   return;
              // }
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                final cubit = BlocProvider.of<UserFormCubit>(context);
                if (cubit.state.image == null) {
                  AppConstant.buildShowSnackBar(
                    context,
                    'Please upload your profile picture',
                  );
                  return;
                }
                final UserProfile userProfileModel = UserProfile(
                  name: name.text,
                  gender: gender,
                  dateOfBirth: date.text,
                  location: location.text,
                );
                cubit.setProfile(userProfileModel);
                FocusScope.of(context).unfocus();

                GoRouter.of(
                  context,
                ).push(AppRoutes.profileMusicPreferencesScreen, extra: cubit);
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
            name: LocaleKeys.completeProfile.tr(),
          ),
        ],
      ),
    );
  }
}
