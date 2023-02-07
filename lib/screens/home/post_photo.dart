// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/comment.dart';
import 'package:vibetag/screens/home/feelingWidet.dart';
import 'package:vibetag/screens/home/post_product.dart';
import 'package:vibetag/screens/home/post_type.dart';
import 'package:vibetag/screens/home/revibe.dart';
import 'package:vibetag/screens/profile/profile.dart';

import '../../utils/constant.dart';

class Post extends StatefulWidget {
  final dynamic post;

  const Post({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isShowReactions = false;
  bool isAdded = false;
  int reactionValue = 0;
  String responseData = '';
  int totalLikes = 0;
  int userLike = 0;
  List<int> reactionOnPost = [];
  List<Widget> reactionsOnPostList = [];

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
      'post_id': widget.post['post_id'].toString(),
      'user_id': loginUserId.toString(),
      'reaction': reactionValue.toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body)['status'];
    if (response == 200 && !(widget.post['reaction']['is_reacted'])) {
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
    for (var i = 0; i < 8; i++) {
      if (widget.post['reaction']['${i + 1}'] != null) {
        reactionOnPost.add(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    totalLikes =
        int.parse(widget.post['reaction']['count'].toString()) + userLike;
    String fileExtension = p.extension(widget.post['postFile']);
    bool isAudio = fileExtension == '.mp3' || fileExtension == '.wave';

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
          widget.post['photo_album'].length > 2
              ? Container(
                  width: double.infinity,
                  height: height * 0.35,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.post['photo_album'].length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: spacing(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(7),
                          ),
                          child: ClipRRect(
                            borderRadius: borderRadius(7),
                            child: Stack(
                              children: [
                                Image.network(
                                  widget.post['photo_album'][i]['image'],
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    padding: spacing(
                                      horizontal: 7,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(2.5),
                                      color: const Color.fromARGB(54, 0, 0, 0),
                                    ),
                                    child: Text(
                                      '${i + 1}/${widget.post['photo_album'].length}',
                                      style: TextStyle(
                                        color: white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : gap(),
          postFile(
            file: widget.post['postFile'],
            context: context,
            thumbnail: widget.post['postFileThumb'],
          ),
          Container(
            padding: spacing(
              horizontal: 5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: whiteSecondary,
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
                                left: i * 12,
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
                        width: 15 * reactionOnPost.length.toDouble(),
                        height: 25,
                        child: Stack(
                          children: reactionsOnPostList,
                        ),
                      ),
                      gap(w: 5),
                      int.parse(widget.post['videoViews'].toString()) != 0
                          ? Text(
                              widget.post['reaction']['count'].toString(),
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 10,
                              ),
                            )
                          : Text(
                              widget.post['likes_string'],
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
                  child: Row(
                    children: [
                      Text(
                        "${widget.post['post_comments']} Comments | ${widget.post['post_shares']} Revibed",
                        style: TextStyle(
                          color: grayMed,
                          fontSize: 10,
                        ),
                      ),
                      int.parse(widget.post['videoViews'].toString()) != 0
                          ? gap(w: 10)
                          : gap(),
                      int.parse(widget.post['videoViews'].toString()) != 0
                          ? isAudio
                              ? Text(
                                  '${getInK(number: int.parse(widget.post['videoViews'].toString()))} listen',
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 10,
                                  ),
                                )
                              : Text(
                                  '${getInK(number: int.parse(widget.post['videoViews']))} views',
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 10,
                                  ),
                                )
                          : const SizedBox(),
                    ],
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
                        color: grayMed,
                        fontSize: 12,
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
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
            ),
            child: Html(
              data: widget.post['postText'],
              style: {
                "body": Style(
                  fontSize: FontSize(12.0),
                  textOverflow: TextOverflow.ellipsis,
                  color: Colors.black54,
                  maxLines: 3,
                ),
              },
            ),
          ),
          SizedBox(
            height: height * 0.01,
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
                                screen: const Profile(),
                              );
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
                              child: CircleAvatar(
                                radius: width * 0.06,
                                foregroundImage: NetworkImage(
                                  widget.post['post_owner_data']['avatar'],
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
                                width: width * 0.25,
                                child: Text(
                                  widget.post['post_owner_data']['name'],
                                  style: TextStyle(
                                    color: blackPrimary,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              gap(h: 5),
                              Row(
                                children: [
                                  Text(
                                    readTimestamp(int.parse(widget
                                        .post['post_owner_data']['time'])),
                                    style: TextStyle(
                                      color: grayMed,
                                      fontSize: 10,
                                    ),
                                  ),
                                  widget.post['postMap'] != ''
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
                                                '${widget.post['postMap']}',
                                                style: TextStyle(
                                                    color: graySecondary,
                                                    fontSize: 12,
                                                    overflow:
                                                        TextOverflow.ellipsis),
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
                    InkWell(
                      onTap: () {
                        pushRoute(
                          context: context,
                          screen: const Profile(),
                        );
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
                        Row(
                          children: [
                            Container(
                              width: width * 0.25,
                              child: Text(
                                widget.post['publisher']['name'] ?? '${widget.post['publisher']['first_name']} ${widget.post['publisher']['last_name']}',
                                style: TextStyle(
                                  color: blackPrimary,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            gap(
                              w: 5,
                            ),
                            widget.post['photo_album'].length > 0
                                ? postFeeling(
                                    width: width,
                                    feeling: 'created an Album',
                                    start: '',
                                  )
                                : gap(),
                            widget.post['parent_id'] != '0'
                                ? postFeeling(
                                    width: width,
                                    feeling: 'Revibed a post',
                                    start: '',
                                  )
                                : gap(),
                            postFeeling(
                                width: width,
                                start: 'is feeling',
                                feeling: widget.post['postFeeling']),
                            postFeeling(
                                width: width,
                                start: 'is listening',
                                feeling: widget.post['postListening']),
                            postFeeling(
                                width: width,
                                start: 'is Traveling',
                                feeling: widget.post['postTraveling']),
                            postFeeling(
                                width: width,
                                start: 'is watching',
                                feeling: widget.post['postWatching']),
                            postFeeling(
                                width: width,
                                start: 'is playing',
                                feeling: widget.post['postPlaying']),
                          ],
                        ),
                        gap(h: 5),
                        Row(
                          children: [
                            Text(
                              widget.post['post_time'],
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 10,
                              ),
                            ),
                            widget.post['postMap'] != ''
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
                                          '${widget.post['postMap']}',
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
        ],
      ),
    );
    ;
  }
}