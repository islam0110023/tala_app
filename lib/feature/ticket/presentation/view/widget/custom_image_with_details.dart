import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/home/presentation/view/widget/event_details.dart';
import 'package:tala_app/feature/home/presentation/view/widget/price_tag.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_ticket_image.dart';

class CustomImageWithDetails extends StatelessWidget {
  const CustomImageWithDetails({
    super.key,
    required this.imageUrl, required this.price,
  });

  final String imageUrl;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Stack(
          clipBehavior: Clip.none,
          children: [
            CustomTicketImage(imageUrl: imageUrl),
            Positioned(
              bottom: AppDimensions.h7,
              right: -AppDimensions.r30,
              child: PriceTag(price: price, isTicketPage: true),
            ),
          ],
        ),
        SizedBox(width: AppDimensions.w8),
        // Text info
        const Expanded(
          child: EventDetails(
            eventTitle: 'Acoustic Serenade Showcase',
            location: 'New York, USA',
            isTicketPage: true,
          ),
        ),
      ],
    );
  }
}