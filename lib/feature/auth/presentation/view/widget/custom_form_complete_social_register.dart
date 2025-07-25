import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/check_agree_terms.dart';
import 'package:tala_app/feature/auth/presentation/view/widget/custom_fields_complete_register.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFormCompleteSocialRegister extends StatefulWidget {
  const CustomFormCompleteSocialRegister({super.key});

  @override
  State<CustomFormCompleteSocialRegister> createState() => _CustomFormCompleteSocialRegisterState();
}

class _CustomFormCompleteSocialRegisterState extends State<CustomFormCompleteSocialRegister> {
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
          SizedBox(height: AppDimensions.h51,),
          CustomButton(onTap: (){
            if(formKey.currentState!.validate()){
              formKey.currentState!.save();
              autoValidateMode = AutovalidateMode.disabled;
            }else{
              autoValidateMode = AutovalidateMode.always;
              setState(() {});
            }
          }, name: LocaleKeys.next.tr()),
        ],
      ),
    );
  }
}

