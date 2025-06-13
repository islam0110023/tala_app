import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CheckAgreeTerms extends StatelessWidget {
   const CheckAgreeTerms({
    super.key,
  });
  final bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? newValue) {
            // setState(() {
            //   isChecked = newValue ?? false;
            // });
          },
          checkColor: AppColor.kWhite,
          activeColor: Colors.transparent,
          side: const BorderSide(
            width: 1,
            color: AppColor.kLightGray,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r2),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        SizedBox(width: AppDimensions.h10,),
        Text(
            'Agree with',
            style: Styling.textStyleBlack12
        ),
        SizedBox(width: AppDimensions.h10,),
        Text(
            'Terms & Condition',
            style: Styling.textStyleB12
        ),
      ],
    );
  }
}
