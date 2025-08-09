import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.otherController, required this.onPressed,
  });

  final TextEditingController otherController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r55,vertical: AppDimensions.r10),
        side: const BorderSide(color: AppColor.kPrimaryPink,width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r20),
        ),
        backgroundColor: AppColor.kWhite,
        elevation: 3,
      ),
      child: Text(
          LocaleKeys.cancelBooking.tr(),
          style: Styling.homeTextButton
      ),
    );
  }
}