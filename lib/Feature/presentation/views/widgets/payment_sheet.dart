import 'package:flutter/material.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/payment_method_list_view.dart';
class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodListView(),
          SizedBox(
            height: 16,
          ),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}


