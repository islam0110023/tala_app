import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.otherController, required this.onPressed, required this.hintText,
  });

  final TextEditingController? otherController;
  final VoidCallback onPressed;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r55,vertical: AppDimensions.r10),
        side: const BorderSide(color: AppColor.kPrimaryPink,width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r20),
        ),
        backgroundColor: AppColor.kWhite,
        elevation: 3,
      ),
      child: Text(
          hintText,
          style: Styling.homeTextButton
      ),
    );
  }
}