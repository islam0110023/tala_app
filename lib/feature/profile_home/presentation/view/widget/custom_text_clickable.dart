import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomTextClickable extends StatelessWidget {
  const CustomTextClickable({super.key, required this.title, required this.onTap, required this.icon});
  final String title;
  final VoidCallback onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          SizedBox(height: AppDimensions.h20),
          Row(
            children: [
              icon,
              SizedBox(width: AppDimensions.w10),
              Text(
                title,
                style: Styling.textStyle18700Purple
              ),
            ],
          ),
          SizedBox(height: AppDimensions.h8),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColor.kDividerColor,
          ),
        ],
      ),
    );
  }
}
