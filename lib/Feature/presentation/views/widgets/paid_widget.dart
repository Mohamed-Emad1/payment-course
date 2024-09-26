import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/styles.dart';

class PaidWidget extends StatelessWidget {
  const PaidWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          FontAwesomeIcons.barcode,
          size: 71,
        ),
        Container(
          width: 113,
          height: 58,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: Color(0xff34A853),
                width: 1.5,
              ),
            ),
          ),
          child: Center(
            child: Text(
              "PAID",
              textAlign: TextAlign.center,
              style: Styles.text24.copyWith(
                color: const Color(0xff34A853),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
