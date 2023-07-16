// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vibetag/screens/blog/blog.dart';
import 'package:vibetag/screens/home/post_constants.dart';
import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/screens/home/post_types/widgets/reaction_bar.dart';
import 'package:vibetag/screens/home/widgets/feelingWidet.dart';

import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/widgets/revibe.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

import '../../../methods/api.dart';
import '../../buzz/widget/buzz_bar.dart';
import '../../hast_tag/tred_screen.dart';
import '../../profile/profile.dart';

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
  bool isAdded = false;
  String responseData = '';
  bool isLiked = false;
  bool isSeeMore = false;
  String seeMoreText = 'See more';

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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
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
                                      child: profileName(
                                        widget.post['publisher']['name'],
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
                                    InkWell(
                                      onTap: () {
                                        createBottomModalSheet(
                                          context: context,
                                          screen: PostBottomBar(
                                            post: widget.post,
                                            is_publisher: widget.post['user_id']
                                                        .toString() ==
                                                    loginUserId
                                                ? true
                                                : false,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: width * 0.06,
                                        height: width * 0.06,
                                        child: Image.asset(
                                          'assets/new/icons/more_h.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        postTime(widget.post['post_time']),
                      ],
                    )
                  ],
                ),
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
                                child: ClipRRect(
                                  borderRadius: borderRadius(width),
                                  child: Container(
                                    width: width * 0.12,
                                    child: netImage(
                                      widget.post['blog']['author']['avatar'],
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
                                postTime(widget.post['post_time']),
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
                onAnchorTap: (str, map, e) {
                  pushRoute(
                    context: context,
                    screen: HashTrend(
                        hashTag: e!.text.toString().contains('#')
                            ? e.text.toString().replaceFirst(RegExp(r'#'), '')
                            : e.text.toString()),
                  );
                },
                style: {
                  "body": Style(
                    fontSize: FontSize(14.0),
                    textOverflow: TextOverflow.ellipsis,
                    color: lightblue,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Manrope',
                  ),
                  'a': Style(
                    color: orangePrimary,
                  )
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                netImage(widget.post['blog']['thumbnail']),
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
                              textOverflow: TextOverflow.ellipsis,
                              color: lightblue,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Manrope',
                              maxLines: 2),
                          'a': Style(
                            color: orangePrimary,
                          )
                        },
                      ),
                      Html(
                        data: widget.post['blog']['description'],
                        style: {
                          "body": Style(
                            fontSize: FontSize(14.0),
                            textOverflow: TextOverflow.ellipsis,
                            color: lightblue,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Manrope',
                          ),
                          'a': Style(
                            color: orangePrimary,
                          )
                        },
                      ),
                      Html(
                        data: widget.post['blog']['description']
                                    .toString()
                                    .length <
                                180
                            ? widget.post['blog']['description']
                            : isSeeMore
                                ? '${widget.post['blog']['description']}  <a href="#"><strong style="color:orange;font-size:13px;"><b>${seeMoreText}</b></strong></a>'
                                : '${widget.post['blog']['description'].toString().substring(0, 150)}  <a href="#"><strong style="color:orange;font-size:13px;"><b>${seeMoreText}</b></strong></a>',
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
                      )
                    ],
                  ),
                ),
                gap(h: 5),
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
