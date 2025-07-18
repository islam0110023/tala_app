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
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:tala_app/feature/auth/presentation/manager/save_user_auth_cubit/save_user_auth_cubit.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/check_agree_terms.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_register.dart';
import 'package:tala_app/feature/profile/presentation/manager/user_form_cubit/user_form_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFormRegister extends StatefulWidget {
  const CustomFormRegister({super.key});

  @override
  State<CustomFormRegister> createState() => _CustomFormRegisterState();
}

class _CustomFormRegisterState extends State<CustomFormRegister> {
  GlobalKey<FormState> form = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveUserAuthCubit, SaveUserAuthState>(
      listener: (context, state) {
        if (state is SaveUserAuthSuccess) {
          final cubit = BlocProvider.of<UserFormCubit>(context);

          GoRouter.of(context).push(
            AppRoutes.otpScreen,
            extra: {'isNewPassword': false, 'cubit': cubit},
          );
        }
      },
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            final user = BlocProvider.of<RegisterCubit>(
              context,
            ).signUpEntity!.credential.user;
            final uid = user!.uid;
            final cubit = BlocProvider.of<UserFormCubit>(context);
            cubit.setBasicInfo(
              uid: uid,
              email: email.text,
              phone: phone.text,
              firstName: firstName.text,
              lastName: lastName.text,
            );
            final user1 = cubit.firstBuild();
            BlocProvider.of<SaveUserAuthCubit>(context).saveUser(user1);
            //verifyEmail(user);
            //context.read<RegisterCubit>().reset();
          }
          if (state is SignUpFailure) {
            AppConstant.buildShowSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          return Form(
            key: form,
            autovalidateMode: autoValidateMode,

            child: Column(
              children: [
                CustomFieldsRegister(
                  firstName: firstName,
                  email: email,
                  lastName: lastName,
                  phone: phone,
                  password: password,
                ),
                const CheckAgreeTerms(),
                SizedBox(height: AppDimensions.h41),
                state is SignUpLoading
                    ? const CircularProgressIndicator(
                        color: AppColor.kPrimaryPink,
                      )
                    : CustomButton(
                        onTap: () async{
                          final isConnected = await AppConstant.isConnected();
                          if (!isConnected) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(LocaleKeys.noInternetConnection.tr())),
                            );
                            return;
                          }
                          signUp(context);
                        },
                        name: LocaleKeys.signUp.tr(),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  void signUp(BuildContext context) {
    if (form.currentState!.validate()) {
      form.currentState!.save();
      autoValidateMode = AutovalidateMode.disabled;
      final RegisterParam param = RegisterParam(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phoneNum: phone.text,
        password: password.text,
        isAgree: true,
      );
      BlocProvider.of<RegisterCubit>(context).register(param);
      FocusScope.of(context).unfocus();
    } else {
      autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  Future<void> verifyEmail(User? user) async {
    // final user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      AppConstant.buildShowSnackBar(
        context,
        'Verification email sent',
        ContentType.help,
      );
    }
  }
}
