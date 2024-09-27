class PaymentIntetntInputModel {
  final String amount;
  final String currency;

  PaymentIntetntInputModel({required this.amount, required this.currency});

  toJson() {
    return {
       'amount': amount,
      'currency': currency
    };
  }
}
