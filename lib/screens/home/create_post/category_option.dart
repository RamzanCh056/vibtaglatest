import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

categoryOptions({
  required String title,
  required List<String> tags,
}) {
  List<Widget> tagList = [];

  for (var i = 0; i < tags.length; i++) {
    tagList.add(
      Container(
        padding: spacing(
          horizontal: 15,
          vertical: 7,
        ),
        margin: spacing(
          horizontal: 5,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: grayLight,
          borderRadius: borderRadius(400),
        ),
        child: Text(
          tags[i],
          style: TextStyle(
            fontSize: 12,
            color: grayMed,
          ),
        ),
      ),
    );
  }

  return Container(
    margin: spacing(vertical: 5),
    child: Column(
      children: [
        Container(
          margin: spacing(
            horizontal: 15,
          ),
          alignment: Alignment.centerLeft,
          child: Text(title),
        ),
        gap(h: 7),
        Container(
          margin: spacing(
            horizontal: 15,
          ),
          alignment: Alignment.centerLeft,
          child: Wrap(
            children: tagList,
          ),
        ),
      ],
    ),
  );
}
