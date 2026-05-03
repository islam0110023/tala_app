import 'package:flutter/material.dart';
import 'package:tala_app/feature/event_details/presentation/view/widget/event_details_screen_body.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EventDetailsScreenBody());
  }
}
