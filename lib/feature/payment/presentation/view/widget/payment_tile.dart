import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.icon, required this.text});
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.kTextFieldColor,
      borderRadius: BorderRadius.circular(AppDimensions.r15),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.r15),
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.r15,
            vertical: AppDimensions.r20,
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: AppDimensions.w20),
              Text(
                text,
                style: Styling.textStyle13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
