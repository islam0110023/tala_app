import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomTicketsTitle extends StatelessWidget {
  const CustomTicketsTitle({
    super.key, required this.title,
  });
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
          title,
          style: Styling.textStyle18800Purple
      ),
    );
  }
}