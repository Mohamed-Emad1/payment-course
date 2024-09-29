import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_learn/Feature/data/models/paymet_intent/payment_intetnt_input_model.dart';
import 'package:payment_learn/Feature/presentation/manger/payment/payment_cubit.dart';
import 'package:payment_learn/Feature/presentation/views/thank_you_view.dart';
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
            PaymentIntetntInputModel paymentIntentInputModel =
                PaymentIntetntInputModel(
                    amount: '100',
                    currency: 'USD',
                    customerId: "cus_Qw9ob0Mn3byx8R");
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }
}
