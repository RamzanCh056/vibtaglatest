// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vibetag/screens/groups/group.dart';
import 'package:vibetag/screens/hast_tag/tred_screen.dart';
import 'package:vibetag/screens/home/post_constants.dart';
import 'package:vibetag/screens/home/post_types/post_file.dart';
import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/screens/home/post_types/widgets/reaction_bar.dart';
import 'package:vibetag/screens/home/widgets/feelingWidet.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

class AlbumDetailsScreen extends StatefulWidget {
  Map<String, dynamic> album;
  AlbumDetailsScreen({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  State<AlbumDetailsScreen> createState() => _AlbumDetailsScreenState();
}

class _AlbumDetailsScreenState extends State<AlbumDetailsScreen> {
  bool isSeeMore = false;
  String seeMoreText = 'See more';
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                              screen: widget.album['page_id'] != '0'
                                  ? PageScreen(
                                      page_id:
                                          widget.album['page_id'].toString())
                                  : Profile(
                                      user_id: widget.album['publisher']
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
                                  widget.album['publisher']['avatar'],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                pushRoute(
                                                  context: context,
                                                  screen: widget.album[
                                                              'page_id'] !=
                                                          '0'
                                                      ? PageScreen(
                                                          page_id: widget
                                                              .album['page_id']
                                                              .toString())
                                                      : Profile(
                                                          user_id: widget.album[
                                                                  'publisher']
                                                                  ['user_id']
                                                              .toString(),
                                                        ),
                                                );
                                              },
                                              child: Container(
                                                child: profileName(
                                                  widget.album['publisher']
                                                      ['name'],
                                                ),
                                              )),
                                          gap(w: 5),
                                          widget.album['group_id'] != '0'
                                              ? postFeeling(
                                                  width: width,
                                                  feeling: widget.album[
                                                          'group_recipient']
                                                      ['group_title'],
                                                  start: ' ',
                                                  isGroup: true,
                                                  onTap: () {
                                                    pushRoute(
                                                      context: context,
                                                      screen: GroupScreen(
                                                        group_id: widget
                                                            .album['group_id'],
                                                      ),
                                                    );
                                                  })
                                              : gap(),
                                          gap(
                                            w: 5,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          widget.album['photo_album'].length > 0
                                              ? postFeeling(
                                                  width: width,
                                                  feeling: 'created an Album',
                                                  start: '',
                                                )
                                              : gap(),
                                          Text(
                                            setName(
                                              widget.album['album_name'],
                                            ),
                                            style: TextStyle(
                                                color: blackPrimary,
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Manrope'),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      widget.album['user_id'].toString() !=
                                              loginUserId
                                          ? InkWell(
                                              onTap: () {
                                                followUnfollowLikeUnlikeJoinLeave(
                                                  followLikeORJoin(
                                                      post: widget.album),
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
                                                    color: isLiked
                                                        ? grayLight
                                                        : white,
                                                    borderRadius:
                                                        borderRadius(5),
                                                    border: Border.all(
                                                        width: isLiked ? 0 : 1,
                                                        color: grayMed)),
                                                child: Text(
                                                  followLikeORJoin(
                                                          post: widget.album)[
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
                                              post: widget.album,
                                              is_publisher: widget
                                                          .album['publisher']
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
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                widget.album['parent_id'] != '0'
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
                                      screen: widget.album['post_owner_data']
                                                      ['page_id'] !=
                                                  '0' &&
                                              widget.album['post_owner_data']
                                                      ['page_id'] !=
                                                  null
                                          ? PageScreen(
                                              page_id: widget
                                                  .album['post_owner_data']
                                                      ['page_id']
                                                  .toString(),
                                            )
                                          : Profile(
                                              user_id: widget
                                                  .album['post_owner_data']
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
                                          widget.album['post_owner_data']
                                              ['avatar'],
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
                                          screen: widget.album[
                                                              'post_owner_data']
                                                          ['page_id'] !=
                                                      '0' &&
                                                  widget.album[
                                                              'post_owner_data']
                                                          ['page_id'] !=
                                                      null
                                              ? PageScreen(
                                                  page_id: widget
                                                      .album['post_owner_data']
                                                          ['page_id']
                                                      .toString(),
                                                )
                                              : Profile(
                                                  user_id: widget
                                                      .album['post_owner_data']
                                                          ['user_id']
                                                      .toString(),
                                                ),
                                        );
                                      },
                                      child: Container(
                                        width: width * 0.25,
                                        child: profileName(
                                          widget.album['post_owner_data']
                                              ['name'],
                                        ),
                                      ),
                                    ),
                                    gap(h: 5),
                                    Row(
                                      children: [
                                        Text(
                                          widget.album['post_owner_data']
                                                      ['time'] !=
                                                  null
                                              ? readTimestamp(int.parse(widget
                                                  .album['post_owner_data']
                                                      ['time']
                                                  .toString()))
                                              : '',
                                          style: TextStyle(
                                            color: grayMed,
                                            fontSize: 10,
                                          ),
                                        ),
                                        widget.album['postMap'] != ''
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
                                                      '${widget.album['postMap']}',
                                                      style: TextStyle(
                                                          color: graySecondary,
                                                          fontSize: 12,
                                                          overflow: TextOverflow
                                                              .ellipsis),
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
                    data: widget.album['postText'].toString().length < 180
                        ? widget.album['postText']
                        : isSeeMore
                            ? '${widget.album['postText']}  <a href="#"><strong style="color:orange;font-size:13px;"><b>${seeMoreText}</b></strong></a>'
                            : '${widget.album['postText'].toString().substring(0, 150)}  <a href="#"><strong style="color:orange;font-size:13px;"><b>${seeMoreText}</b></strong></a>',
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
                              ? widget.album['Orginaltext'].toString().length %
                                  60
                              : 3),
                      'a': Style(
                        color: orangePrimary,
                      )
                    },
                  ),
                ),
                PostReactionSections(
                  post: widget.album,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.album['photo_album'].length,
              itemBuilder: (context, i) {
                return Container(
                  margin: spacing(vertical: 5),
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: lightShadow,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        child: Image.network(
                          widget.album['photo_album'][i]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      gap(h: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.05,
                                  height: width * 0.05,
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
                                    color: grayMed,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.05,
                                  height: width * 0.05,
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
                            onTap: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.05,
                                  height: width * 0.05,
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
                      gap(h: 10),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
