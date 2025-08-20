import 'package:flutter/material.dart';
import 'package:tala_app/core/model/ticket_card_model.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_image_with_details.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_ticket_card_buttons.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    this.isCancelled = false, required this.ticketCardModel,
  });
  final TicketCardModel ticketCardModel;
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.symmetric(
      //   horizontal: AppDimensions.r30,
      //   vertical: AppDimensions.r10,
      // ),
      padding: EdgeInsets.all(AppDimensions.r8),
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        border: Border.all(color: AppColor.kTicketBorder),
        borderRadius: BorderRadius.circular(AppDimensions.r16),
      ),
      child: Column(
        children: [
          CustomImageWithDetails(imageUrl:  ticketCardModel.imageUrl, price:ticketCardModel.price,),
          SizedBox(height: AppDimensions.w8),
          // Bottom buttons
          ?(isCancelled)?null:const CustomTicketCardButtons(),
        ],
      ),
    );
  }
}