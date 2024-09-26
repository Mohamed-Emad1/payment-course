import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_learn/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});

  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 73,
      child: TextButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Color(0xff34A853),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: Styles.text22,
        ),
      ),
    );
  }
}
