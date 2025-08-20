import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_review_section_row.dart';

class CustomColumn2ReviewInfo extends StatelessWidget {
  const CustomColumn2ReviewInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const CustomReviewSectionRow(title: '06 VIP Tickets', subtitle: '25',isNumbers: true,),
          SizedBox(height: AppDimensions.h12),
          const CustomReviewSectionRow(title: 'Fees', subtitle: '15', isNumbers: true,),
          SizedBox(height: AppDimensions.h12),
          const CustomReviewSectionRow(title: 'Total', subtitle: '325', isNumbers: true,),
        ]);
  }
}