import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibetag/screens/home/comment/widget/comment_item.dart';

import '../../../methods/api.dart';
import '../../../utils/constant.dart';
import '../../../widgets/bottom_bar.dart';
import '../../../widgets/custom_painter.dart';
import 'methods/comment_methods.dart';

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
  bool showMedia = false;
  bool showSticker = false;
  List<bool> showReplyComments = [];
  int reactionBarId = 0;
  String commentId = '';
  String reactionCommentId = '';
  String stickerUrl = '';
  TextEditingController textController = TextEditingController();
  List<Widget> commentsList = [];
  String image = '';
  @override
  void initState() {
    super.initState();
    getComments(shouldLoad: true);
  }

  getComments({bool shouldLoad = false}) async {
    if (comments.length > 0) {
      if (comments[0]['post_id'].toString() == widget.postId.toString()) {
      } else {
        comments = [];
      }
    }
    if (shouldLoad) {
      setState(() {
        isLoading = true;
      });
    }
    if (comments.length == 0) {
      await CommentMethods().loadCommets(postId: widget.postId);
    }

    setState(() {
      isLoading = false;
    });
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
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    print(widget.postId);

    if (replyTo.isNotEmpty) {
      textController.text = replyTo;
    }

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
                  Stack(
                    children: [
                      Container(
                        height: height * 0.7,
                        child: SingleChildScrollView(
                          child: Column(
                            children: CommentMethods().setComments(),
                          ),
                        ),
                      ),
                      showMedia
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                    ],
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
                                await CommentMethods().AddComment(
                                  image: image,
                                  post_id: widget.postId,
                                  stickerUrl: stickerUrl,
                                  text: textController.text,
                                );
                                await CommentMethods()
                                    .loadCommets(postId: widget.postId);
                                setState(() {});
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                child: Image.asset(
                                    'assets/icons/send_comment_1.png'),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          top: 0,
                          child: InkWell(
                            onTap: () {
                              textController.text = '';
                              reactionCommentId = '';
                              replyTo = '';
                            },
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
                                    : Image.asset(
                                        'assets/icons/show_popup.png'),
                              ),
                            ),
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
}