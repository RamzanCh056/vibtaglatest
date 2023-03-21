
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
Widget BarItems({required String icon, required String text}) {
  return Container(
    margin: spacing(horizontal: 7, vertical: 5),
    padding: spacing(horizontal: 15, vertical: 18),
    decoration: BoxDecoration(
      color: grayLight,
      borderRadius: borderRadius(7),
    ),
    child: Row(
      children: [
        Container(
          width: 20,
          height: 20,
          child: Image.asset(
            icon,
            color: grayMed,
            fit: BoxFit.cover,
          ),
        ),
        gap(w: 7),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
