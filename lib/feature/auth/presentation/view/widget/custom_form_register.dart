import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/check_agree_terms.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_register.dart';
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
    // TODO: implement initState
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          CustomButton(
            onTap: () {
              if (form.currentState!.validate()) {
                form.currentState!.save();
                autoValidateMode = AutovalidateMode.disabled;
                RegisterParam param = RegisterParam(
                  firstName: firstName.text,
                  lastName: lastName.text,
                  email: email.text,
                  phoneNum: phone.text,
                  password: password.text,
                  isAgree: true,
                );
                BlocProvider.of<AuthCubit>(context).register(param);
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }

              // GoRouter.of(context).push(AppRoutes.otpScreen,extra: false);
            },
            name: LocaleKeys.signUp.tr(),
          ),
        ],
      ),
    );
  }
}
