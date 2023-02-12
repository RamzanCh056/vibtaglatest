import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';

class Comments extends StatefulWidget {
  final String postId;
  const Comments({super.key, required this.postId});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  bool isLoadingComments = false;
  bool isLoading = false;
  bool showReply = false;
  bool isShowReactions = false;
  int reactionValue = 0;
  List<bool> showReplyComments = [];
  int reactionBarId = 0;
  String commentId = '';
  String reactionCommentId = '';
  String replyTo = '';
  TextEditingController textController = TextEditingController();
  List<dynamic> comments = [];
  @override
  void initState() {
    super.initState();
    loadCommets();
  }

  loadCommets() async {
    print(widget.postId);
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'comments',
      'sub_type': 'fetch_comments',
      'post_id': widget.postId.toString(),
      'limit': '10',
      'offset': '0'
    };
    final result = await API().postData(data);
    comments = jsonDecode(result.body)['data'];
    setState(() {
      isLoading = false;
    });
  }

  Future AddComment() async {
    final data = {
      'type': 'comment_add',
      'post_id': widget.postId,
      'image': '',
      'audio': '',
      'image_url': '',
      'text': textController.text,
      'user_id': loginUserId.toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body);
    loadCommets();
    textController.text = '';
  }

  Future CommentReply() async {
    final data = {
      'type': 'comment_reply_add',
      'comment_id': commentId.toString(),
      'image': '',
      'audio': '',
      'image_url': '',
      'text': textController.text,
      'user_id': loginUserId.toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body);
    loadCommets();
    textController.text = '';
  }

  Future DeleteCommet(
      {required String CommentId, required String postId}) async {
    final data = {
      'type': 'comment_delete',
      'comment_id': CommentId.toString(),
      'user_id': loginUserId.toString(),
    };
    final commentData = await API().postData(data);
    loadCommets();
  }

  Future ReactOnComment() async {
    final data = {
      'type': 'react_comment',
      'comment_id': reactionCommentId.toString(),
      'user_id': loginUserId.toString(),
      'reaction': reactionValue.toString(),
    };
    final result = await API().postData(data);
    print(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: isLoading
          ? loadingSpinner()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: spacing(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    width: double.maxFinite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(
                            color: blackPrimary,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${getInK(number: comments.length)} Comments',
                          style: TextStyle(
                            color: grayMed,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    color: grayMed,
                    width: double.maxFinite,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: spacing(horizontal: 15),
                    height: height * 0.74,
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, i) {
                        if (showReplyComments.length == 0 &&
                            comments.length > 0) {
                          for (var k = 0; k < comments.length; k++) {
                            showReplyComments.add(false);
                          }
                        }
                        return Column(
                          children: [
                            Row(
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
                                                comments[i]['publisher']
                                                    ['avatar']),
                                            radius: width * 0.05,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.7,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${comments[i]['publisher']['first_name']} ${comments[i]['publisher']['last_name']}',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    readTimestamp(int.parse(
                                                        comments[i]['time'])),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: grayMed,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              comments[i]['publisher']
                                                              ['user_id']
                                                          .toString() !=
                                                      loginUserId
                                                  ? gap()
                                                  : InkWell(
                                                      onTap: () {
                                                        CommentOptions(
                                                          context: context,
                                                          commentId: comments[i]
                                                                  ['id']
                                                              .toString(),
                                                          postId: widget.postId
                                                              .toString(),
                                                        );
                                                      },
                                                      child: Container(
                                                        child: Image.asset(
                                                          'assets/new/icons/more_h.png',
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.6,
                                          margin: spacing(vertical: 3),
                                          child: Text(
                                            '${comments[i]['text']}',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: blackLight,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isShowReactions =
                                                          !isShowReactions;
                                                      reactionCommentId =
                                                          comments[i]['id'];
                                                      reactionBarId = int.parse(
                                                          comments[i]['id']
                                                              .toString());
                                                    });
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
                                                    child: Text(
                                                      'React',
                                                      style: TextStyle(
                                                        color: grayPrimary,
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    commentId =
                                                        comments[i]['id'];
                                                    replyTo =
                                                        '${comments[i]['publisher']['first_name']} ${comments[i]['publisher']['last_name']} ';
                                                    textController.text =
                                                        replyTo;
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
                                            Container(
                                              padding: spacing(
                                                horizontal: 10,
                                                vertical: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: grayLight,
                                                borderRadius:
                                                    borderRadius(width),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    child: Image.asset(
                                                        'assets/new/icons/heavy_smil.png'),
                                                  ),
                                                  Container(
                                                    width: 10,
                                                    child: Image.asset(
                                                        'assets/new/icons/small_heart.png'),
                                                  ),
                                                  gap(w: 5),
                                                  Text(
                                                    '23',
                                                    style: TextStyle(
                                                      color: grayPrimary,
                                                      fontSize: 8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      child: reactionBarId.toString() ==
                                              comments[i]['id'].toString()
                                          ? Container(
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
                                                      await ReactOnComment();
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
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            comments[i]['all_replies'].length > 0
                                ? Container(
                                    margin: spacing(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
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
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              showReplyComments[i] =
                                                  !showReplyComments[i];
                                            });
                                          },
                                          child: Text(
                                            '${comments[i]['all_replies'].length} Reply',
                                            style: TextStyle(
                                              color: grayPrimary,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : gap(),
                            comments[i]['all_replies'].length > 0
                                ? showReplyComments[i]
                                    ? Container(
                                        width: double.maxFinite,
                                        padding: spacing(horizontal: 15),
                                        height: height *
                                            0.1 *
                                            comments[i]['all_replies'].length,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              comments[i]['all_replies'].length,
                                          itemBuilder: (context, j) {
                                            return Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            margin: spacing(
                                                              vertical: 10,
                                                            ),
                                                            width: width * 0.05,
                                                            height:
                                                                width * 0.04,
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/new/svg/Arrow.svg',
                                                              fit: BoxFit.cover,
                                                              height:
                                                                  width * 0.04,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                'assets/new/images/border.png',
                                                              ),
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    spacing(
                                                                  horizontal: 2,
                                                                  vertical: 2,
                                                                ),
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      spacing(
                                                                    horizontal:
                                                                        3,
                                                                    vertical: 3,
                                                                  ),
                                                                  child:
                                                                      CircleAvatar(
                                                                    foregroundImage:
                                                                        NetworkImage(comments[i]['all_replies'][j]['publisher']
                                                                            [
                                                                            'avatar']),
                                                                    radius:
                                                                        width *
                                                                            0.05,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  width * 0.6,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        '${comments[i]['all_replies'][j]['publisher']['first_name']} ${comments[i]['all_replies'][j]['publisher']['last_name']}',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                        readTimestamp(int.parse(comments[i]['all_replies'][j]
                                                                            [
                                                                            'time'])),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              grayMed,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  comments[i]['all_replies'][j]['publisher']['user_id']
                                                                              .toString() !=
                                                                          loginUserId
                                                                      ? gap()
                                                                      : InkWell(
                                                                          onTap:
                                                                              () {
                                                                            CommentOptions(
                                                                              context: context,
                                                                              commentId: comments[i]['all_replies'][j]['id'].toString(),
                                                                              postId: widget.postId.toString(),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/new/icons/more_h.png',
                                                                            ),
                                                                          ),
                                                                        )
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  width * 0.55,
                                                              margin: spacing(
                                                                  vertical: 3),
                                                              child: Text(
                                                                '${comments[i]['all_replies'][j]['text']}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color:
                                                                      blackLight,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .clip,
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          isShowReactions =
                                                                              !isShowReactions;
                                                                          reactionCommentId =
                                                                              comments[i]['all_replies'][j]['id'];
                                                                          reactionBarId =
                                                                              int.parse(comments[i]['all_replies'][j]['id'].toString());
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            spacing(
                                                                          horizontal:
                                                                              15,
                                                                          vertical:
                                                                              5,
                                                                        ),
                                                                        margin:
                                                                            spacing(
                                                                          horizontal:
                                                                              3,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              grayLight,
                                                                          borderRadius:
                                                                              borderRadius(width),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'React',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                grayPrimary,
                                                                            fontSize:
                                                                                8,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                          spacing(
                                                                        horizontal:
                                                                            15,
                                                                        vertical:
                                                                            5,
                                                                      ),
                                                                      margin:
                                                                          spacing(
                                                                        horizontal:
                                                                            3,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            grayLight,
                                                                        borderRadius:
                                                                            borderRadius(width),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Reply',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              grayPrimary,
                                                                          fontSize:
                                                                              8,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      spacing(
                                                                    horizontal:
                                                                        10,
                                                                    vertical: 5,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        grayLight,
                                                                    borderRadius:
                                                                        borderRadius(
                                                                            width),
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
                                                                        width:
                                                                            10,
                                                                        child: Image.asset(
                                                                            'assets/new/icons/heavy_smil.png'),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            10,
                                                                        child: Image.asset(
                                                                            'assets/new/icons/small_heart.png'),
                                                                      ),
                                                                      gap(w: 5),
                                                                      Text(
                                                                        '23',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              grayPrimary,
                                                                          fontSize:
                                                                              8,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Positioned(
                                                          bottom: 5,
                                                          child: reactionBarId
                                                                      .toString() ==
                                                                  comments[i]['all_replies']
                                                                              [
                                                                              j]
                                                                          ['id']
                                                                      .toString()
                                                              ? Container(
                                                                  width: width *
                                                                      0.45,
                                                                  height:
                                                                      width *
                                                                          0.11,
                                                                  padding:
                                                                      spacing(
                                                                    horizontal:
                                                                        10,
                                                                    vertical: 5,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color:
                                                                              white,
                                                                          boxShadow: const [
                                                                            BoxShadow(
                                                                              color: Color.fromARGB(56, 0, 0, 0),
                                                                              offset: Offset.zero,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 3,
                                                                            ),
                                                                          ],
                                                                          borderRadius:
                                                                              borderRadius(5)),
                                                                  child: ListView
                                                                      .builder(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    itemCount:
                                                                        reactions
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            i) {
                                                                      return InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            isShowReactions =
                                                                                !isShowReactions;
                                                                            reactionBarId =
                                                                                0;
                                                                            reactionValue =
                                                                                i + 1;
                                                                          });
                                                                          await ReactOnComment();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              width * 0.05,
                                                                          height:
                                                                              width * 0.05,
                                                                          child:
                                                                              Image.asset(reactions[i]),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                gap(h: 13)
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    : gap()
                                : gap(),
                            comments[i]['all_replies'].length == 0
                                ? gap(h: 15)
                                : gap()
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: spacing(
                      horizontal: width * 0.05,
                      vertical: 15,
                    ),
                    padding: spacing(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: grayLight,
                      borderRadius: borderRadius(width),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.75,
                              child: TextFormField(
                                controller: textController,
                                decoration: const InputDecoration(
                                  hintText: 'Type a comment',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (commentId.isNotEmpty) {
                                  await CommentReply();
                                }
                                await AddComment();
                              },
                              child: Container(
                                padding: spacing(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: orangePrimary,
                                  borderRadius: borderRadius(width),
                                ),
                                child: Icon(
                                  Icons.send,
                                  color: whitePrimary,
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          right: 40,
                          bottom: 0,
                          top: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            child: SvgPicture.asset('assets/svg/chat/plus.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  CommentOptions(
      {required BuildContext context,
      required String postId,
      required String? commentId}) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    bool isLoading = false;
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            iconPadding: EdgeInsets.zero,
            content: Container(
              decoration: BoxDecoration(
                color: whitePrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: spacing(vertical: 2),
                      padding: spacing(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: grayLight,
                        borderRadius: borderRadius(15),
                      ),
                      child: Text('Edit'),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() => {
                              isLoading = true,
                            });
                        await DeleteCommet(
                          CommentId: commentId!,
                          postId: postId,
                        );
                        setState(() => {
                              isLoading = false,
                            });

                        Navigator.of(context).pop();
                      },
                      child: isLoading
                          ? loadingSpinner()
                          : Container(
                              margin: spacing(vertical: 2),
                              padding: spacing(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: grayLight,
                                borderRadius: borderRadius(15),
                              ),
                              child: Text('Delete'),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
