import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

double deviceWidth({required BuildContext context}) {
  return MediaQuery.of(context).size.width;
}

//Colors
Color backgroundColor = HexColor('#F0F0F0');
Color primaryGray = HexColor('#818181');
Color darkGray = HexColor('#B4B4B4');
Color medGray = HexColor('#E6E6E6');
Color lightGray = HexColor('#EFEFEF');
Color whiteGray = HexColor('#F7F7F7');
Color white = HexColor('#FFFFFF');
Color orange = HexColor('#FF9200');
Color accent = HexColor('#000000');
Color blue = HexColor('#2196F3');
Color lightblue = HexColor('#7D8CAC');
Color green = HexColor('#39C46E');
Color red = HexColor('#F05555');
Color lightBg = Color.fromARGB(51, 0, 0, 0);

//New Desgin
Color lightGrayNew = HexColor('#C8D1E5');
Color lightGrayNew2 = HexColor('#F1F4FB');
Color darkGrayNew = HexColor('#434950');

//Size
double textXXl = 32.0;
double textXl = 28.0;
double textLg = 24.0;
double textMed = 22.0;
double textSm = 18.0;
double textXSm = 14.0;

//Icon Size
double iconMax = 32.0;
double iconMed = 28.0;
double iconMin = 26.0;

String API_Url = 'https://vibetag.com/app_api.php';

double deviceHeight({required BuildContext context}) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top;
}

EdgeInsets spacing({
  double horizontal = 0,
  double vertical = 0,
}) {
  return EdgeInsets.symmetric(
    horizontal: horizontal,
    vertical: vertical,
  );
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
