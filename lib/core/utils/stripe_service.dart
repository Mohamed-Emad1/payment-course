import 'package:payment_learn/Feature/data/models/paymet_intent/payment_intent/payment_intent.dart';
import 'package:payment_learn/Feature/data/models/paymet_intent/payment_intetnt_input_model.dart';
import 'package:payment_learn/constants.dart';
import 'package:payment_learn/core/utils/api_keys.dart';
import 'package:payment_learn/core/utils/api_service.dart';

class StripeService {
  final ApiService apiService;
  StripeService({required this.apiService});

  Future<PaymentIntent> createPayemtnIntent(PaymentIntetntInputModel paymentIntentModel) async {
    var response = await apiService.post(
        url: url, body: paymentIntentModel.toJson(), token: ApiKeys.secretKey);
    var paymentInetentModel = PaymentIntent.fromJson(response.data);
    return  paymentInetentModel;
  }
}
