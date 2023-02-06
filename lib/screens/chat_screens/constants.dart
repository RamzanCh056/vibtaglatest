import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


double screenHeightSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / 650.0;
}

double screenWidthSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.width / 400.0;
}

//COLORS
Color orangeColor = HexColor('#FF9200');
Color greyColor = HexColor('#C8D1E5');
Color txtColor = HexColor('#7D8CAC');
Color lightGrey = HexColor('#F8F9FB');
Color fontColor = HexColor('#485470');
Color cyanGreenColor = HexColor('#7C9780');
Color highShadeOrangeColor = HexColor('#FFC107');
Color lightGreenColor = HexColor('#85FF72');
