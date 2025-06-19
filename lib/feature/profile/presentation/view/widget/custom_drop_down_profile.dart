import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomDropDownProfile extends StatefulWidget {
  const CustomDropDownProfile({
    super.key,
    required this.options,
    required this.label,
    required this.hint,
  });
  final List<String> options;
  final String label;
  final String hint;

  @override
  State<CustomDropDownProfile> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropDownProfile> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          textAlign: TextAlign.start,
          style: Styling.textStyle15.copyWith(
            color: AppColor.kBlack,
            height: 1.13,
          ),
        ),
        SizedBox(height: AppDimensions.h9),
        Container(
          padding: EdgeInsets.all(AppDimensions.r3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.r15),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.kLightPink, AppColor.kDarkPurple],
            ),
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
                icon: Icon(
                  CupertinoIcons.chevron_down,
                  size: AppDimensions.r24,
                ),
              ),

              value: selectedGender,
              hint: Text(widget.hint, style: Styling.textStyle13),
              decoration: InputDecoration(
                isDense: true,
                fillColor: AppColor.kWhite1,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.r16,
                  vertical: AppDimensions.r13,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.r11),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.r11),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(AppDimensions.r11),
                ),
              ),
              isExpanded: true,
              dropdownStyleData: DropdownStyleData(
                width: AppDimensions.w343,
                elevation: 0,
                offset: const Offset(0, -10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.r15),
                  color: AppColor.kWhite1,
                  border: GradientBoxBorder(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColor.kLightPink, AppColor.kDarkPurple],
                    ),
                    width: AppDimensions.r3,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
