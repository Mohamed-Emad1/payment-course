import 'package:flutter/widgets.dart';

import '../../../../core/utils/styles.dart';

class OrderTotalPrice extends StatelessWidget {
  const OrderTotalPrice({super.key, required this.value});

  final String tile = "Total";
  final String value;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          tile,
          style: Styles.text24,
        ),
        const Spacer(),
        Text(
           r'$' + value,
          style: Styles.text24,
        ),
      ],
    );
  }
}