// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vibetag/screens/hast_tag/tred_screen.dart';

import 'package:vibetag/screens/home/comment/widget/edit_comment.dart';
import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/comment/widget/reacted_users.dart';
import 'package:vibetag/screens/home/comment/widget/reply_comment_bar.dart';

import '../../../../utils/constant.dart';
import '../../../../widgets/bottom_modal_sheet_widget.dart';
import '../methods/comment_methods.dart';

class CommentWidget extends StatefulWidget {
  final Map<String, dynamic> comment;
  bool showRepliesSection;

  CommentWidget({
    Key? key,
    required this.comment,
    this.showRepliesSection = true,
  }) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  Map<String, dynamic> reactionData = {};
  bool showSticker = false;
  String reactionCommentId = '';
  bool showCommentOptions = false;

  int reactionBarId = 0;
  bool isShowReactions = false;
  bool showReplies = false;
  int reactionValue = 0;

  @override
  void initState() {
    super.initState();
    setReaction();
  }

  setReaction() {
    if (isReacted(widget.comment['all_reactions'])['is_reacted']) {
      reactionValue = isReacted(widget.comment['all_reactions'])['reaction'];
    } else {
      reactionValue = 0;
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    reactionData =
        CommentMethods().getReactionsDetails(widget.comment['all_reactions']);
    return Container(
      padding: spacing(
        horizontal: 7,
        vertical: 10,
      ),
      margin: spacing(
        horizontal: 5,
        vertical: 2.5,
      ),
      decoration: BoxDecoration(
        color: widget.showRepliesSection ? white : grayLight,
        borderRadius: borderRadius(5),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/new/images/border.png',
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                padding: spacing(
                                  horizontal: 2,
                                  vertical: 2,
                                ),
                                decoration: const BoxDecoration(),
                                child: Container(
                                  padding: spacing(
                                    horizontal: 3,
                                    vertical: 3,
                                  ),
                                  child: CircleAvatar(
                                    foregroundImage: NetworkImage(
                                        widget.comment['publisher']['avatar']),
                                    radius: width * 0.05,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        gap(w: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width * 0.75,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.comment['publisher']['name']}',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    readTimestamp(
                                        int.parse(widget.comment['time'])),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: grayMed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: width * 0.6,
                                          margin: spacing(vertical: 3),
                                          child: Html(
                                            data: widget.comment['text'],
                                            onAnchorTap: (str, map, e) {
                                              print(widget.comment['text']);
                                              pushRoute(
                                                context: context,
                                                screen: HashTrend(
                                                    hashTag: e!.text
                                                            .toString()
                                                            .contains('#')
                                                        ? e.text
                                                            .toString()
                                                            .replaceFirst(
                                                                RegExp(r'#'),
                                                                '')
                                                        : e.text.toString()),
                                              );
                                            },
                                            style: {
                                              "body": Style(
                                                fontSize: FontSize(12.0),
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                color: Colors.black54,
                                                maxLines: 3,
                                              ),
                                            },
                                          ),
                                        ),
                                        widget.comment['c_file'] != ''
                                            ? gap(h: 5)
                                            : gap(),
                                        widget.comment['c_file'] != ''
                                            ? Container(
                                                width: width * 0.6,
                                                margin: spacing(vertical: 3),
                                                child: Image.network(
                                                  widget.comment['c_file']
                                                          .toString()
                                                          .contains(serverUrl)
                                                      ? '${widget.comment['c_file']}'
                                                      : '${serverUrl}${widget.comment['c_file']}',
                                                ),
                                              )
                                            : gap(),
                                            gap(h: 7),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                  onLongPress: () {
                                                    setState(() {
                                                      isShowReactions =
                                                          !isShowReactions;
                                                      comment_id =
                                                          widget.comment['id'];
                                                    });
                                                  },
                                                  onTap: () async {
                                                    if (reactionValue != 0) {
                                                      reactionValue = 0;
                                                      setState(() {});

                                                      await CommentMethods()
                                                          .removeReaction(
                                                        widget.comment['id']
                                                            .toString(),
                                                      );
                                                      await CommentMethods()
                                                          .loadCommets(
                                                        postId: widget
                                                            .comment['post_id']
                                                            .toString(),
                                                      );
                                                      setState(() {});
                                                    } else {
                                                      reactionValue = 1;
                                                      setState(() {});
                                                      await CommentMethods()
                                                          .ReactOnComment(
                                                        comment_id: comment_id,
                                                        reaction: reactionValue,
                                                      );
                                                      await CommentMethods()
                                                          .loadCommets(
                                                        postId: widget
                                                            .comment['post_id']
                                                            .toString(),
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: spacing(
                                                      horizontal: 15,
                                                      vertical: 5,
                                                    ),
                                                    margin: spacing(
                                                      horizontal: 3,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: grayLight,
                                                      borderRadius:
                                                          borderRadius(width),
                                                    ),
                                                    child: reactionValue != 0
                                                        ? Row(
                                                            children: [
                                                              Container(
                                                                width: 15,
                                                                height: 15,
                                                                child:
                                                                    Image.asset(
                                                                  reactions[
                                                                      (reactionValue -
                                                                          1)],
                                                                ),
                                                              ),
                                                              gap(w: 7),
                                                              Text(
                                                                reactionsText[
                                                                    (reactionValue -
                                                                        1)],
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      grayPrimary,
                                                                  fontSize: 8,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : Text(
                                                            'React',
                                                            style: TextStyle(
                                                              color:
                                                                  grayPrimary,
                                                              fontSize: 8,
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    comment_id =
                                                        widget.comment['id'];
                                                    replyTo =
                                                        '@${widget.comment['publisher']['name']}';
                                                    pop(context);
                                                    createBottomModalSheet(
                                                      context: context,
                                                      screen: ReplyCommentBar(
                                                        comment: widget.comment,
                                                      ),
                                                    );
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    padding: spacing(
                                                      horizontal: 15,
                                                      vertical: 7,
                                                    ),
                                                    margin: spacing(
                                                      horizontal: 3,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: grayLight,
                                                      borderRadius:
                                                          borderRadius(width),
                                                    ),
                                                    child: Text(
                                                      'Reply',
                                                      style: TextStyle(
                                                        color: grayPrimary,
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            reactionData['counts'] == 0
                                                ? gap()
                                                : InkWell(
                                                    onTap: () {
                                                      createBottomModalSheet(
                                                        context: context,
                                                        screen: ReactedUsers(
                                                            users: widget
                                                                    .comment[
                                                                'all_reactions']),
                                                      );
                                                    },
                                                    child: Container(
                                                      padding: spacing(
                                                        horizontal: 10,
                                                        vertical: 7,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: grayLight,
                                                        borderRadius:
                                                            borderRadius(width),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 13,
                                                            width: (13 *
                                                                    reactionData[
                                                                            'emojis']
                                                                        .length)
                                                                .toDouble(),
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  reactionData[
                                                                          'emojis']
                                                                      .length,
                                                              itemBuilder:
                                                                  (context, i) {
                                                                return Container(
                                                                  margin:
                                                                      spacing(
                                                                    horizontal:
                                                                        1.5,
                                                                  ),
                                                                  width: 10,
                                                                  child: Image.asset(
                                                                      reactions[
                                                                          (reactionData['emojis'][i] -
                                                                              1)]),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          gap(w: 5),
                                                          Text(
                                                            reactionData[
                                                                    'counts']
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  grayPrimary,
                                                              fontSize: 8,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      child: isShowReactions
                                          ? InkWell(
                                              onTap: () async {
                                                isShowReactions =
                                                    !isShowReactions;
                                                reactionValue = 0;
                                                setState(() {});

                                                await CommentMethods()
                                                    .removeReaction(
                                                  widget.comment['id']
                                                      .toString(),
                                                );
                                                await CommentMethods()
                                                    .loadCommets(
                                                  postId: widget
                                                      .comment['post_id']
                                                      .toString(),
                                                );
                                                setState(() {});
                                              },
                                              child: Container(
                                                width: width * 0.45,
                                                height: width * 0.11,
                                                padding: spacing(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            56, 0, 0, 0),
                                                        offset: Offset.zero,
                                                        spreadRadius: 1,
                                                        blurRadius: 3,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        borderRadius(5)),
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: reactions.length,
                                                  itemBuilder: (context, i) {
                                                    return InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          isShowReactions =
                                                              !isShowReactions;
                                                          reactionBarId = 0;
                                                          reactionValue = i + 1;
                                                        });
                                                        await CommentMethods()
                                                            .ReactOnComment(
                                                          comment_id:
                                                              comment_id,
                                                          reaction:
                                                              reactionValue,
                                                        );
                                                        await CommentMethods()
                                                            .loadCommets(
                                                          postId: widget
                                                              .comment[
                                                                  'post_id']
                                                              .toString(),
                                                        );
                                                      },
                                                      child: Container(
                                                        width: width * 0.05,
                                                        height: width * 0.05,
                                                        child: Image.asset(
                                                            reactions[i]),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              gap(h: 10),
              widget.showRepliesSection
                  ? widget.comment['all_replies'].length > 0
                      ? InkWell(
                          onTap: () {
                            pop(context);

                            createBottomModalSheet(
                              context: context,
                              screen: ReplyCommentBar(
                                comment: widget.comment,
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.07,
                                height: 2,
                                color: grayMed,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${widget.comment['all_replies'].length} Reply',
                                style: TextStyle(
                                  color: grayPrimary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      : gap()
                  : gap(),
            ],
          ),
          Positioned(
            right: 10,
            child:
                widget.comment['publisher']['user_id'].toString() != loginUserId
                    ? gap()
                    : InkWell(
                        onTap: () {
                          showCommentOptions = !showCommentOptions;
                          setState(() {});
                        },
                        child: Container(
                          child: Image.asset(
                            'assets/new/icons/more_h.png',
                          ),
                        ),
                      ),
          ),
          showCommentOptions
              ? Positioned(
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      showCommentOptions = !showCommentOptions;
                      setState(() {});
                    },
                    child: Container(
                      padding: spacing(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Container(
                        padding: spacing(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow: lightShadow,
                        ),
                        child: Column(
                          children: [
                            gap(h: 5),
                            InkWell(
                              onTap: () {
                                showCommentOptions = !showCommentOptions;
                                setState(() {});
                                pop(context);
                                createBottomModalSheet(
                                  context: context,
                                  screen: EditComment(comment: widget.comment),
                                );
                              },
                              child: Container(
                                margin: spacing(vertical: 2),
                                decoration: BoxDecoration(
                                  color: grayLight,
                                  borderRadius: borderRadius(5),
                                ),
                                child: Text('Edit'),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                showCommentOptions = !showCommentOptions;
                                setState(() {});
                                await CommentMethods()
                                    .DeleteCommet(comment_id: comment_id);
                              },
                              child: Container(
                                margin: spacing(vertical: 2),
                                decoration: BoxDecoration(
                                  color: grayLight,
                                  borderRadius: borderRadius(15),
                                ),
                                child: Text('Delete'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : gap(),
        ],
      ),
    );
  }
}
