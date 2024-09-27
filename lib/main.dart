import 'package:flutter/material.dart';

import 'Feature/presentation/views/my_cart_view.dart';

void main() {
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
