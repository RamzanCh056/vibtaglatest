import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

Widget HashTrendWidget({
  required String hash,
}) {
  return Container(
    margin: spacing(
      horizontal: 5,
      vertical: 7,
    ),
    padding: spacing(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FittedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.trending_up,
                color: orangePrimary,
                size: 16,
              ),
              gap(w: 5),
              Text(
                hash,
                style: TextStyle(
                  color: orangePrimary,
                  fontSize: 10,
                ),
              ),
            ],
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
  );
}
