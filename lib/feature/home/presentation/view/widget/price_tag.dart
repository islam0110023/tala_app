import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({super.key, required this.price, this.isTicketPage=false});
  final double price;
  final bool isTicketPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.r12,
        vertical: AppDimensions.r8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.r10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Text(

        '${LocaleKeys.person.tr()}\n\$${price.toStringAsFixed(2)}',
        style: (isTicketPage)? Styling.textStyle8900PrimaryPink : Styling.textStyle12900PrimaryPink
      ),
    );
  }
}