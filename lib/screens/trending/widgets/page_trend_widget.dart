// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import 'package:vibetag/methods/api.dart';

import '../../../utils/constant.dart';

class PagesTrendWidget extends StatefulWidget {
  final Map<String, dynamic> page;
  const PagesTrendWidget({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  State<PagesTrendWidget> createState() => _PagesTrendWidgetState();
}

class _PagesTrendWidgetState extends State<PagesTrendWidget> {
  bool isLiked = false;
  followUser() async {
    final data = {
      'type': 'follow_like_join',
      'action': 'like_page',
      'user_id': '${loginUserId}',
      'page_id': '${widget.page['page_id']}',
    };
    final result = await API().postData(data);
    print(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      padding: spacing(
        vertical: 7,
      ),
      child: Container(
        height: height * 0.3,
        margin: spacing(
          horizontal: 7,
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius(7),
          boxShadow: lightShadow,
        ),
        child: Stack(
          children: [
            Container(
              height: height * 0.13,
              width: width * 0.7,
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: radiusOnly(topLeft: 7, topRight: 7),
              ),
              child: ClipRRect(
                borderRadius: radiusOnly(topLeft: 7, topRight: 7),
                child: Image.network(
                  widget.page['cover'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            gap(h: 7),
            Positioned(
              top: height * 0.08,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: height * 0.05,
                    backgroundImage: NetworkImage(widget.page['avatar']),
                  ),
                  gap(h: 15),
                  Text(
                    widget.page['name'],
                    style: TextStyle(
                      color: blackPrimary,
                      fontSize: 12,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    '445654 people like this',
                    style: TextStyle(
                      color: blue,
                      fontSize: 8,
                    ),
                  ),
                  gap(h: 7),
                  InkWell(
                    onTap: () {
                      isLiked = !isLiked;
                      setState(() {});
                      followUser();
                    },
                    child: Container(
                      padding: spacing(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      margin: spacing(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: orangePrimary,
                        borderRadius: borderRadius(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        isLiked ? 'Liked' : 'Like',
                        style: TextStyle(
                          color: whitePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
