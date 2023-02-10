// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vibetag/screens/home/feelingWidet.dart';

import 'package:vibetag/screens/home/post_comment_bar.dart';
import 'package:vibetag/screens/home/comments.dart';
import 'package:vibetag/screens/home/revibe.dart';
import 'package:vibetag/utils/constant.dart';

import '../../methods/api.dart';
import '../profile/profile.dart';

class BlogPost extends StatefulWidget {
  final dynamic post;

  const BlogPost({
    Key? key,
    required this.post,
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
  bool isLiked = false;
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
      'post_id': widget.post['post_id'],
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
    isLiked = widget.post['me_followed'] != null
        ? widget.post['me_followed']
        : widget.post['me_liked'];
    for (var i = 0; i < 8; i++) {
      if (widget.post['reaction']['${i + 1}'] != null) {
        reactionOnPost.add(i);
      }
    }
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
    print(data);
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
                          width: width * 0.1,
                          height: width * 0.1,
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
                              widget.post['publisher']['avatar'],
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
                          Container(
                            width: width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    widget.post['parent_id'] != '0'
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
                                                'Revibed a post',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: grayMed,
                                                ),
                                              )
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              gap(w: 5),
                                              postFeeling(
                                                width: width,
                                                feeling: 'Created an article',
                                                start: '',
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    widget.post['user_id'].toString() !=
                                            loginUserId
                                        ? InkWell(
                                            onTap: () {
                                              followOrLike();

                                              setState(() {
                                                isLiked = !isLiked;
                                              });
                                            },
                                            child: Container(
                                              padding: spacing(
                                                horizontal: 15,
                                                vertical: 7,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: isLiked
                                                      ? grayLight
                                                      : white,
                                                  borderRadius: borderRadius(5),
                                                  border: Border.all(
                                                      width: isLiked ? 0 : 1,
                                                      color: grayMed)),
                                              child: Text(
                                                widget.post['user_id'] != '0'
                                                    ? isLiked
                                                        ? 'Following'
                                                        : 'Follow'
                                                    : widget.post['page_id'] !=
                                                            '0'
                                                        ? isLiked
                                                            ? 'Liked'
                                                            : 'Like'
                                                        : 'Join',
                                                style: TextStyle(
                                                  color: grayMed,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          )
                                        : gap(),
                                    gap(w: 5),
                                    Container(
                                      width: width * 0.06,
                                      height: width * 0.06,
                                      child: Image.asset(
                                        'assets/new/icons/more_h.png',
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Text(
                            widget.post['post_time'],
                            style: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            widget.post['parent_id'] != '0'
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
                            InkWell(
                              onTap: () {
                                pushRoute(
                                  context: context,
                                  screen: Profile(
                                    user_id: widget.post['post_owner_data']
                                            ['user_id']
                                        .toString(),
                                  ),
                                );
                              },
                              child: Container(
                                width: width * 0.1,
                                height: width * 0.1,
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
                                    widget.post['blog']['author']['avatar'],
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
                                            user_id: widget
                                                .post['post_owner_data']
                                                    ['user_id']
                                                .toString(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        '${widget.post['blog']['author']['first_name']} ${widget.post['blog']['author']['last_name']}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                      ),
                                    ),
                                    widget.post['parent_id'] != '0'
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
                                  widget.post['post_time'],
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : gap(),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10,
              ),
              child: Html(
                data: widget.post['blog']['title'],
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  widget.post['blog']['thumbnail'],
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
                        data: widget.post['blog']['title'],
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
                        data: widget.post['blog']['description'],
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
                                  ),
                                );
                              }),
                        ),
                        gap(w: 2),
                        Text(
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
                      "${widget.post['post_comments']} Comments | ${widget.post['post_shares']} Revibed",
                      style: TextStyle(
                        fontSize: 10,
                        color: grayMed,
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
                        child: reactionValue != 0
                            ? Image.asset(reactions[reactionValue - 1])
                            : widget.post['reaction']['is_reacted']
                                ? Image.asset(reactions[
                                    int.parse(widget.post['reaction']['type']) -
                                        1])
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
                            : widget.post['reaction']['is_reacted']
                                ? reactionsText[
                                    int.parse(widget.post['reaction']['type']) -
                                        1]
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
            gap(h: 10),
          ],
        ),
      ),
    );
  }
}
