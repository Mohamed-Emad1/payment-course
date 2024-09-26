import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_learn/core/utils/styles.dart';

AppBar buildAppbar({String? title, void Function()? onTap}) {
  return AppBar(
    leading: GestureDetector(
      onTap: onTap,
      child: Center(
        child: SvgPicture.asset("assets/images/arrow.svg"),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Center(
      child: Text(
        title?? "",
        style: Styles.text25,
      ),
    ),
  );
}
