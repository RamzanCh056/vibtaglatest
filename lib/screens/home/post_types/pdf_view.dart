// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:vibetag/utils/constant.dart';

class PdfReadView extends StatefulWidget {
  String url;
  PdfReadView({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<PdfReadView> createState() => _PdfReadViewState();
}

class _PdfReadViewState extends State<PdfReadView> {
  int currentIndex = 0;
  int allPages = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Center(
              child: PDF(
                onPageChanged: (current, remaining) {
                  currentIndex = current!;
                  allPages = remaining!;
                  setState(() {});
                },
                swipeHorizontal: true,
              ).cachedFromUrl(widget.url),
            ),
            Positioned(
              left: 0,
              bottom: 10,
              right: 0,
              child: Center(
                child: Container(
                  padding: spacing(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: grayMed,
                    borderRadius: borderRadius(2),
                  ),
                  child: Text(
                    '${currentIndex + 1} / ${allPages}',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
