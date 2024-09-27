import 'package:dartz/dartz.dart';
import 'package:payment_learn/core/utils/errors/failure.dart';

abstract class CheckOutRepo {
  Future<Either<Faulire, void>> makePayment(
    {required paymentIntentInputModel}
  );
}
