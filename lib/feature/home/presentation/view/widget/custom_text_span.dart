import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({
    super.key, required this.textKey, required this.textValue,
  });
  final String textKey;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: textKey,
            style: Styling.textSpanKeyStyle,
          ),
          TextSpan(
            text: textValue,
            style: Styling.textSpanValueStyle,
          ),
        ],
      ),
    );
  }
}