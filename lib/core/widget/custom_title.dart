import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.w309,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Styling.textStyle20.copyWith(color: AppColor.kTitleColor),
      ),
    );
  }
}
