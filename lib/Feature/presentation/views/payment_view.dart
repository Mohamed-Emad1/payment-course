import 'package:flutter/material.dart';
import 'package:payment_learn/core/utils/widgets/build_app_bar.dart';

import 'widgets/payment_details_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar(
          title: "Payment Details",
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        body: const PaymentDetailsViewBody());
  }
}
