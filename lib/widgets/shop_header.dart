import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/shop.dart';
import '../utils/constant.dart';

Widget ShopHeader({required VoidCallback onTap}) {
  return StatefulBuilder(
    builder: (context, setState) {
      double width = deviceWidth(context: context);
      double height = deviceHeight(context: context);
      return Container(
        width: width,
        height: height * 0.06,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
            Container(
              width: width * 0.7,
              margin: spacing(
                horizontal: 0,
                vertical: 7,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius(
                  width * 0.1,
                ),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  suffix: Icon(
                    Icons.search,
                    size: 16,
                    color: Colors.orange,
                  ),
                  contentPadding: EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                pushReplacement(
                  context: context,
                  screen: const Shop(),
                );
              },
              child: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    },
  );
}
