import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.tile, required this.value});

  final String tile;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          tile,
          style: Styles.text18,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.text18,
        ),
      ],
    );
  }
}
