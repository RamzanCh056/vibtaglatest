// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../utils/constant.dart';
import '../../hast_tag/tred_screen.dart';
import '../const.dart';

class HashSearchWidget extends StatefulWidget {
  final Map<String, dynamic> hash;
  const HashSearchWidget({
    Key? key,
    required this.hash,
  }) : super(key: key);

  @override
  State<HashSearchWidget> createState() => _HashSearchWidgetState();
}

class _HashSearchWidgetState extends State<HashSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearchOption = !showSearchOption;
        setState(() {});
        pushRoute(
          context: context,
          screen: HashTrend(
            hashTag: widget.hash['tag'].toString(),
          ),
        );
      },
      child: Container(
        margin: spacing(
          horizontal: 15,
        ),
        padding: spacing(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: grayMed,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 25,
              child: Image.asset(
                'assets/images/Hashtag.png',
                fit: BoxFit.cover,
              ),
            ),
            gap(w: 10),
            Text(
              '#${widget.hash['tag']}',
              style: TextStyle(
                fontSize: 12,
                color: grayPrimary,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
