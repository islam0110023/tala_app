import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.password_flag = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.onTap,
    this.controller,
    this.readOnly = false,
  });
  final String hint;
  final bool password_flag;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;

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
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        obscureText: password_flag,
        enableSuggestions: true,
        onTap: onTap,
        keyboardType: textInputType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hint,
          fillColor: AppColor.kTextFieldColor,
          filled: true,
          hintStyle: Styling.textStyle13,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimensions.r16,
            vertical: AppDimensions.r20,
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
      ),
    );
  }
}
