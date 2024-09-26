import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_learn/core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 23),
      width: 305,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/images/master_card.svg"),
          const SizedBox(
            width: 23,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Credit Card ",
                style: Styles.text18,
              ),
              Text(
                "Mastercard **78",
                style: Styles.text18,
              ),
            ],
          )
        ],
      ),
    );
  }
}
