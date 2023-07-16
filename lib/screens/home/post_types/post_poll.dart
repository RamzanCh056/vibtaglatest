// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';

import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/comment/comments.dart';
import 'package:vibetag/screens/home/post_constants.dart';
import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/screens/home/post_types/widgets/reaction_bar.dart';
import 'package:vibetag/screens/home/widgets/revibe.dart';
import 'package:vibetag/utils/constant.dart';

import '../../../methods/api.dart';
import '../../../widgets/bottom_modal_sheet_widget.dart';
import '../../hast_tag/tred_screen.dart';
import '../../profile/profile.dart';

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
  bool isPolled = false;
  int reactionValue = 0;
  String responseData = '';
  int totalLikes = 0;
  int userLike = 0;
  List<int> reactionOnPost = [];
  List<Widget> reactionsOnPostList = [];
  bool isLiked = false;

  bool isSeeMore = false;
  String seeMoreText = 'See more';

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

  @override
  void initState() {
    // TODO: implement initState
    postReactionsList();
    super.initState();
  }

  postReactionsList() {
    isLiked = followLikeORJoin(post: widget.post)['isLiked'];
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
    final result = await API().postData(data);
    print(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return widget.post['options'].length == 0
        ? gap()
        : Container(
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
                                      user_id: widget.post['publisher']
                                              ['user_id']
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
                                      widget.post['publisher']['avatar'],
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
                                      child: profileName(
                                        widget.post['publisher']['name'],
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
                                              borderRadius:
                                                  borderRadius(width)),
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
                                    postTime(widget.post['post_time']),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            createBottomModalSheet(
                              context: context,
                              screen: PostBottomBar(
                                post: widget.post,
                                is_publisher: widget.post['publisher']
                                                ['user_id']
                                            .toString() ==
                                        loginUserId
                                    ? true
                                    : false,
                              ),
                            );
                          },
                          child: Container(
                            width: width * 0.08,
                            height: width * 0.08,
                            child: Image.asset(
                              'assets/new/icons/more_h.png',
                            ),
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
                          data: widget.post['postText'].toString().length < 180
                              ? widget.post['postText']
                              : isSeeMore
                                  ? '${widget.post['postText']}  <a href="#"><strong style="color:orange;font-size:13px;"><b>${seeMoreText}</b></strong></a>'
                                  : '${widget.post['postText'].toString().substring(0, 150)}  <a href="#"><strong style="color:orange;font-size:13px;"><b>${seeMoreText}</b></strong></a>',
                          onAnchorTap: (str, map, e) {
                            if (e!.text.toString() == 'See less' ||
                                e.text.toString() == 'See more') {
                              isSeeMore = !isSeeMore;
                              seeMoreText = isSeeMore ? 'See less' : 'See more';
                              setState(() {});
                            } else {
                              pushRoute(
                                context: context,
                                screen: HashTrend(
                                    hashTag: e.text.toString().contains('#')
                                        ? e.text
                                            .toString()
                                            .replaceFirst(RegExp(r'#'), '')
                                        : e.text.toString()),
                              );
                            }
                          },
                          style: {
                            "body": Style(
                                fontSize: FontSize(14.0),
                                textOverflow: TextOverflow.ellipsis,
                                color: lightblue,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Manrope',
                                maxLines: isSeeMore
                                    ? widget.post['Orginaltext']
                                            .toString()
                                            .length %
                                        60
                                    : 3),
                            'a': Style(
                              color: orangePrimary,
                            )
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
                                  height: height *
                                      0.05 *
                                      widget.post['options'].length,
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
                                                    borderRadius:
                                                        borderRadius(width),
                                                  ),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: white,
                                                  ),
                                                ),
                                                gap(w: 10),
                                                Text(
                                                  widget.post['options'][i]
                                                      ['text'],
                                                ),
                                              ],
                                            ),
                                            isPolled
                                                ? Text(
                                                    '${widget.post['options'][i]['percentage']}')
                                                : gap(),
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
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  gap(h: 10),
                  PostReactionSections(
                    post: widget.post,
                  ),
                  gap(h: 10),
                ],
              ),
            ),
          );
  }
}
