import 'package:flutter/material.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/custom_check_circle.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/thany_you_card.dart';

import 'custom_dashed_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.2 + 20,
            child:const Padding(
              padding:EdgeInsets.symmetric(horizontal: 25),
              child: CustomDachedLine(),
            ),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CustomCheckCircle(),
          )
        ],
      ),
    );
  }
}



