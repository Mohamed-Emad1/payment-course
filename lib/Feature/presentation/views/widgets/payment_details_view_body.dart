import 'package:flutter/material.dart';
import 'package:payment_learn/Feature/presentation/views/thank_you_view.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/custom_credit_card.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/payment_method_list_view.dart';
import 'package:payment_learn/core/utils/widgets/custom_button.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: PaymentMethodListView(),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              autovalidateMode: autovalidateMode,
              formKey: formKey,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // Navigator.pushNamed(context, "payment_success_view");
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ThankYouView();
                      }));
                    }
                  },
                  text: "Pay",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
