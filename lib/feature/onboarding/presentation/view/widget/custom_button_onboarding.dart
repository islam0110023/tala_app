import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomButtonOnboarding extends StatelessWidget {
  const CustomButtonOnboarding({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColor.kBlack25,
            blurRadius: 4,
            offset: Offset(5, 5),
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(AppDimensions.r30),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize:const Size(double.infinity, double.nan),
          backgroundColor: AppColor.kPrimaryPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r30),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.r15,
            horizontal: AppDimensions.r30,
          ),
        ),
        child: Text(
          LocaleKeys.startExperience.tr() ,
          style: Styling.textStyleB20
        ),
      ),
    );
  }
}
