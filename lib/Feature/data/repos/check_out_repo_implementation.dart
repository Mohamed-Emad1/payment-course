import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:payment_learn/Feature/data/repos/check_out.dart';
import 'package:payment_learn/core/utils/api_service.dart';
import 'package:payment_learn/core/utils/errors/failure.dart';
import 'package:payment_learn/core/utils/stripe_service.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  // final ApiService apiService = ApiService();
  final StripeService stripeService = StripeService(apiService: ApiService());
  @override
  Future<Either<Faulire, void>> makePayment(
      {required paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInput: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      log(e.toString());
      return left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
