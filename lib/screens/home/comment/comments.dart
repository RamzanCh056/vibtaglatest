// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

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
  int totalComments;
  Comments({
    Key? key,
    required this.postId,
    this.totalComments = 10,
  }) : super(key: key);

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
  bool showGif = false;
  List<bool> showReplyComments = [];
  int reactionBarId = 0;
  String commentId = '';
  String reactionCommentId = '';
  String stickerUrl = '';
  TextEditingController textController = TextEditingController();
  List<Widget> commentsList = [];
  late Uint8List? selectedImage;
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
      await CommentMethods().loadCommets(
        postId: widget.postId,
        totalComments: widget.totalComments,
      );
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

  loadGif() async {
    final data = {
      'type': 'search_gifs_stickers',
      'sub_type': 'get_gifs',
      'keyword': textController.text,
    };
    final result = await API().postData(data);
    searchedGifs = jsonDecode(result.body)['data'];
    setState(() {});
  }

  List<String> mediaText = ['Camera', 'Gallery', 'Sticker', 'Gif'];
  List<String> mediaImage = [
    'assets/new/icons/commets_media/camera.png',
    'assets/new/icons/commets_media/gallery.png',
    'assets/new/icons/commets_media/stickers.png',
    'assets/new/icons/commets_media/gifs.png'
  ];

  selectImage() async {
    XFile? pickedImage = await pickImageCamera();
    if (pickedImage != null) {
      selectedImage = await pickedImage.readAsBytes();
      image = pickedImage.path;
    }
    setState(() {});
  }

  selectImageGallery() async {
    XFile? pickedImage = await pickImage();
    if (pickedImage != null) {
      selectedImage = await pickedImage.readAsBytes();
      image = pickedImage.path;
    }
    setState(() {});
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
                  Container(
                    height: (stickerUrl != '' || image != '')
                        ? height * 0.5
                        : height * 0.75,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: height * 0.75,
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
                                                paintingStyle:
                                                    PaintingStyle.fill,
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
                                              color:
                                                  Color.fromARGB(61, 0, 0, 0),
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
                                          itemCount: mediaImage.length,
                                          itemBuilder: (context, i) {
                                            return InkWell(
                                              onTap: () {
                                                if (i == 0) {
                                                  showMedia = false;
                                                  setState(() {});
                                                  selectImage();
                                                }
                                                if (i == 1) {
                                                  showMedia = false;
                                                  setState(() {});
                                                  selectImageGallery();
                                                }
                                                if (i == 2) {
                                                  showMedia = false;
                                                  showSticker = true;
                                                  setState(() {});
                                                }
                                                if (i == 3) {
                                                  showMedia = false;
                                                  showSticker = false;
                                                  showGif = true;
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
                                child: InkWell(
                                  onTap: () {
                                    showSticker = !showSticker;
                                    setState(() {});
                                  },
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
                                                  paintingStyle:
                                                      PaintingStyle.fill,
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
                                                color:
                                                    Color.fromARGB(61, 0, 0, 0),
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
                                ),
                              )
                            : gap(),
                        showGif
                            ? Positioned(
                                bottom: 0,
                                child: InkWell(
                                  onTap: () {
                                    showGif = !showGif;
                                    setState(() {});
                                  },
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
                                                  paintingStyle:
                                                      PaintingStyle.fill,
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
                                                color:
                                                    Color.fromARGB(61, 0, 0, 0),
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
                                            itemCount: searchedGifs.length,
                                            itemBuilder: (context, i) {
                                              return InkWell(
                                                onTap: () {
                                                  showGif = !showGif;
                                                  gifUrl = searchedGifs[i];
                                                
                                                  textController.text = '';
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: width * 0.1,
                                                  child: Image.network(
                                                    searchedGifs[i],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : gap(),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: grayLight,
                      boxShadow: boxShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /////////////////////////
                        (stickerUrl != '' || gifUrl != '' || image != '')
                            ? gap(h: 10)
                            : gap(),
                        Container(
                          width: width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                stickerUrl != ''
                                    ? Container(
                                        margin: spacing(horizontal: 10),
                                        height: height * 0.25,
                                        width: width * 0.5,
                                        decoration: BoxDecoration(
                                            color: grayLight,
                                            boxShadow: boxShadow,
                                            borderRadius: borderRadius(15)),
                                        child: ClipRRect(
                                          borderRadius: borderRadius(15),
                                          child: netImage(stickerUrl),
                                        ),
                                      )
                                    : gap(),
                                gifUrl != ''
                                    ? Container(
                                        margin: spacing(horizontal: 10),
                                        height: height * 0.25,
                                        width: width * 0.5,
                                        decoration: BoxDecoration(
                                            color: grayLight,
                                            boxShadow: boxShadow,
                                            borderRadius: borderRadius(15)),
                                        child: ClipRRect(
                                          borderRadius: borderRadius(15),
                                          child: netImage(gifUrl),
                                        ),
                                      )
                                    : gap(),
                                image != ''
                                    ? Container(
                                        margin: spacing(horizontal: 10),
                                        height: height * 0.25,
                                        width: width * 0.5,
                                        decoration: BoxDecoration(
                                            color: grayLight,
                                            boxShadow: boxShadow,
                                            borderRadius: borderRadius(15)),
                                        child: ClipRRect(
                                          borderRadius: borderRadius(15),
                                          child: Image.memory(
                                            selectedImage!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : gap(),
                              ],
                            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * 0.73,
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
                                        if (showGif) {
                                          loadGif();
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
                                        contentPadding:
                                            EdgeInsets.only(left: 40),
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
                                        gifUrl: gifUrl,
                                      );
                                      await CommentMethods().loadCommets(
                                        postId: widget.postId,
                                        loadAll: true,
                                        totalComments: comments.length + 10,
                                      );
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
                ],
              ),
            ),
    );
  }
}
