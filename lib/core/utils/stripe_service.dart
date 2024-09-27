import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_learn/Feature/data/models/paymet_intent/payment_intent/payment_intent.dart';
import 'package:payment_learn/Feature/data/models/paymet_intent/payment_intetnt_input_model.dart';
import 'package:payment_learn/constants.dart';
import 'package:payment_learn/core/utils/api_keys.dart';
import 'package:payment_learn/core/utils/api_service.dart';

class StripeService {
  final ApiService apiService;
  StripeService({required this.apiService});

  Future<PaymentIntentModel> createPayemtnIntent(
      PaymentIntetntInputModel paymentIntentModel) async {
    var response = await apiService.post(
        url: url, body: paymentIntentModel.toJson(), token: ApiKeys.secretKey);
    var paymentInetentModel = PaymentIntentModel.fromJson(response.data);
    return paymentInetentModel;
  }

  Future initPaymentSheet({required String clientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: clientSecret,
          merchantDisplayName: "Mohamed"),
    );
  }

  Future displayPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntetntInputModel paymentIntentInput}) async {
    PaymentIntentModel paymentIntentModel =
        await createPayemtnIntent(paymentIntentInput);
    await initPaymentSheet(clientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
