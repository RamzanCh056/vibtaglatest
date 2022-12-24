import 'package:flutter/material.dart';

import '../../utils/constant.dart';

Widget ShareOptions({
  required double width,
  required double height,
  required String iconsPath,
  required String title,
}) {
  return Container(
    margin: spacing(
      horizontal: 15,
      vertical: 7,
    ),
    padding: spacing(
      horizontal: 10,
      vertical: 20,
    ),
    decoration: BoxDecoration(
      color: grayLight,
      borderRadius: borderRadius(9),
    ),
    child: Row(
      children: [
        Container(
          width: width * 0.07,
          alignment: Alignment.centerLeft,
          child: Image.asset(
            iconsPath,
            color: grayMed,
            fit: BoxFit.cover,
          ),
        ),
        gap(w: 10),
        Text(title),
      ],
    ),
  );
}
