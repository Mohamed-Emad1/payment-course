import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_learn/core/utils/api_keys.dart';

import 'Feature/presentation/views/my_cart_view.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publicKey;
  Stripe.merchantIdentifier = 'any string works';
  runApp(const Payment());
}

class Payment extends StatelessWidget {
  const Payment({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment Learn',
      home: MyCartView(),
    );
  }
}
