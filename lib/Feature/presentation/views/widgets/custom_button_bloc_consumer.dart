import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_learn/Feature/data/models/amount_model/amount_model.dart';
import 'package:payment_learn/Feature/data/models/amount_model/details.dart';
import 'package:payment_learn/Feature/data/models/items_model/item.dart';
import 'package:payment_learn/Feature/data/models/items_model/items_model.dart';
import 'package:payment_learn/Feature/data/models/paymet_intent/payment_intetnt_input_model.dart';
import 'package:payment_learn/Feature/presentation/manger/payment/payment_cubit.dart';
import 'package:payment_learn/Feature/presentation/views/thank_you_view.dart';
import 'package:payment_learn/core/utils/api_keys.dart';
import 'package:payment_learn/core/utils/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ThankYouView(),
          ));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 5),
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntetntInputModel paymentIntentInputModel =
            //     PaymentIntetntInputModel(
            //         amount: '100',
            //         currency: 'USD',
            //         customerId: ApiKeys.cusmoterSecrete);
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);

            //
            var transactionsData = getTransactionData();
            executePayPalPayment(context, transactionsData);
          },
          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }

  Future<dynamic> executePayPalPayment(BuildContext context, ({AmountModel amount, ItemsModel items}) transactionsData) {
    return Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: ApiKeys.paypalPublic,
              secretKey: ApiKeys.payPaplSecrete,
              transactions: [
                {
                  "amount": transactionsData.amount.toJson(),
                  "description": "The payment transaction description.",
                  "item_list": transactionsData.items.toJson(),
                }
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pop(context);
              },
              onError: (error) {
                log("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                // print('cancelled:');
                Navigator.pop(context);
              },
            ),
          ));
  }

  ({AmountModel amount, ItemsModel items}) getTransactionData() {
    AmountModel amountModel = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(
        shipping: '0',
        subtotal: '100',
      ),
    );
    List<OrderItemModel> orderItemModel = [
      OrderItemModel(
        name: "Apple",
        quantity: 4,
        price: '10',
        currency: "USD",
      ),
      OrderItemModel(
        name: "Pineapple",
        quantity: 5,
        price: '12',
        currency: "USD",
      ),
    ];
    ItemsModel itemModel = ItemsModel(items: orderItemModel);
    return (amount : amountModel , items : itemModel);
  }
}
