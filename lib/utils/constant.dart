import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

double deviceWidth({required BuildContext context}) {
  return MediaQuery.of(context).size.width;
}

Color backgroundColor = HexColor('#F0F0F0');

double deviceHeight({required BuildContext context}) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top;
}

EdgeInsets spacing({
  required double horizontal,
  required double vertical,
}) {
  return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

pushRoute({
  required BuildContext context,
  required Widget screen,
}) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

pushReplacement({
  required BuildContext context,
  required Widget screen,
}) {
  return Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

borderRadius(double radius) {
  return BorderRadius.circular(radius);
}
