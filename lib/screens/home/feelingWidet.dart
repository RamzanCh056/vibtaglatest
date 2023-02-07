import 'package:flutter/material.dart';

import '../../utils/constant.dart';

Widget postFeeling(
    {required double width, required String feeling, required String start}) {
  return feeling != ''
      ? Row(
          children: [
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                  color: grayMed, borderRadius: borderRadius(width)),
            ),
            gap(
              w: 5,
            ),
            Container(
              width: width * 0.4,
              child: Text(
                '${start} ${feeling}',
                style: TextStyle(
                    color: grayMed,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis),
              ),
            )
          ],
        )
      : Container();
}
