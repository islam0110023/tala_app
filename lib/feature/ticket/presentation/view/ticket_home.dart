import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_ticket_header.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/ticket_cancelled.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/ticket_review.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/ticket_upcoming.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class TicketHome extends StatelessWidget {
  const TicketHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.r25,
                  vertical: AppDimensions.r8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTicketHeader(title: LocaleKeys.tickets.tr(),),
                    SizedBox(height: AppDimensions.h42),
                    TabBar(
                      tabs: [
                        Tab(text: LocaleKeys.upcoming.tr()),
                        Tab(text: LocaleKeys.review.tr()),
                        Tab(text: LocaleKeys.cancelled.tr()),
                      ],
                      indicatorColor: AppColor.kPrimaryPink,
                      labelColor: AppColor.kColorOnboarding,
                      unselectedLabelColor: AppColor.kPrimaryPink,
                      labelStyle: Styling.textStyle16800Purple,
                    ),
                  ],
                ),
              ),
            ),

            const Expanded(
              child: TabBarView(
                children: [
                  TicketUpcoming(),
                  TicketReview(),
                  TicketCancelled(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}