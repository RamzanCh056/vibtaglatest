import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../utils/constant.dart';

Widget ProductFeature({required String text, required String title}) {
  return Container(
    padding: spacing(
      horizontal: 15,
    ),
    margin: spacing(
      horizontal: 10,
    ),
    decoration: BoxDecoration(
      borderRadius: borderRadius(5),
      color: white,
      border: Border.all(
        width: 1,
        color: grayMed,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: grayMed,
            fontSize: 12,
          ),
        ),
        gap(h: 2.5),
        Text(
          text,
          style: TextStyle(
            color: blackPrimary,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
