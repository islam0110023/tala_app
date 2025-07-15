import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomScreenHandling extends StatelessWidget {
  const CustomScreenHandling({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        child: child,
      ),
    );
  }
}
