import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_review_section_row.dart';

class CustomColumn1ReviewInfo extends StatelessWidget {
  const CustomColumn1ReviewInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const CustomReviewSectionRow(title: 'Full name ', subtitle: 'Esther Howard',),
          SizedBox(height: AppDimensions.h12),
          const CustomReviewSectionRow(title: 'Phone Number', subtitle: '+963 995874523',),
          SizedBox(height: AppDimensions.h12),
          const CustomReviewSectionRow(title: 'Email', subtitle: 'example@gmail.com',),
        ]);
  }
}