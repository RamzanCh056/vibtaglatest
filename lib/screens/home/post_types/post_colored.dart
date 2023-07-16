// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/post_constants.dart';

import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/screens/home/post_types/widgets/reaction_bar.dart';
import 'package:vibetag/screens/home/widgets/revibe.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

import '../../../utils/constant.dart';
import '../../hast_tag/tred_screen.dart';
import '../../profile/profile.dart';

class ColoredPost extends StatefulWidget {
  final dynamic post;

  ColoredPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<ColoredPost> createState() => _ColoredPostState();
}

class _ColoredPostState extends State<ColoredPost> {
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
    final result = await API().postData(data);
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
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
                                    child: profileName(
                                      widget.post['publisher']['name'],
                                    ),
                                  ),
                                  gap(
                                    w: 5,
                                  ),
                                  widget.post['postFeeling'] != ''
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
                                              'is feeling ${widget.post['postFeeling']}',
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
                        Row(
                          children: [
                            postTime(widget.post['post_time']),
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
              ],
            ),
          ),
          Container(
            height: height * 0.3,
            width: width,
            decoration: widget.post['color_post_info']['image'] != ''
                ? BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${serverUrl}${widget.post['color_post_info']['image']}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  )
                : BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        HexColor(
                            '${widget.post['color_post_info']['color_1']}'),
                        HexColor('${widget.post['color_post_info']['color_2']}')
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
                      data: widget.post['postText'].toString().length < 90
                          ? widget.post['postText']
                          : isSeeMore
                              ? '${widget.post['postText']}  <a href="#"><strong style="color:${widget.post['color_post_info']['text_color']};"><b>${seeMoreText}</b></strong></a>'
                              : '${widget.post['postText'].toString().substring(0, 70)}  <a href="#"><strong style="color:${widget.post['color_post_info']['text_color']};"><b>${seeMoreText}</b></strong></a>',
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
                            fontSize: FontSize(24.0),
                            textOverflow: TextOverflow.ellipsis,
                            color: HexColor(
                                '${widget.post['color_post_info']['text_color']}'),
                            fontWeight: FontWeight.w900,
                            fontFamily: 'HelveticaNeueLTStd',
                            maxLines: isSeeMore
                                ? widget.post['Orginaltext'].toString().length %
                                    60
                                : 3),
                        'a': Style(
                          color: HexColor(
                              '${widget.post['color_post_info']['text_color']}'),
                        )
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          gap(h: 10),
          PostReactionSections(
            post: widget.post,
          ),
          gap(h: 10),
        ],
      ),
    );
  }
}
