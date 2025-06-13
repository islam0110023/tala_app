import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title, this.textFont = 20});
  final String title;
  final double textFont;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: AppDimensions.w327,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Styling.textStyle20.copyWith(
          color: AppColor.kTitleColor,
          fontSize: textFont.sp,
        ),
      ),
    );
  }
}
