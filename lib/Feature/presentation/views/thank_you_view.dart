import 'package:flutter/material.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/thank_you_view_body.dart';

import '../../../core/utils/widgets/build_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      backgroundColor: Colors.white,
      body: Transform.translate(
        offset: const Offset(0, -20),
        child: const ThankYouViewBody(),
      ),
    );
  }
}
