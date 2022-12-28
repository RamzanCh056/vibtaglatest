// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/home/comment.dart';
import 'package:vibetag/screens/home/revibe.dart';

import 'package:vibetag/utils/constant.dart';

import '../../methods/api.dart';

class BlogPost extends StatefulWidget {
  final String avatar;
  final String name;
  final String postId;
  final String postTime;
  final String postText;
  final dynamic blog;
  final String about;

  final String likes;
  final String comments;
  final String shares;

  const BlogPost({
    Key? key,
    required this.avatar,
    required this.name,
    required this.postId,
    required this.postTime,
    required this.postText,
    required this.blog,
    required this.about,
    required this.likes,
    required this.comments,
    required this.shares,
  }) : super(key: key);

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool isShowReactions = false;
  bool isAdded = false;
  int reactionValue = 0;
  String responseData = '';
  int totalLikes = 0;
  int userLike = 0;

  final List<String> reactions = [
    'assets/new/gif/thumbs_up.gif',
    'assets/new/gif/sparkling_heart.gif',
    'assets/new/gif/squinting_face.gif',
    'assets/new/gif/hushed_face.gif',
    'assets/new/gif/weary_face.gif',
    'assets/new/gif/pouting_face.gif',
    'assets/new/gif/weary_face.gif',
    'assets/new/gif/broken_heart.gif',
  ];

  void reactOnPost() async {
    setState(() {
      isAdded = false;
    });
    userLike = 0;
    final data = {
      'type': 'react_story',
      'post_id': widget.postId.toString(),
      'user_id': loginUserId.toString(),
      'reaction': reactionValue.toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body)['status'];
    if (response == 200) {
      userLike = 1;
    }
    setState(() {
      isAdded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    totalLikes = int.parse(widget.likes) + userLike;

    return Container(
      margin: spacing(
        vertical: 10,
      ),
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            width * 0.02,
          ),
        ),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  widget.blog['thumbnail'],
                  fit: BoxFit.fill,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: spacing(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${widget.blog['title']}',
                      ),
                      gap(h: 7),
                      Text(
                        '${widget.blog['description']}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                gap(h: 5),
                gap(h: 10),
              ],
            ),
            Container(
              padding: spacing(
                horizontal: 15,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: whiteSecondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: spacing(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    margin: spacing(
                      horizontal: 3,
                    ),
                    decoration: BoxDecoration(
                      color: grayLight,
                      borderRadius: borderRadius(width),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/new/icons/heavy_smil.png'),
                        Image.asset('assets/new/icons/small_heart.png'),
                        gap(w: 5),
                        Text(
                          "${totalLikes}",
                          style: TextStyle(
                            color: grayMed,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: spacing(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Text(
                      "${widget.comments} Comments | ${widget.shares} Revibed",
                      style: TextStyle(
                        color: grayMed,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isShowReactions = !isShowReactions;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.04,
                        height: width * 0.04,
                        child: Image.asset(
                          'assets/new/icons/heart.png',
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'React',
                        style: TextStyle(
                          color: grayMed,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Comments(
                      context: context,
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.04,
                        height: width * 0.04,
                        child: Image.asset(
                          'assets/new/icons/comment.png',
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Comment',
                        style: TextStyle(
                          color: grayMed,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Revibe(context: context);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.04,
                        height: width * 0.04,
                        child: Image.asset(
                          'assets/new/icons/revibe.png',
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Revibe',
                        style: TextStyle(
                          color: grayMed,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              width: width * 0.95,
              height: 2,
              color: medGray,
            ),
            isShowReactions
                ? Container(
                    width: width * 0.7,
                    height: width * 0.11,
                    padding: spacing(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    margin: spacing(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(56, 0, 0, 0),
                            offset: Offset.zero,
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ],
                        borderRadius: borderRadius(5)),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reactions.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isShowReactions = !isShowReactions;
                              reactionValue = i + 1;
                            });
                            reactOnPost();
                          },
                          child: Container(
                            width: width * 0.08,
                            height: width * 0.08,
                            child: Image.asset(reactions[i]),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            gap(h: 10),
            ReadMoreText(
              widget.postText,
              trimLines: 2,
              colorClickableText: orangePrimary,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Read less',
              moreStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            gap(h: 10),
            Container(
              width: width,
              height: height * 0.08,
              margin: spacing(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.15,
                        height: width * 0.15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: borderRadius(width),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                orangePrimary,
                                graySecondary,
                              ],
                            )),
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          radius: width * 0.075,
                          foregroundImage: NetworkImage(
                            widget.avatar,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                  color: blackPrimary,
                                ),
                              ),
                              gap(
                                w: 5,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.postTime,
                                style: TextStyle(
                                  color: grayMed,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: width * 0.08,
                    height: width * 0.08,
                    child: Image.asset(
                      'assets/new/icons/more_h.png',
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
