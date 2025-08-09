import 'package:flutter/material.dart';
import 'package:tala_app/feature/payment/presentation/view/widget/payment_methods_body.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentMethodsBody(),
    );
  }
}
