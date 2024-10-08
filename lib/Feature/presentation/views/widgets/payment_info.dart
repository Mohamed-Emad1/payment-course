import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.text18,
        ),
        Text(
          value,
          style: Styles.textBold18,
        )
      ],
    );
  }
}
