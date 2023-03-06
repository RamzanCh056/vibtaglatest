import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

audienceOptions({
  required double width,
  required String title,
  required String subtitle,
  required String icon,
  required String endIcon,
  bool isTap = false,
}) {
  return Container(
    padding: spacing(
      horizontal: 10,
      vertical: 10,
    ),
    margin: spacing(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
      color: grayLight,
      borderRadius: borderRadius(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: width * 0.12,
              decoration: BoxDecoration(
                borderRadius: borderRadius(width),
                color: white,
              ),
              padding: spacing(
                horizontal: 15,
                vertical: 15,
              ),
              child: Image.asset(icon),
            ),
            gap(w: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blackPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: grayMed,
                  ),
                ),
              ],
            ),
          ],
        ),
        isTap
            ? Container(
                width: 20,
                height: 20,
                child: Stack(
                  children: [
                    Image.asset(
                      endIcon,
                    ),
                    Positioned(
                      child: Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: borderRadius(width),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                width: 20,
                child: Image.asset(
                  endIcon,
                ),
              )
      ],
    ),
  );
}
