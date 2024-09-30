import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_learn/Feature/data/models/paymet_intent/payment_intent/payment_intent.dart';
import 'package:payment_learn/Feature/data/models/paymet_intent/payment_intetnt_input_model.dart';
import 'package:payment_learn/constants.dart';
import 'package:payment_learn/core/utils/api_keys.dart';
import 'package:payment_learn/core/utils/api_service.dart';

import '../../Feature/data/models/ephermal_key/ephermal_key.dart';

class StripeService {
  final ApiService apiService;
  StripeService({required this.apiService});

  Future<PaymentIntentModel> createPayemtnIntent(
      PaymentIntetntInputModel paymentIntentModel) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        url: url,
        body: paymentIntentModel.toJson(),
        token: ApiKeys.secretKey);
    var paymentInetentModel = PaymentIntentModel.fromJson(response.data);
    return paymentInetentModel;
  }

  Future initPaymentSheet(
      {required String clientSecret,
      required String ephermalKey,
      required String customerID}) async {
    await Stripe.instance.initPaymentSheet(
      //create model for the prameters
      paymentSheetParameters: SetupPaymentSheetParameters(
          customerId: customerID,
          customerEphemeralKeySecret: ephermalKey,
          allowsDelayedPaymentMethods: true,
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "Mohamed"),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphermalKey> createEmphermalKey(String customerID) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        url: urlEmphermalKey,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2024-06-20',
        },
        body: {'customer': customerID},
        token: ApiKeys.secretKey);
    var ephermalKey = EphermalKey.fromJson(response.data);
    return ephermalKey;
  }

  Future makePayment(
      {required PaymentIntetntInputModel paymentIntentInput}) async {
    PaymentIntentModel paymentIntentModel =
        await createPayemtnIntent(paymentIntentInput);
    EphermalKey ephermalKeyModel =
        await createEmphermalKey(paymentIntentInput.customerId);
    await initPaymentSheet(
      ephermalKey: ephermalKeyModel.secret!,
      customerID: paymentIntentInput.customerId,
      clientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }
}
