// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/post_comment_bar.dart';
import 'package:vibetag/screens/home/comments.dart';
import 'package:vibetag/screens/home/post_type.dart';
import 'package:vibetag/screens/home/revibe.dart';

import '../../utils/constant.dart';
import '../profile/profile.dart';

class ColoredPost extends StatefulWidget {
  final dynamic post;
  final String avatar;
  final String first;

  final String name;
  final String postId;
  final String postTime;
  final String postText;
  final String postFile;
  final int videoViews;
  final Map<String, dynamic> reactions;
  final Map<String, dynamic> color_post_info;
  final String feelings;
  final String location;
  final String comments;
  final String likes;
  final String likeString;

  final String shares;
  const ColoredPost({
    Key? key,
    required this.post,
    required this.avatar,
    required this.first,
    required this.name,
    required this.postId,
    required this.postTime,
    required this.postText,
    required this.postFile,
    required this.videoViews,
    required this.reactions,
    required this.color_post_info,
    required this.feelings,
    required this.location,
    required this.comments,
    required this.likes,
    required this.likeString,
    required this.shares,
  }) : super(key: key);

  @override
  State<ColoredPost> createState() => _ColoredPostState();
}

class _ColoredPostState extends State<ColoredPost> {
  bool isShowReactions = false;
  bool isAdded = false;
  int reactionValue = 0;
  String responseData = '';
  int totalLikes = 0;
  int userLike = 0;
  List<int> reactionOnPost = [];
  List<Widget> reactionsOnPostList = [];
  bool isLiked = false;

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
  final List<String> reactionsText = [
    'Like',
    'Love',
    'Haha',
    'Wow',
    'Sad',
    'Angry',
    'Cry',
    'Break'
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
    if (response == 200 && !(widget.reactions['is_reacted'])) {
      userLike = 1;
    }
    setState(() {
      isAdded = true;
    });
  }

  @override
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
      if (widget.reactions['${i + 1}'] != null) {
        reactionOnPost.add(i);
      }
    }
  }

  followOrLike() async {
    print('+++++++++++++++++++++++++++++++++++++++++');
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
    totalLikes = int.parse(widget.likes) + userLike;

    return Container(
      width: double.maxFinite,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                            widget.avatar,
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
                                    child: FittedBox(
                                      child: Text(
                                        widget.name,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  gap(
                                    w: 5,
                                  ),
                                  widget.feelings != ''
                                      ? Row(
                                          children: [
                                            Container(
                                              width: 5,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: blackPrimary,
                                                  borderRadius:
                                                      borderRadius(width)),
                                            ),
                                            gap(
                                              w: 5,
                                            ),
                                            Text(
                                              'is feeling ${widget.feelings}',
                                              style: TextStyle(
                                                color: graySecondary,
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        )
                                      : Container(),
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
                                                color:
                                                    isLiked ? grayLight : white,
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
                        Row(
                          children: [
                            Text(
                              widget.postTime,
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 12,
                              ),
                            ),
                            widget.location != ''
                                ? Row(
                                    children: [
                                      gap(
                                        w: 5,
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: graySecondary,
                                      ),
                                      gap(
                                        w: 5,
                                      ),
                                      Container(
                                        width: width * 0.5,
                                        child: Text(
                                          '${widget.location}',
                                          style: TextStyle(
                                              color: graySecondary,
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.3,
            width: width,
            decoration: widget.color_post_info['image'] != ''
                ? BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${serverUrl}${widget.color_post_info['image']}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  )
                : BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        HexColor('${widget.color_post_info['color_1']}'),
                        HexColor('${widget.color_post_info['color_2']}')
                      ],
                    ),
                  ),
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: double.maxFinite,
                  child: Center(
                    child: Html(
                      data: widget.postText,
                      style: {
                        "body": Style(
                          fontSize: FontSize(16.0),
                          textOverflow: TextOverflow.clip,
                          color: HexColor(
                            '${widget.color_post_info['text_color']}',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          gap(h: 10),
          Container(
            color: grayLight,
            padding: spacing(
              horizontal: 5,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: grayLight,
                    borderRadius: borderRadius(width),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 0,
                        height: 0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: reactionOnPost.length,
                            reverse: true,
                            itemBuilder: (context, i) {
                              reactionsOnPostList.add(Positioned(
                                left: i * 18,
                                child: Container(
                                  width: 20,
                                  height: 20,
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
                                ),
                              ));
                              return Container();
                            }),
                      ),
                      Container(
                        width: 20 * reactionOnPost.length.toDouble(),
                        height: 25,
                        child: Stack(
                          children: reactionsOnPostList,
                        ),
                      ),
                      gap(w: 5),
                      Text(
                        widget.likeString,
                        style: TextStyle(
                          color: grayMed,
                          fontSize: 10,
                        ),
                      )
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
                        color: grayMed,
                        fontSize: 12,
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
                  width: width * 0.74,
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
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      ),
    );
  }
}
