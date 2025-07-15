import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/widget/custom_dropdown.dart';
import 'package:tala_app/core/widget/custom_text_field.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomFieldsSetProfile extends StatelessWidget {
  const CustomFieldsSetProfile({
    super.key,
    required this.name,
    required this.gender,
    required this.date,
    required this.location,
    required this.onTap,
    required this.onChanged,
  });
  final TextEditingController name;
  final String gender;
  final TextEditingController date;
  final TextEditingController location;
  final VoidCallback onTap;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: LocaleKeys.name.tr(),
          controller: name,
          suffixIcon: CupertinoIcons.person_crop_circle,
        ),
        SizedBox(height: AppDimensions.h14),
        CustomDropdown(
          options: AppConstant.kGenderOptions,
          onChanged: onChanged,
          value: gender,
        ),
        SizedBox(height: AppDimensions.h14),
        CustomTextField(
          controller: date,
          readOnly: true,
          onTap: onTap,
          hint: LocaleKeys.date.tr(),
          suffixIcon: CupertinoIcons.calendar,
          textInputType: TextInputType.datetime,
        ),
        SizedBox(height: AppDimensions.h14),
        CustomTextField(
          controller: location,
          hint: LocaleKeys.location.tr(),
          suffixIcon: CupertinoIcons.location_solid,
        ),
      ],
    );
  }
}
