import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.options,
    required this.onChanged,
    required this.value,
  });
  final List<String> options;
  final Function(String?) onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.kBlack25,
            blurRadius: 14,
            offset: Offset(5, 5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2(
          validator: (value) {
            if (value == null) {
              return 'please select gender';
            }
            return null;
          },
          items: options.map((gender) {
            return DropdownMenuItem<String>(
              child: Text(gender, style: Styling.textStyle13),
              value: gender,
            );
          }).toList(),
          onChanged: onChanged,
          isDense: true,

          iconStyleData: IconStyleData(
            icon: Icon(CupertinoIcons.chevron_down, size: AppDimensions.r24),
          ),

          value: (value != null && options.contains(value)) ? value : null,

          hint: Text(LocaleKeys.gender.tr(), style: Styling.textStyle13),
          decoration: InputDecoration(
            isDense: true,
            fillColor: AppColor.kTextFieldColor,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppDimensions.r16,
              vertical: AppDimensions.r25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.r15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.r15),
              borderSide: BorderSide(
                color: AppColor.kPrimaryPink,
                width: AppDimensions.w2_2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppDimensions.r15),
            ),
          ),
          isExpanded: true,
          dropdownStyleData: DropdownStyleData(
            width: AppDimensions.w343,
            offset: const Offset(0, -10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.r15),
              color: AppColor.kTextFieldColor,
            ),
          ),
        ),
      ),
    );
  }
}
