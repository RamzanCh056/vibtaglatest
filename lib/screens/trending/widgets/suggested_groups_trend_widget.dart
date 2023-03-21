// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import 'package:vibetag/methods/api.dart';

import '../../../utils/constant.dart';

class SuggestedGroupsTrend extends StatefulWidget {
  final Map<String, dynamic> group;
  const SuggestedGroupsTrend({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  State<SuggestedGroupsTrend> createState() => _SuggestedGroupsTrendState();
}

class _SuggestedGroupsTrendState extends State<SuggestedGroupsTrend> {
  bool isJoined = false;
  joinGroup() async {
    final data = {
      'type': 'follow_like_join',
      'action': 'join_group',
      'user_id': '${loginUserId}',
      'page_id': '${widget.group['group_id']}',
    };
    final result = await API().postData(data);
    print(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      margin: spacing(
        vertical: 5,
      ),
      child: Container(
        margin: spacing(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          boxShadow: lightShadow,
          color: white,
          borderRadius: borderRadius(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.2,
              width: width * 0.6,
              decoration: BoxDecoration(
                borderRadius: borderRadius(15),
                // image: DecorationImage(
                //   image: NetworkImage(
                //     widget.group['cover'].toString().trim(),
                //   ),
                // ),
              ),
              child: ClipRRect(
                borderRadius: radiusOnly(topLeft: 15, topRight: 15),
                child: Image.network(
                  widget.group['avatar'].toString().trim(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            gap(h: 5),
            Container(
              width: width * 0.58,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.group['name'],
                style: TextStyle(
                  fontSize: 10,
                ),
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            gap(h: 5),
            Container(
              width: width * 0.55,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Public Group',
                      style: TextStyle(
                        color: grayMed,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  gap(w: 5),
                  Container(
                    height: 2,
                    width: 2,
                    decoration: BoxDecoration(
                      color: grayMed,
                      borderRadius: borderRadius(width),
                    ),
                  ),
                  gap(w: 5),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '170k Members',
                      style: TextStyle(
                        color: grayMed,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            gap(h: 5),
            InkWell(
              onTap: () {
                isJoined = !isJoined;
                setState(() {});
                joinGroup();
              },
              child: Container(
                width: width * 0.45,
                padding: spacing(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: orangePrimary,
                  borderRadius: borderRadius(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Join',
                  style: TextStyle(
                    color: whitePrimary,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            gap(h: 15),
          ],
        ),
      ),
    );
  }
}
