import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/model/ticket_card_model.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_column_1_review_info.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_column_2_review_info.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_info_review_card.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_review_info_bottom.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_ticket_header.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/ticket_card.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class ReviewTicketSummaryBody extends StatelessWidget {
  const ReviewTicketSummaryBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.r30),
        child: Column(
          children: [
            CustomTicketHeader(title: LocaleKeys.reviewTicketSummary.tr()),
            SizedBox(height: AppDimensions.h41),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.r10),
              child: TicketCard(
                ticketCardModel: TicketCardModel(
                  imageUrl: AppImage.kConcert,
                  title: 'Acoustic Serenade Showcase',
                  location: 'New York, USA',
                  price: 30,
                ),
                isCancelled: true,
              ),
            ),
            SizedBox(height: AppDimensions.h15),
            const CustomInfoReviewCard(widget: CustomColumn1ReviewInfo(),),
            SizedBox(height: AppDimensions.h15),
            const CustomInfoReviewCard(widget: CustomColumn2ReviewInfo(),),
            SizedBox(height: AppDimensions.h34),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.r10),
              child: const CustomReviewInfoBottom(),
            )


          ],
        ),
      ),
    );
  }
}






