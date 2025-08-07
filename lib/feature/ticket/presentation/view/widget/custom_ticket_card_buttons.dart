import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/ticket_card_button.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomTicketCardButtons extends StatelessWidget {
  const CustomTicketCardButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Cancel Button
        Expanded(
          child: TicketCardButton(
            isPrimary: false,
            text: LocaleKeys.cancel.tr(), onPressed: () {},
          ),
        ),
        SizedBox(width: AppDimensions.w12),
        Expanded(
          child: TicketCardButton(text: LocaleKeys.e_ticket.tr(), onPressed: () { },),
        ),
      ],
    );
  }
}

