import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomPassionsLabels extends StatelessWidget {
  const CustomPassionsLabels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'What  are your passions?',
          style: Styling.textStyle18,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimensions.h12),
        Text(
          'You can select up to five interests',
          style: Styling.textStyle16700.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppDimensions.h32),
      ],
    );
  }
}