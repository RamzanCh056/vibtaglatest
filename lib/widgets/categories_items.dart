import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/constant.dart';

Widget CategoriesProduct({
  required String img,
  required String title,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      double width = deviceWidth(context: context);
      double height = deviceHeight(context: context);
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.network(
                img,
                width: width * 0.1,
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      );
    },
  );
}
