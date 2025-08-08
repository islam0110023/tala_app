import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';

class CustomTicketHeader extends StatelessWidget {
  const CustomTicketHeader({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomArrowBack(onTap: () => context.pop()),
        Text(title, style: Styling.textStyle18800Purple),
        SizedBox(width: AppDimensions.r30)
      ],
    );
  }
}