import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.dismissibleBackground,
        borderRadius: BorderRadius.circular(AppDimensions.r15),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r20),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.delete_outline,
            color: Colors.white,
            size: AppDimensions.r25,
          ),
          SizedBox(width: AppDimensions.w10),
          Text('Remove Notification', style: Styling.textStyle16700),
        ],
      ),
    );
  }
}
