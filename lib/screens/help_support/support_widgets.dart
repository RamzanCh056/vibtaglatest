import 'package:flutter/material.dart';
import 'package:vibetag/utils/constant.dart';

Widget SupportBlock(
    {required double height, required IconData icon, required String title}) {
  return Container(
    width: double.maxFinite,
    height: height * 0.1,
    margin: spacing(
      horizontal: 10,
      vertical: 5,
    ),
    decoration: BoxDecoration(
      color: white,
      borderRadius: borderRadius(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconMax,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSm,
          ),
        )
      ],
    ),
  );
}
