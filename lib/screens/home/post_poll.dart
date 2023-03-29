// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';
import 'package:svg_icon/svg_icon.dart';

import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/comment/comments.dart';
import 'package:vibetag/screens/home/revibe.dart';
import 'package:vibetag/utils/constant.dart';

import '../../methods/api.dart';
import '../hast_tag/tred_screen.dart';
import '../profile/profile.dart';

class PoolPost extends StatefulWidget {
  final dynamic post;

  const PoolPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PoolPost> createState() => _PoolPostState();
}

class _PoolPostState extends State<PoolPost> {
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
      'post_id': widget.post['post_id'].toString(),
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

  followOrLike() async {
    var data = {};
    if (widget.post['publisher']['page_id'] != null) {
      data = {
        'type': 'follow_like_join',
        'action': 'like_page',
        'user_id': loginUserId.toString(),
        'page_id': widget.post['publisher']['page_id'],
      };
    } else {
      data = {
        'type': 'follow_like_join',
        'action': 'follow_user',
        'user_id': widget.post['publisher']['user_id'],
        'loggedin_user_id': loginUserId,
      };
    }
    final result = await API().postData(data);
    print(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    totalLikes =
        int.parse(widget.post['reaction']['count'].toString()) + userLike;

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                      InkWell(
                        onTap: () {
                          pushRoute(
                              context: context,
                              screen: Profile(
                                user_id: widget.post['publisher']['user_id']
                                    .toString(),
                              ));
                        },
                        child: Container(
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
                          child: ClipRRect(
                            borderRadius: borderRadius(width),
                            child: Container(
                              width: width * 0.12,
                              child: netImage(
                                widget.post['post_owner_data']['avatar'],
                              ),
                            ),
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
                              InkWell(
                                onTap: () {
                                  pushRoute(
                                      context: context,
                                      screen: Profile(
                                        user_id: widget.post['publisher']
                                                ['user_id']
                                            .toString(),
                                      ));
                                },
                                child: Text(
                                  widget.post['publisher']['name'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: blackPrimary,
                                  ),
                                ),
                              ),
                              gap(
                                w: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: blackPrimary,
                                        borderRadius: borderRadius(width)),
                                  ),
                                  gap(
                                    w: 5,
                                  ),
                                  Text(
                                    'created a poll',
                                    style: TextStyle(
                                      color: graySecondary,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.post['post_time'],
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                gap(h: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: spacing(
                    horizontal: 10,
                  ),
                  child: Html(
                    data: widget.post['postText'],
                    onAnchorTap: (str, rndr, map, e) {
                      pushRoute(
                        context: context,
                        screen: HashTrend(
                            hashTag: e!.text.toString().contains('#')
                                ? e.text
                                    .toString()
                                    .replaceFirst(RegExp(r'#'), '')
                                : e.text.toString()),
                      );
                    },
                    style: {
                      "body": Style(
                        fontSize: FontSize(12.0),
                        color: Colors.black54,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    },
                  ),
                ),
                gap(h: 10),
                Container(
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          gap(
                            h: 20,
                          ),
                          Container(
                            height:
                                height * 0.05 * widget.post['options'].length,
                            width: double.maxFinite,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 0,
                                childAspectRatio: 10 / 1,
                              ),
                              itemCount: widget.post['options'].length,
                              itemBuilder: (context, i) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: grayLight,
                                    borderRadius: borderRadius(width),
                                  ),
                                  margin: spacing(
                                    horizontal: 10,
                                    vertical: 2.5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: spacing(
                                              horizontal: 5,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: grayMed,
                                              borderRadius: borderRadius(width),
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              color: white,
                                            ),
                                          ),
                                          gap(w: 10),
                                          Text(
                                            widget.post['options'][i]['text'],
                                          ),
                                        ],
                                      ),
                                      Text(
                                          '${widget.post['options'][i]['percentage']}')
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          gap(
                            h: 20,
                          ),
                        ],
                      ),
                      Positioned(
                          top: 0,
                          right: 10,
                          child: Container(
                            padding: spacing(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: borderRadius(width),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.analytics_outlined,
                                  color: white,
                                  size: 16,
                                ),
                                gap(w: 2),
                                Text(
                                  "${widget.post['options'][0]['all']}",
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            gap(h: 10),
            Container(
              color: grayLight,
              padding: spacing(
                horizontal: 15,
                vertical: 5,
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
                      "${widget.post['post_comments']} Comments | ${widget.post['post_shares']} Revibed",
                      style: TextStyle(
                        color: grayMed,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
            gap(h: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'React',
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
                    PostComments(
                        context: context, postId: widget.post['post_id']);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.04,
                        height: width * 0.04,
                        child: Image.asset(
                          'assets/new/icons/comment.png',
                          fit: BoxFit.cover,
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
                        width: width * 0.04,
                        height: width * 0.04,
                        child: Image.asset(
                          'assets/new/icons/revibe.png',
                          fit: BoxFit.cover,
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
            gap(
              h: 10,
            ),
          ],
        ),
      ),
    );
  }
}
