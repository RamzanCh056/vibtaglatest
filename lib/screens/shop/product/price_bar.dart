import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constant.dart';

Widget rateItems({
  required BuildContext context,
  required String title,
  required String price,
  String color = '#DCDCDC',
  String textColor = '#000000',
}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Container(
    margin: spacing(
      horizontal: 0,
      vertical: 5,
    ),
    decoration: BoxDecoration(
      color: HexColor('${color}'),
      borderRadius: BorderRadius.circular(
        width * 0.02,
      ),
    ),
    padding: spacing(
      horizontal: width * 0.04,
      vertical: height * 0.01,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${title}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: HexColor('${textColor}'),
          ),
        ),
        Text(
          '\$${price}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: HexColor('${textColor}'),
          ),
        ),
      ],
    ),
  );
}
