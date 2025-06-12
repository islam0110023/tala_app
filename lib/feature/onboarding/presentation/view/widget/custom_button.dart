import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColor.kBlack25,
            blurRadius: 4,
            offset: Offset(5, 5),
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(AppDimensions.r30),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.kPrimaryPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r30),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.r15,
            horizontal: AppDimensions.r30,
          ),
        ),
        child: Text(
          'Start Your Unique Experience!',
          style: Styling.textStyleB20
        ),
      ),
    );
  }
}
