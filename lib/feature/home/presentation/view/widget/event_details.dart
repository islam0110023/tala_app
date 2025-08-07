import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.eventTitle, required this.location, this.isTicketPage = false});
  final String eventTitle;
  final String location;
  final bool isTicketPage;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: (isTicketPage)?CrossAxisAlignment.start:CrossAxisAlignment.end,
      children: [
        Text(
          eventTitle,
          style: (isTicketPage)?Styling.textStyle10600Ticket:Styling.textStyleEventTitle
        ),
        SizedBox(height: AppDimensions.h4),
        Text(
          '📍 $location',
          style: (isTicketPage)?Styling.textStyle10600Ticket:Styling.textStyleEventTitle
        ),
      ],
    );
  }
}