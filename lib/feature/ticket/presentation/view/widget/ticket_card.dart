import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_image_with_details.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_ticket_card_buttons.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    this.isCancelled = false,
  });
  final String imageUrl;
  final String title;
  final String location;
  final double price;
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.r30,
        vertical: AppDimensions.r10,
      ),
      padding: EdgeInsets.all(AppDimensions.r8),
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        border: Border.all(color: AppColor.kTicketBorder),
        borderRadius: BorderRadius.circular(AppDimensions.r16),
      ),
      child: Column(
        children: [
          CustomImageWithDetails(imageUrl: imageUrl, price: price,),
          SizedBox(height: AppDimensions.w8),
          // Bottom buttons
          ?(isCancelled)?null:const CustomTicketCardButtons(),
        ],
      ),
    );
  }
}