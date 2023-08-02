// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:path/path.dart' as p;

import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/post_constants.dart';
import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/screens/home/post_types/widgets/reaction_bar.dart';
import 'package:vibetag/screens/home/widgets/feelingWidet.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/home/post_types/post_file.dart';
import 'package:vibetag/screens/home/widgets/revibe.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/screens/video_player/chewie_video_player.dart';
import 'package:vibetag/screens/video_player/native_video_player.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';
import '../../../utils/constant.dart';
import '../../groups/group.dart';
import '../../hast_tag/tred_screen.dart';
import '../../page/playlists/playlist/playlist_sheet.dart';

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
  bool isAdded = false;
  bool isSeeMore = false;
  String seeMoreText = 'See more';
  String responseData = '';
  bool isLiked = false;

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
          gap(h: 7),
          Container(
            width: width,
            height: height * 0.07,
            margin: spacing(
              horizontal: 10,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      pushRoute(
                        context: context,
                        screen: widget.post['page_id'] != '0'
                            ? PageScreen(
                                page_id: widget.post['page_id'].toString())
                            : Profile(
                                user_id: widget.post['publisher']['user_id']
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
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          pushRoute(
                                            context: context,
                                            screen:
                                                widget.post['page_id'] != '0'
                                                    ? PageScreen(
                                                        page_id: widget
                                                            .post['page_id']
                                                            .toString())
                                                    : Profile(
                                                        user_id: widget
                                                            .post['publisher']
                                                                ['user_id']
                                                            .toString(),
                                                      ),
                                          );
                                        },
                                        child: Container(
                                          child: profileName(
                                            widget.post['publisher']['name'],
                                          ),
                                        )),
                                    gap(w: 5),
                                    widget.post['group_id'] != '0'
                                        ? postFeeling(
                                            width: width,
                                            feeling:
                                                widget.post['group_recipient']
                                                    ['group_title'],
                                            start: ' ',
                                            isGroup: true,
                                            onTap: () {
                                              pushRoute(
                                                context: context,
                                                screen: GroupScreen(
                                                  group_id:
                                                      widget.post['group_id'],
                                                ),
                                              );
                                            })
                                        : gap(),
                                    gap(
                                      w: 5,
                                    ),
                                  ],
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
                            Row(
                              children: [
                                widget.post['user_id'].toString() != loginUserId
                                    ? InkWell(
                                        onTap: () {
                                          followUnfollowLikeUnlikeJoinLeave(
                                            followLikeORJoin(post: widget.post),
                                          );

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
                                            followLikeORJoin(post: widget.post)[
                                                'button_text'],
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
                                      width: width * 0.3,
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
                                screen: widget.post['post_owner_data']
                                                ['page_id'] !=
                                            '0' &&
                                        widget.post['post_owner_data']
                                                ['page_id'] !=
                                            null
                                    ? PageScreen(
                                        page_id: widget.post['post_owner_data']
                                                ['page_id']
                                            .toString(),
                                      )
                                    : Profile(
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
                              InkWell(
                                onTap: () {
                                  pushRoute(
                                    context: context,
                                    screen: widget.post['post_owner_data']
                                                    ['page_id'] !=
                                                '0' &&
                                            widget.post['post_owner_data']
                                                    ['page_id'] !=
                                                null
                                        ? PageScreen(
                                            page_id: widget
                                                .post['post_owner_data']
                                                    ['page_id']
                                                .toString(),
                                          )
                                        : Profile(
                                            user_id: widget
                                                .post['post_owner_data']
                                                    ['user_id']
                                                .toString(),
                                          ),
                                  );
                                },
                                child: Container(
                                  width: width * 0.25,
                                  child: profileName(
                                    widget.post['post_owner_data']['name'],
                                  ),
                                ),
                              ),
                              gap(h: 5),
                              Row(
                                children: [
                                  Text(
                                    widget.post['post_owner_data']['time'] !=
                                            null
                                        ? readTimestamp(int.parse(widget
                                            .post['post_owner_data']['time']
                                            .toString()))
                                        : '',
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
                    ],
                  ),
                )
              : gap(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
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
                            ? e.text.toString().replaceFirst(RegExp(r'#'), '')
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
                        ? widget.post['Orginaltext'].toString().length % 60
                        : 3),
                'a': Style(
                  color: orangePrimary,
                )
              },
            ),
          ),
          widget.post['parent_id'] != '0'
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                  ),
                  child: Html(
                    data: widget.post['parent_post_data']['postText'],
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
                )
              : gap(),
          SizedBox(
            height: 10,
          ),
          widget.post['photo_album'].length > 0
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
                                Container(
                                  width: width - 8,
                                  child: Image.network(
                                    widget.post['photo_album'][i]['image'],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        child: Center(
                                          child: Icon(
                                            Icons.image,
                                            size: 48,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                widget.post['photo_album'].length > 1
                                    ? Positioned(
                                        right: 10,
                                        top: 10,
                                        child: Container(
                                          padding: spacing(
                                            horizontal: 7,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: borderRadius(2.5),
                                            color: const Color.fromARGB(
                                                54, 0, 0, 0),
                                          ),
                                          child: Text(
                                            '${i + 1}/${widget.post['photo_album'].length}',
                                            style: TextStyle(
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : gap()
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : gap(),
          widget.post['photo_multi'] != null
              ? Container(
                  width: width,
                  height: widget.post['photo_multi'].length < 3
                      ? height * 0.3
                      : height * 0.6,
                  child: GridView.builder(
                    itemCount: widget.post['photo_multi'].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.post['photo_multi'].length >= 4
                          ? 4
                          : widget.post['photo_multi'].length,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (context, i) {
                      if (i == 3) {
                        return Stack(
                          children: [
                            Image.network(
                              widget.post['photo_multi'][i]['image'],
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: Center(
                                child: Text(
                                    '+${(widget.post['photo_multi'].length - 4)}'),
                              ),
                            )
                          ],
                        );
                      }
                      return Image.network(
                        widget.post['photo_multi'][i]['image'],
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                )
              : postFile(
                  file: widget.post['postFile'],
                  thumbnail: widget.post['postFileThumb'].toString(),
                  post_id: widget.post['post_id'],
                  postFileName: widget.post['postFileName'],
                ),
          (widget.post['postSticker'].toString() != '' &&
                  widget.post['postSticker'].toString() != 'null')
              ? postFile(
                  file: widget.post['postSticker'],
                  thumbnail: widget.post['postFileThumb'].toString(),
                  post_id: widget.post['post_id'],
                )
              : gap(),
          PostReactionSections(
            post: widget.post,
          ),
          gap(h: 10),
        ],
      ),
    );
  }
}
