import 'package:flutter/material.dart';

class CustomDachedLine extends StatelessWidget {
  const CustomDachedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          20,
          (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    color: const Color(0xffB8B8B8),
                    width: 2,
                    height: 2,
                  ),
                ),
              )),
    );
  }
}
