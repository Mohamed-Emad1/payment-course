import 'package:flutter/material.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/card_info_item.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/payment_sheet.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/total_price.dart';

import '../../../../core/utils/widgets/custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset("assets/images/basket.png")),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            tile: "Order Subtotal",
            value: "\$42.97",
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            tile: "Discount",
            value: "\$0",
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            tile: "Shipping",
            value: "\$8",
          ),
          const Divider(
            height: 34,
            thickness: 2,
            color: Color(0xffC7C7C7),
          ),
          const OrderTotalPrice(
            value: "50.97",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
              text: "Complete Payment",
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const PaymentView(),
                //   ),
                // );
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    context: context,
                    builder: (context) {
                      return const PaymentMethodsBottomSheet();
                    });
              }),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

