import 'package:flutter/material.dart';
import 'package:vibetag/screens/groups/group.dart';

import '../../../utils/constant.dart';

Widget postFeeling({
  dynamic onTap,
  required double width,
  required String feeling,
  required String start,
  bool isGroup = false,
}) {
  return feeling != ''
      ? Row(
          children: [
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                  color: grayMed, borderRadius: borderRadius(width)),
            ),
            isGroup ? gap(w: 2) : gap(),
            isGroup
                ? Icon(
                    Icons.arrow_forward,
                    size: 16,
                  )
                : gap(),
            gap(
              w: 5,
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                width: width * 0.25,
                child: Text(
                  '${start} ${feeling}',
                  style: TextStyle(
                      color: isGroup ? blackPrimary : grayMed,
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            )
          ],
        )
      : Container();
}
