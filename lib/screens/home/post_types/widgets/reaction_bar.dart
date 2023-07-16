// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/home/widgets/revibe.dart';
import 'package:vibetag/screens/playlists/playlist/playlist_sheet.dart';

import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

class PostReactionSections extends StatefulWidget {
  final Map<String, dynamic> post;
  const PostReactionSections({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostReactionSections> createState() => _PostReactionSectionsState();
}

class _PostReactionSectionsState extends State<PostReactionSections> {
  bool isShowReactions = false;
  int totalLikes = 0;
  int reactionValue = 0;
  bool isAdded = false;
  int userLike = 0;
  bool isLiked = false;

  List<int> reactionOnPost = [];
  List<Widget> reactionsOnPostList = [];
  reactOnPost() async {
    setState(() {
      isAdded = false;
    });
    await PostMethods().reactOnPost(
      post_id: widget.post['post_id'],
      reactionValue: reactionValue.toString(),
    );
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
    int currentIcon = 0;
    for (var reaction in reactionOnPost) {
      reactionsOnPostList.add(Positioned(
        left: currentIcon * 22,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: white,
            borderRadius: borderRadius(width),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: borderRadius(width),
              child: Image.asset(
                reactions[reaction],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ));
      currentIcon++;
    }
  }

  @override
  Widget build(BuildContext context) {
    totalLikes =
        int.parse(widget.post['reaction']['count'].toString()) + userLike;
    String fileExtension = p.extension(widget.post['postFile']);
    bool isAudio = fileExtension == '.mp3' || fileExtension == '.wave';
    bool is_video = isVideo(ex: fileExtension);
    return Column(
      children: [
        Container(
          color: grayLight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: spaceOnly(left: 10),
                    decoration: BoxDecoration(
                      color: grayLight,
                      borderRadius: borderRadius(width),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 22 * reactionOnPost.length.toDouble(),
                      height: 25,
                      child: Stack(
                        children: reactionsOnPostList,
                      ),
                    ),
                  ),
                  Container(
                    padding: spacing(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        is_video || isAudio
                            ? InkWell(
                                onTap: () {
                                  createBottomModalSheet(
                                    context: context,
                                    screen: PlayListOption(
                                      music_id: widget.post['post_id'],
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/new/images/video_icons/playlist.png',
                                  color: grayMed,
                                ),
                              )
                            : gap(),
                        is_video || isAudio ? gap(w: 10) : gap(),
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
                            ? Image.asset(reactions[int.parse(widget
                                    .post['reaction']['type']
                                    .toString()) -
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
                            ? reactionsText[int.parse(widget.post['reaction']
                                        ['type']
                                    .toString()) -
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
                PostComments(
                  context: context,
                  postId: widget.post['post_id'],
                  totalComments:
                      int.parse(widget.post['post_comments'].toString()),
                );
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
                createBottomModalSheet(
                  context: context,
                  screen: Revibe(
                    post: widget.post,
                  ),
                );
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
      ],
    );
  }
}
