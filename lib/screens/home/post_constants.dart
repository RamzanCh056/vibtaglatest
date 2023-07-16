import 'package:flutter/material.dart';
import 'package:vibetag/utils/constant.dart';

Widget profileName(name) {
  return Text(
    setName(name),
    style: TextStyle(
        color: blackPrimary,
        overflow: TextOverflow.ellipsis,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: 'Manrope'),
  );
}

Widget postTime(time) {
  return Text(
    setName(time),
    style: TextStyle(
      color: lightblue,
      overflow: TextOverflow.ellipsis,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: 'Manrope',
    ),
  );
}
