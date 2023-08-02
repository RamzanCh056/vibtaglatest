// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vibetag/screens/hast_tag/tred_screen.dart';
import 'package:vibetag/screens/page/page.dart';

import '../../../utils/constant.dart';
import '../const.dart';

class PageSearchWidget extends StatefulWidget {
  final Map<String, dynamic> page;
  const PageSearchWidget({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  State<PageSearchWidget> createState() => _PageSearchWidgetState();
}

class _PageSearchWidgetState extends State<PageSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearchOption = !showSearchOption;
        setState(() {});
        pushRoute(
          context: context,
          screen: PageScreen(
            page_id: widget.page['page_id'].toString(),
          ),
        );
      },
      child: Container(
        width: width,
        margin: spacing(vertical: 5),
        padding: spacing(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: grayLight,
          boxShadow: lightShadow,
          borderRadius: borderRadius(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: borderRadius(50),
                child: netImage(
                  widget.page['avatar'].toString(),
                ),
              ),
            ),
            gap(w: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.page['page_title'] != null
                    ? Text(setName(widget.page['page_title'].toString()))
                    : gap(),
                gap(h: 2),
                widget.page['page_name'] != null
                    ? Text(
                        setName(widget.page['page_name'].toString()),
                        style: TextStyle(
                          color: grayMed,
                          fontSize: 12,
                        ),
                      )
                    : gap(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
