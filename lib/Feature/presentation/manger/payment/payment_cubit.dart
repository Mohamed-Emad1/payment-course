import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_learn/Feature/data/repos/check_out.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;

  Future makePayment({required paymentIntentInputModel}) async {
    emit(PaymentLoading());

    var date = await checkOutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    date.fold(
      (failure) {
        emit(
          PaymentFailure(failure.message),
        );
      },
      (success) {
        emit(
          PaymentSuccess(),
        );
      },
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
