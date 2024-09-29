class PaymentIntetntInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntetntInputModel(
      {required this.customerId, required this.amount, required this.currency});

  toJson() {
    return {'amount': amount, 'currency': currency, 'customer': customerId};
  }
}
