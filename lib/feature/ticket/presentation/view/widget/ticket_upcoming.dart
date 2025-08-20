import 'package:flutter/material.dart';
import 'package:tala_app/core/model/ticket_card_model.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/ticket_card.dart';

class TicketUpcoming extends StatelessWidget {
  const TicketUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.r30,
                vertical: AppDimensions.r10,
              ),
              child: TicketCard(
                ticketCardModel: TicketCardModel(
                  imageUrl: AppImage.kConcert,
                  title: 'Acoustic Serenade Showcase',
                  location: 'New York, USA',
                  price: 30,
                ),
              ),
            ),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
