import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';

CategoryItem({required String title}) {
  return Container(
    padding: spacing(
      horizontal: 15,
      vertical: 7,
    ),
    margin: spacing(
      horizontal: 5,
      vertical: 5,
    ),
    decoration: BoxDecoration(
      color: HexColor('#232323'),
      borderRadius: borderRadius(15),
      boxShadow: lightShadow,
    ),
    child: Text(
      title,
      style: TextStyle(
        color: white,
        fontSize: 8,
      ),
    ),
  );
}
