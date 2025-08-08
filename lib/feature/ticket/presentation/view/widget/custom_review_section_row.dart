import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomReviewSectionRow extends StatelessWidget {
  const CustomReviewSectionRow({
    super.key,
    required this.title,
    required this.subtitle, this.isNumbers=false,
  });
  final String title;
  final String subtitle;
  final bool isNumbers;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styling.textStyle12600ReviewInfo,
        ),
        Text(
        (isNumbers)?'\$${(double.tryParse(subtitle) ?? 0.0).toStringAsFixed(2)}':subtitle,
          style: Styling.textNavBar
        ),
      ],
    );
  }
}