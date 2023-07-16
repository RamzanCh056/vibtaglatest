// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vibetag/screens/home/post_types/pdf_view.dart';
import 'package:vibetag/utils/constant.dart';

class FilePostView extends StatelessWidget {
  String url;
  String ex;
  String fileName;
  FilePostView({
    Key? key,
    required this.url,
    required this.ex,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (ex == '.pdf') {
          pushRoute(
            context: context,
            screen: PdfReadView(
              url: url,
            ),
          );
        }
      },
      child: Container(
        height: height * 0.15,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: spacing(horizontal: 17, vertical: 17),
              decoration: BoxDecoration(
                color: lightGrayNew,
                borderRadius: borderRadius(width),
              ),
              child: Icon(
                Icons.insert_drive_file_rounded,
                size: 32,
                color: blue,
              ),
            ),
            gap(h: 10),
            Text(
              fileName.toString(),
              style: TextStyle(
                fontSize: 12,
                color: grayPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
