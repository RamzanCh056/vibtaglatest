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
      margin: spacing(
        horizontal: 5,
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.15,
            width: width * 0.7,
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: borderRadius(10),
            ),
            child: ClipRRect(
              borderRadius: borderRadius(10),
              child: Image.network(
                widget.page['cover'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          gap(h: 7),
          Container(
            width: width * 0.7,
            padding: spacing(
              horizontal: 5,
            ),
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.page['avatar']),
                  ),
                ),
                gap(w: 7),
                Container(
                  width: width * 0.55,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          gap(h: 3),
                          Text(
                            widget.page['category'],
                            style: TextStyle(
                              color: grayMed,
                              fontSize: 8,
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          isLiked = !isLiked;
                          setState(() {});
                          followUser();
                        },
                        child: Container(
                          padding: spacing(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: orangePrimary,
                            borderRadius: borderRadius(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                isLiked ? 'Liked' : 'Like page',
                                style: TextStyle(
                                  color: whitePrimary,
                                  fontSize: 8,
                                ),
                              ),
                              gap(w: 5),
                              Icon(
                                Icons.thumb_up,
                                color: isLiked ? blue : white,
                                size: 12,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
