// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/utils/constant.dart';

class ReportWidget extends StatefulWidget {
  String text;
  String postId;
  ReportWidget({
    Key? key,
    required this.text,
    required this.postId,
  }) : super(key: key);

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pop(context);
        PostMethods().reportPost(
          widget.postId,
          widget.text,
        );
      },
      child: Container(
        margin: spacing(horizontal: 7, vertical: 5),
        padding: spacing(horizontal: 15, vertical: 18),
        width: width,
        decoration: BoxDecoration(
          color: grayLight,
          borderRadius: borderRadius(7),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 12,
            color: grayPrimary,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
