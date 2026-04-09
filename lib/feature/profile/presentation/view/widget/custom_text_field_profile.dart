import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomTextFieldProfile extends StatelessWidget {
  const CustomTextFieldProfile({
    super.key,
    required this.hint,
    this.password_flag = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.onTap,
    this.controller,
    this.readOnly = false,
    required this.label,
  });
  final String hint;
  final bool password_flag;
  final TextInputType textInputType;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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
          child: TextFormField(
            readOnly: readOnly,
            controller: controller,
            obscureText: password_flag,
            enableSuggestions: true,
            onTap: onTap,
            keyboardType: textInputType,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.r15),
                child: Icon(suffixIcon, size: AppDimensions.r24),
              ),
              hintText: hint,

              fillColor: AppColor.kWhite1,
              filled: true,
              hintStyle: Styling.textStyle13,
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
          ),
        ),
      ],
    );
  }
}
