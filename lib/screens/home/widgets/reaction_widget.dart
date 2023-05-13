import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

Widget reactionIconsWidget({required double left, required int i}) {
  return Positioned(
    left: left,
    child: Container(
      width: 20,
      height: 20,
      child: Image.asset(
        reactions[i],
      ),
    ),
  );
}
