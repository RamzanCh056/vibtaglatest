// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibetag/screens/home/comment/widget/comment_item.dart';
import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/comment/widget/reply_comment_widget.dart';

import '../../../../methods/api.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_painter.dart';
import '../methods/comment_methods.dart';

class ReplyCommentBar extends StatefulWidget {
  final Map<String, dynamic> comment;
  const ReplyCommentBar({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  State<ReplyCommentBar> createState() => _ReplyCommentBarState();
}

class _ReplyCommentBarState extends State<ReplyCommentBar> {
  List<Widget> commentReplies = [];
  TextEditingController textController = TextEditingController();
  bool showSearchBar = false;
  bool showMedia = false;
  bool showSticker = false;
  String image = '';
  String stickerUrl = '';

  @override
  void initState() {
    super.initState();
    setReplies();
  }

  setReplies() {
    commentReplies = [];
    for (var reply in widget.comment['all_replies']) {
      commentReplies.add(ReplyComment(
        commentReply: reply,
        onTap: () {
          replyTo = '@${reply['publisher']['name']}';
          setState(() {});
        },
      ));
    }
  }

  loadSticker() async {
    final data = {
      'type': 'search_gifs_stickers',
      'sub_type': 'get_stickers',
      'keyword': textController.text,
    };
    final result = await API().postData(data);
    stickers = jsonDecode(result.body)['data'];
    setState(() {});
  }

  List<String> mediaText = [
    'Emoji',
    'Camera',
    'Gallery',
    'Gifts',
    'Sticker',
    'Location'
  ];
  List<String> mediaImage = [
    'assets/new/icons/commets_media/emoji.png',
    'assets/new/icons/commets_media/camera.png',
    'assets/new/icons/commets_media/gallery.png',
    'assets/new/icons/commets_media/gifs.png',
    'assets/new/icons/commets_media/stickers.png',
    'assets/new/icons/commets_media/location.png',
  ];

  selectImage() async {
    XFile? pickedImage = await pickImageCamera();
    if (pickedImage != null) {
      image = pickedImage.path;
    }
  }

  selectImageGallery() async {
    XFile? pickedImage = await pickImage();
    if (pickedImage != null) {
      image = pickedImage.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('+++++++++++++++++++++++++++++++++++++++++++++++');
    CommentMethods().getReactionsDetails(widget.comment['all_reactions']);
    if (replyTo.isNotEmpty) {
      textController.text = replyTo;
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height - 45,
            decoration: BoxDecoration(
              color: grayLight,
              boxShadow: lightShadow,
              borderRadius: radiusOnly(
                topLeft: 10,
                topRight: 10,
              ),
            ),
            child: SingleChildScrollView(
              physics: ScrollPhysics(
                parent: NeverScrollableScrollPhysics(),
              ),
              child: Column(
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
                        InkWell(
                          onTap: () {
                            pop(context);
                            PostComments(
                              context: context,
                              postId: comments[0]['post_id'].toString(),
                            );
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                        Text(
                          'Replies',
                          style: TextStyle(
                            color: blackPrimary,
                            fontSize: 18,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            pop(context);
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            child:
                                Image.asset('assets/icons/clear_comment.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CommentWidget(
                          comment: widget.comment,
                          showRepliesSection: false,
                        ),
                        gap(h: 10),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: grayMed,
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: commentReplies,
                          ),
                        ),
                        gap(h: height * 0.1)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          showMedia
              ? Positioned(
                  bottom: 70,
                  child: Container(
                    height: height * 0.35,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: RawMaterialButton(
                              elevation: 10,
                              onPressed: () {},
                              child: CustomPaint(
                                painter: TrianglePainter(
                                  strokeColor: Colors.white,
                                  strokeWidth: 10,
                                  paintingStyle: PaintingStyle.fill,
                                ),
                                child: Container(
                                  height: 50,
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.3,
                          margin: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                spreadRadius: 1,
                                blurRadius: 4,
                                color: Color.fromARGB(61, 0, 0, 0),
                              )
                            ],
                            color: white,
                            borderRadius: borderRadius(10),
                          ),
                          alignment: Alignment.center,
                          width: width * 0.95,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              childAspectRatio: 1,
                            ),
                            itemCount: 6,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  if (i == 1) {
                                    showMedia = false;
                                    setState(() {});
                                    selectImage();
                                  }
                                  if (i == 2) {
                                    showMedia = false;
                                    setState(() {});
                                    selectImageGallery();
                                  }
                                  if (i == 4) {
                                    showMedia = false;
                                    showSticker = true;
                                    setState(() {});
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.1,
                                      child: Image.asset(
                                        mediaImage[i],
                                      ),
                                    ),
                                    gap(h: 10),
                                    Text(
                                      mediaText[i],
                                      style: TextStyle(
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : gap(),
          showSticker
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * 0.35,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: RawMaterialButton(
                              elevation: 10,
                              onPressed: () {},
                              child: CustomPaint(
                                painter: TrianglePainter(
                                  strokeColor: Colors.white,
                                  strokeWidth: 10,
                                  paintingStyle: PaintingStyle.fill,
                                ),
                                child: Container(
                                  height: 50,
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.3,
                          margin: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                spreadRadius: 1,
                                blurRadius: 4,
                                color: Color.fromARGB(61, 0, 0, 0),
                              )
                            ],
                            color: white,
                            borderRadius: borderRadius(10),
                          ),
                          alignment: Alignment.center,
                          width: width * 0.95,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              childAspectRatio: 1,
                            ),
                            itemCount: stickers.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  showSticker = !showSticker;
                                  stickerUrl = stickers[i];
                                  textController.text = '';
                                  setState(() {});
                                },
                                child: Container(
                                  width: width * 0.1,
                                  child: Image.network(
                                    stickers[i],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : gap(),
          Positioned(
            bottom: 0,
            child: Container(
              padding: spacing(vertical: 10),
              width: width,
              height: height * 0.1,
              decoration: BoxDecoration(
                color: grayLight,
              ),
              child: Container(
                margin: spacing(
                  horizontal: 5,
                ),
                padding: spacing(
                  horizontal: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: borderRadius(width),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(width),
                          ),
                          child: TextFormField(
                            key: Key('comment_field'),
                            onChanged: (value) {
                              if (showSticker) {
                                loadSticker();
                              }
                              if (textController.text == '' &&
                                  replyTo.isNotEmpty) {
                                replyTo = '';
                              }
                            },
                            controller: textController,
                            decoration: const InputDecoration(
                              hintText: 'Type a comment',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 40),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          top: 0,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                showMedia = !showMedia;
                                FocusScope.of(context).unfocus();
                              });
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              child: showMedia
                                  ? Image.asset(
                                      'assets/icons/clear_comment_1.png')
                                  : Image.asset('assets/icons/show_popup.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        Timer(Duration(seconds: 1), () {
                          textController.text = '';
                          image = '';
                          stickerUrl = '';
                          comment_id = '';
                          replyTo = '';
                          setState(() {});
                        });
                        await CommentMethods().CommentReply(
                          image: image,
                          comment_id: comment_id.toString().isEmpty
                              ? widget.comment['id'].toString()
                              : comment_id,
                          stickerUrl: stickerUrl,
                          text: textController.text,
                        );
                        await CommentMethods().loadCommets(
                          postId: widget.comment['post_id'].toString(),
                        );
                        setState(() {});
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        child: Image.asset('assets/icons/send_comment_1.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
