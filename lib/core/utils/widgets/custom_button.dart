import 'package:flutter/material.dart';
import 'package:payment_learn/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  final bool isLoading;
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
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: Styles.text22,
              ),
      ),
    );
  }
}
