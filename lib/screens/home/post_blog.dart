// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
  final String first;
  final Map<String, dynamic> reactions;

  final String parent_id;
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
    required this.first,
    required this.reactions,
    required this.parent_id,
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
  List<int> reactionOnPost = [];

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

  void initState() {
    // TODO: implement initState
    postReactionsList();
    super.initState();
  }

  postReactionsList() {
    for (var i = 0; i < 8; i++) {
      if (widget.reactions['${i + 1}'] != null) {
        reactionOnPost.add(i);
      }
    }
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Html(
                        data: widget.blog['title'],
                        style: {
                          "body": Style(
                              fontSize: FontSize(14.0),
                              fontWeight: FontWeight.bold,
                              textOverflow: TextOverflow.ellipsis,
                              color: graySecondary,
                              maxLines: 2),
                        },
                      ),
                      Html(
                        data: widget.blog['description'],
                        style: {
                          "body": Style(
                            fontSize: FontSize(12.0),
                            fontWeight: FontWeight.bold,
                            textOverflow: TextOverflow.ellipsis,
                            color: grayMed,
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                gap(h: 5),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 37 * reactionOnPost.length.toDouble(),
                          height: reactionOnPost.length > 0 ? height * 0.05 : 0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: reactionOnPost.length,
                              reverse: true,
                              itemBuilder: (context, i) {
                                return Container(
                                    width: 35,
                                    height: 35,
                                    padding: spacing(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: borderRadius(width),
                                        child: Image.asset(
                                          reactions[reactionOnPost[i]],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ));
                              }),
                        ),
                        gap(w: 2),
                        widget.reactions['is_reacted']
                            ? totalLikes > 1
                                ? Text(
                                    "You and ${totalLikes - 1} other(s)",
                                    style: TextStyle(
                                      color: grayMed,
                                      fontSize: 10,
                                    ),
                                  )
                                : Text(
                                    "You, ${widget.first}",
                                    style: TextStyle(
                                      color: grayMed,
                                      fontSize: 10,
                                    ),
                                  )
                            : Text(
                                '${totalLikes}',
                                style: TextStyle(
                                  color: grayMed,
                                  fontSize: 10,
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
                        fontSize: 10,
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
                        width: width * 0.03,
                        height: width * 0.03,
                        child: reactionValue != 0
                            ? Image.asset(reactions[reactionValue - 1])
                            : widget.reactions['is_reacted']
                                ? Image.asset(reactions[
                                    int.parse(widget.reactions['type']) - 1])
                                : Image.asset(
                                    'assets/new/icons/heart.png',
                                    fit: BoxFit.cover,
                                  ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        reactionValue != 0
                            ? reactionsText[reactionValue - 1]
                            : widget.reactions['is_reacted']
                                ? reactionsText[
                                    int.parse(widget.reactions['type']) - 1]
                                : 'React',
                        style: TextStyle(
                          fontSize: 12,
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
                        width: width * 0.03,
                        height: width * 0.03,
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
                          fontSize: 12,
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
                        width: width * 0.03,
                        height: width * 0.03,
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
                          fontSize: 12,
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
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10,
              ),
              child: Html(
                data: widget.postText,
                style: {
                  "body": Style(
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: FontSize(12.0),
                    color: Colors.black54,
                    maxLines: 3,
                  ),
                },
              ),
            ),
            gap(h: 10),
            widget.parent_id != '0'
                ? Container(
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
                              width: width * 0.12,
                              height: width * 0.12,
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
                                radius: width * 0.06,
                                foregroundImage: NetworkImage(
                                  widget.blog['author']['avatar'],
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
                                      '${widget.blog['author']['first_name']} ${widget.blog['author']['last_name']}',
                                      style: TextStyle(
                                        color: blackPrimary,
                                      ),
                                    ),
                                    widget.parent_id != '0'
                                        ? Row(
                                            children: [
                                              gap(
                                                w: 5,
                                              ),
                                              Container(
                                                width: 4,
                                                height: 4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      borderRadius(width),
                                                  color: grayMed,
                                                ),
                                              ),
                                              gap(
                                                w: 5,
                                              ),
                                              Text(
                                                'created a new article',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: grayMed,
                                                ),
                                              )
                                            ],
                                          )
                                        : gap(),
                                  ],
                                ),
                                Text(
                                  widget.postTime,
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 12,
                                  ),
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
                  )
                : gap(),
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
                        width: width * 0.12,
                        height: width * 0.12,
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
                          radius: width * 0.06,
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
                              widget.parent_id != '0'
                                  ? Row(
                                      children: [
                                        gap(
                                          w: 5,
                                        ),
                                        Container(
                                          width: 4,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            borderRadius: borderRadius(width),
                                            color: grayMed,
                                          ),
                                        ),
                                        gap(
                                          w: 5,
                                        ),
                                        Text(
                                          'Revibed a post',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: grayMed,
                                          ),
                                        )
                                      ],
                                    )
                                  : gap(),
                            ],
                          ),
                          Text(
                            widget.postTime,
                            style: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                            ),
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
          ],
        ),
      ),
    );
  }
}
