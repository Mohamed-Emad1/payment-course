import 'package:flutter/material.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/card_info_widget.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/paid_widget.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/payment_info.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/total_price.dart';
import 'package:payment_learn/core/utils/styles.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: const Color(0xffEDEDED),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 20, right: 20),
        child: Column(
          children: [
            const Text(
              "Thany You",
              style: Styles.text25,
              textAlign: TextAlign.center,
            ),
            const Text(
              "Your transaction was successful",
              style: Styles.text18,
            ),
            const SizedBox(
              height: 42,
            ),
            const PaymentInfo(
              title: "Date",
              value: "1/20/2024",
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentInfo(
              title: "Time",
              value: "11:20 AM",
            ),
            const SizedBox(
              height: 22,
            ),
            const PaymentInfo(title: "To", value: "Ahmed"),
            const Divider(
              height: 60,
              color: Colors.grey,
              thickness: 2,
            ),
            const OrderTotalPrice(value: r"50.97"),
            const SizedBox(
              height: 30,
            ),
            const CardInfoWidget(),
            const Spacer(),
            const PaidWidget(),
            SizedBox(
              height: ((MediaQuery.of(context).size.height * 0.2) / 2) - 29,
            )
          ],
        ),
      ),
    );
  }
}
