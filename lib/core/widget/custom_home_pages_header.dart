import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomHomePagesHeader extends StatelessWidget {
  const CustomHomePagesHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Styling.textStyle18700Purple);
  }
}
