import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class TicketCardButton extends StatelessWidget {
  const TicketCardButton({
    super.key,
    this.isPrimary = true, required this.text,
    required this.onPressed,
  });
  final bool isPrimary;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: (isPrimary)?AppColor.kPrimaryPink:AppColor.kWhite,
        foregroundColor: (isPrimary)?AppColor.kWhite:AppColor.kColorOnboarding,
        side: (!isPrimary)? const BorderSide(color: AppColor.kTicketSide):null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.r10),
        ),
        elevation: 3,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}