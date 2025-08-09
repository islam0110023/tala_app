import 'package:flutter/material.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/cancel_ticket_body.dart';

class CancelTicketScreen extends StatelessWidget {
  const CancelTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CancelTicketBody(),
    );
  }
}
