import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';

class ProfileProgressBar extends StatelessWidget {
  const ProfileProgressBar({
    super.key, required this.done,
  });
  final double done;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomArrowBack(onTap: () {Navigator.pop(context);}),
        SizedBox(width: AppDimensions.w69),
        Container(
          height: AppDimensions.h2,
          width: AppDimensions.w168,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ AppColor.kPrimaryPink,AppColor.kWhite],
              stops: [done, 1-done],
            ),
          ),
        ),
        SizedBox(width: AppDimensions.w10),
        Text(
          '1/4',
          style: Styling.textStyleB20.copyWith(fontSize: 10.sp),
        ),
      ],
    );
  }
}