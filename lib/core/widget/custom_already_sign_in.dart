import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomAlreadySignIn extends StatelessWidget {
  const CustomAlreadySignIn({
    super.key, required this.onTap, required this.name1, required this.name2,
  });
  final VoidCallback onTap;
  final String name1;
  final String name2;



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name1,
          style: Styling.textStyle16
        ),
        SizedBox(width: AppDimensions.w16),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name2,
            style: Styling.textStyleB16,
          ),
        ),
      ],
    );
  }
}
