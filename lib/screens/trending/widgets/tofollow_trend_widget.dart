// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/methods/api.dart';

import '../../../utils/constant.dart';

class ToFollowTrendWidget extends StatefulWidget {
  final Map<String, dynamic> user;
  const ToFollowTrendWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ToFollowTrendWidget> createState() => _ToFollowTrendWidgetState();
}

class _ToFollowTrendWidgetState extends State<ToFollowTrendWidget> {
  followUser() async {
    final data = {
      'type': 'follow_like_join',
      'action': 'follow_user',
      'user_id': '${widget.user['user_id']}',
      'loggedin_user_id': '${loginUserId}',
    };
    final result = await API().postData(data);
    print(jsonDecode(result.body));
  }

  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.12,
              height: width * 0.12,
              decoration: BoxDecoration(
                borderRadius: borderRadius(width),
              ),
              child: ClipRRect(
                borderRadius: borderRadius(width),
                child: Image.network(
                  widget.user['avatar'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            gap(w: 5),
            Container(
              width: width * 0.75,
              height: width * 0.12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: width * 0.12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            widget.user['name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        Text(
                          widget.user['username'],
                          style: TextStyle(
                            fontSize: 10,
                            color: grayMed,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      isFollowing = !isFollowing;
                      followUser();
                      setState(() {});
                    },
                    child: Container(
                      padding: spacing(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: orangePrimary,
                          width: 2,
                        ),
                        borderRadius: borderRadius(5),
                      ),
                      child: Text(
                        isFollowing ? 'Following' : 'Follow',
                        style: TextStyle(
                          color: orangePrimary,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        gap(h: 10),
        Container(
          width: double.maxFinite,
          color: grayLight,
          height: 1,
        ),
        gap(h: 10),
      ],
    );
  }
}
