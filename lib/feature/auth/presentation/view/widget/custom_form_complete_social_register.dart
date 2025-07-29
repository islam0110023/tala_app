import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/services/internet_services.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/service_locator.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/auth/presentation/manager/save_user_auth_cubit/save_user_auth_cubit.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/check_agree_terms.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_complete_register.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFormCompleteSocialRegister extends StatefulWidget {
  const CustomFormCompleteSocialRegister({super.key});

  @override
  State<CustomFormCompleteSocialRegister> createState() =>
      _CustomFormCompleteSocialRegisterState();
}

class _CustomFormCompleteSocialRegisterState
    extends State<CustomFormCompleteSocialRegister> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late TextEditingController yourNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    yourNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    yourNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaveUserAuthCubit, SaveUserAuthState>(
      listener: (context, state) {
        if (state is SaveUserAuthSuccess) {
          final cubit = BlocProvider.of<UserFormCubit>(context);
          context.pop();

          GoRouter.of(
            context,
          ).push(AppRoutes.profileSetInfoScreen, extra: cubit);
        }
        if (state is SaveUserAuthFailure) {
          context.pop();
          AppConstant.buildShowSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              CustomFieldsCompleteRegister(
                yourNameController: yourNameController,
                lastNameController: lastNameController,
                phoneNumberController: phoneNumberController,
              ),
              const CheckAgreeTerms(),
              SizedBox(height: AppDimensions.h51),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    autoValidateMode = AutovalidateMode.disabled;
                    saveUser(context);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                name: LocaleKeys.next.tr(),
              ),
            ],
          ),
        );
      },
    );
  }

  void saveUser(BuildContext context) {
    final isConnected = getIt<InternetService>().isConnected;
    if (!isConnected) {
      AppConstant.buildShowSnackBar(
        context,
        LocaleKeys.noInternetConnection.tr(),
      );
      return;
    }
    AppConstant.showLoadingDialog(context);
    final user = FirebaseAuth.instance.currentUser!;
    context.read<UserFormCubit>().setBasicInfo(
      uid: user.uid,
      email: user.email!,
      phone: phoneNumberController.text,
      firstName: yourNameController.text,
      lastName: lastNameController.text,
    );
    final user1 = context.read<UserFormCubit>().firstBuild();
    context.read<SaveUserAuthCubit>().saveUser(user1);
  }
}
