// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constant.dart';

class ShopCategorySingleItem extends StatefulWidget {
  final Map<String, dynamic> category;
  const ShopCategorySingleItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<ShopCategorySingleItem> createState() => _ShopCategorySingleItemState();
}

class _ShopCategorySingleItemState extends State<ShopCategorySingleItem> {
  List<Widget> subCate = [];
  @override
  void initState() {
    super.initState();
    setSubCategory();
  }

  setSubCategory() {
    for (var subCat in widget.category['sub_cate']) {
      subCate.add(
        InkWell(
          onTap: () {
            launchUrl(Uri.parse(subCat['link']));
          },
          child: Text(
            subCat['title'],
            style: TextStyle(
              color: grayMed,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: width * 0.1,
          foregroundImage: NetworkImage(widget.category['image']),
        ),
        gap(h: 10),
        Container(
          padding: spacing(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
            color: blackPrimary,
            borderRadius: borderRadius(5),
          ),
          child: Text(
            widget.category['title'],
            style: TextStyle(
              color: white,
            ),
          ),
        ),
        gap(h: 10),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: subCate,
          ),
        ),
      ],
    );
  }
}
