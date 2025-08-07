import 'package:flutter/material.dart';
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
            (context, index) => const TicketCard(
              imageUrl: AppImage.kConcert,
              title: 'Acoustic Serenade Showcase',
              location: 'New York, USA',
              price: 25,
            ),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}





