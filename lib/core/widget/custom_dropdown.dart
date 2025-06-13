import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, required this.options});
  final List<String> options;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedGender;

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
          items: widget.options.map((gender) {
            return DropdownMenuItem<String>(
              child: Text(gender, style: Styling.textStyle13),
              value: gender,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
          isDense: true,

          iconStyleData: IconStyleData(
            icon: Icon(CupertinoIcons.chevron_down, size: AppDimensions.r24),
          ),

          value: selectedGender,
          hint: Text('Gender', style: Styling.textStyle13),
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
