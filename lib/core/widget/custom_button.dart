import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.name});
  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.r30),
      splashColor: AppColor.kLightPink,
      child: Ink(
        width: double.infinity,
        padding:  EdgeInsets.symmetric( vertical: AppDimensions.r17),
        decoration: ShapeDecoration(
          gradient:const LinearGradient(
            begin: Alignment(0.00, 0.50),
            end: Alignment(1.00, 0.50),
            colors: [AppColor.kPrimaryPink, AppColor.kLilac ],

          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r30),
          ),
          shadows: const[
            BoxShadow(
              color: AppColor.kBlack25,
              blurRadius: 14,
              offset: Offset(5, 5),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            name,
            style: Styling.textStyleB20,
          ),
        ),
      ),
    );
  }
}
