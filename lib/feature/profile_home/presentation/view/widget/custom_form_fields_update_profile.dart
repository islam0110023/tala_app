import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/home/domain/entities/user_entity.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_set_profile.dart';
import 'package:tala_app/feature/profile_home/presentation/manager/update_profile/update_profile_cubit.dart';

class CustomFormFieldsUpdateProfile extends StatefulWidget {
  const CustomFormFieldsUpdateProfile({super.key});

  @override
  State<CustomFormFieldsUpdateProfile> createState() =>
      _CustomFormFieldsUpdateProfileState();
}

class _CustomFormFieldsUpdateProfileState
    extends State<CustomFormFieldsUpdateProfile> {
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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final user = GoRouterState.of(context).extra as UserEntity?;
    name.text = user?.name ?? '';
    date.text = user?.data ?? '';
    location.text = user?.location ?? '';
    gender = user?.gender ?? '';
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
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                final cubit = BlocProvider.of<UpdateProfileCubit>(context);
                cubit.setName(name.text);
                cubit.setGender(gender);
                cubit.setDate(date.text);
                cubit.setLocation(location.text);
                if (cubit.state.image == null) {
                  cubit.update(cubit.build1());
                } else {
                  final data = cubit.build();
                  cubit.update(data);
                }

                FocusScope.of(context).unfocus();
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
            name: 'Update Profile',
          ),
          BlocListener<UpdateProfileCubit, UserUpdateProfileModel>(
            listener: (context, state) {
              if (state.isSuccess == true) {
                if (context.canPop()) {
                  context.pop();
                }
                GoRouter.of(context).pop('isUpdate');
              }
              if (state.isError == true) {
                if (context.canPop()) {
                  context.pop();
                }
                AppConstant.buildShowSnackBar(context, 'Something went wrong');
              }
              if (state.isLoading == true) {
                AppConstant.showLoadingDialog(context);
              }
            },
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
