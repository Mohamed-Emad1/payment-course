import 'package:flutter/widgets.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autovalidateMode});
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CreditCardWidget(
        //     cardNumber: cardNumber,
        //     expiryDate: expiryDate,
        //     cardHolderName: cardHolderName,
        //     cvvCode: cvvCode,
        //     showBackView: showBackView,
        //     isHolderNameVisible: true,
        //     onCreditCardWidgetChange: (value) {}),
        // CreditCardForm(
        //     cardNumber: cardNumber,
        //     expiryDate: expiryDate,
        //     cardHolderName: cardHolderName,
        //     cvvCode: cvvCode,
        //     onCreditCardModelChange: (creditCardMoel) {
        //       cardHolderName = creditCardMoel.cardHolderName;
        //       cardNumber = creditCardMoel.cardNumber;
        //       expiryDate = creditCardMoel.expiryDate;
        //       showBackView = creditCardMoel.isCvvFocused;
        //       setState(() {});
        //     },
        //     formKey: widget.formKey,
        //     autovalidateMode: widget.autovalidateMode,
        //     )
      ],
    );
  }
}
