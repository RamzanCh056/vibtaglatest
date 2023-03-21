import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constant.dart';

Widget HashTrendWidget({
  required String hash,
}) {
  return FittedBox(
    child: Container(
      margin: spacing(
        horizontal: 5,
        vertical: 7,
      ),
      padding: spacing(
        horizontal: 5,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: spacing(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: HexColor('#FFF7ED'),
              borderRadius: borderRadius(5),
            ),
            child: Icon(
              Icons.trending_up,
              color: blackPrimary,
              size: 16,
            ),
          ),
          gap(w: 5),
          Container(
            height: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hash,
                  style: TextStyle(
                    color: orangePrimary,
                    fontSize: 10,
                  ),
                ),
                Container(
                  child: Text(
                    '44 posts',
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 8,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
