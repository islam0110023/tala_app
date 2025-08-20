import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/home/presentation/view/widget/event_details.dart';
import 'package:tala_app/feature/home/presentation/view/widget/price_tag.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r16, vertical: AppDimensions.r10)
          .copyWith(left: AppDimensions.r16 + AppDimensions.w40),
      child: Container(
        height: AppDimensions.h180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.r16),
          image: const DecorationImage(
            image: AssetImage(AppImage.kConcert),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Price Tag
            Positioned(
              top: AppDimensions.r24,
              left: -AppDimensions.r40,
              child: const PriceTag(price: 30,),
            ),

            // Title & Location
            Positioned(
              right: AppDimensions.r12,
              bottom: AppDimensions.r12,
              child: const EventDetails(eventTitle: 'Acoustic Serenade Showcase', location: ' New York, USA',),
            ),
          ],
        ),
      ),
    );
  }
}