import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';

class CustomHomePagesHeader extends StatelessWidget {
  const CustomHomePagesHeader({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomArrowBack(onTap: () {}, arrowColor: Colors.white),
        const Spacer(),
        Text(
          title,
          style: Styling.textStyle18700Purple,
        ),
        const Spacer(),
        SizedBox(
          width: AppDimensions.w30,
        )
      ],
    );
  }
}