import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CheckAgreeTerms extends StatelessWidget {
  const CheckAgreeTerms({super.key, this.isChecked = false, this.onChanged});
  final bool isChecked;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          checkColor: AppColor.kWhite,
          activeColor: AppColor.kPrimaryPink,
          side: const BorderSide(width: 1, color: AppColor.kLightGray),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.r2),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        SizedBox(width: AppDimensions.h10),
        Text(LocaleKeys.agreeTerms.tr(), style: Styling.textStyleBlack12),
        SizedBox(width: AppDimensions.h10),
        InkWell(onTap: () {
          context.push(AppRoutes.termsConditionsScreen);
        },child: Text(LocaleKeys.termsAndConditions.tr(), style: Styling.textStyleB12)),
      ],
    );
  }
}
