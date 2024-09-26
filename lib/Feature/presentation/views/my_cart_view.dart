import 'package:flutter/material.dart';
import 'package:payment_learn/Feature/presentation/views/widgets/my_cart_view_body.dart';

import '../../../core/utils/widgets/build_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: "My Cart"),
      body: const MyCartViewBody(),
    );
  }
}
