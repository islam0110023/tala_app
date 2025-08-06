import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.eventTitle, required this.location});
  final String eventTitle;
  final String location;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          eventTitle,
          style: Styling.textStyleEventTitle
        ),
        SizedBox(height: AppDimensions.h4),
        Text(
          '📍 $location',
          style: Styling.textStyleEventTitle
        ),
      ],
    );
  }
}