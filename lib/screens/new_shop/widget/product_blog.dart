// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vibetag/utils/constant.dart';

class ProductBlog extends StatelessWidget {
  String image;
  String text;
  ProductBlog({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius(7),
      child: Container(
        margin: spacing(vertical: 15, horizontal: 5),
        padding: spaceOnly(bottom: 15),
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius(7),
          boxShadow: lightShadow,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: radiusOnly(topLeft: 7, topRight: 7),
              child: Image.asset(
                '${image}',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: spacing(horizontal: 10),
              child: Text(
                '${text}',
              ),
            ),
            gap(h: 5),
            Text('Read story')
          ],
        ),
      ),
    );
  }
}
