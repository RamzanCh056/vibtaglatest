import 'package:flutter/material.dart';

import '../utils/constant.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const SearchBar(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.05,
      margin: spacing(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius(
          width * 0.1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: '${hintText}',
          hintStyle: TextStyle(
            fontSize: 12,
            color: darkGray,
          ),
          suffix: Icon(
            Icons.search,
            color: orange,
            size: 16,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            bottom: 10,
            left: 15,
            right: 15,
          ),
        ),
      ),
    );
  }
}
