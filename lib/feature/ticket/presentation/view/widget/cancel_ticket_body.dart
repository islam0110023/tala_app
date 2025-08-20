import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/cancel_ticket_actions.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_ticket_header.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CancelTicketBody extends StatelessWidget {
  const CancelTicketBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTicketHeader(title: LocaleKeys.cancelBooking.tr()),
            SizedBox(height: AppDimensions.h48),
            Text(
              LocaleKeys.cancelSelectReason.tr(),
              textAlign: TextAlign.center,
              style: Styling.textStyle16600Purple,
            ),
            SizedBox(height: AppDimensions.h34),
            const CancelTicketActions(),
          ],
        ),
      ),
    );
  }
}
