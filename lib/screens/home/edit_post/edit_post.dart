// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibetag/methods/api.dart';

import 'package:vibetag/screens/hast_tag/tred_screen.dart';
import 'package:vibetag/screens/home/create_post/post_audience.dart';
import 'package:vibetag/screens/home/create_post/post_category.dart';
import 'package:vibetag/screens/home/post_types/post_file.dart';
import 'package:vibetag/utils/constant.dart';

import '../../../widgets/bottom_modal_sheet_widget.dart';

class EditPost extends StatefulWidget {
  final Map<String, dynamic> post;
  const EditPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController textController = TextEditingController();
  bool isUpdating = false;
  List<XFile?> xFiles = [];
  List<String> paths = [];
  List<Uint8List> selectedImages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  void setData() {
    textController.text = widget.post['Orginaltext'];

  }

  bool _isShowColor = false;

  updatePicturePost() async {
    isUpdating = true;
    setState(() {});
    final data = {
      'type': 'update_post',
      'action': 'update_post',
      'user_id': loginUserId,
      'post_id': widget.post['id'].toString(),
      'show_on_buzzin': '1',
      'text': textController.text,
    };
    final response = await API()
        .multipleUploadRequest(xfiles: xFiles, fieldName: 'images[]', data: data);
    isUpdating = false;
    setState(() {});

    pop(context);
  }

  selectImages() async {
    xFiles = await pickMultipleImage();
    for (var path in xFiles) {
      paths.add(path!.path);
      selectedImages.add(await path.readAsBytes());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Container(
      width: width,
      height: height * 0.95,
      decoration: BoxDecoration(
        borderRadius: radiusOnly(topLeft: 7, topRight: 7),
        color: white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.06,
            width: width,
            alignment: Alignment.center,
            padding: spacing(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                gap(w: 20),
                Text(
                  'Edit Post',
                  style: TextStyle(
                    color: grayPrimary,
                    fontWeight: FontWeight.bold,
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
                    child: assetImage('assets/icons/clear_comment_1.png'),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: lightGrayNew,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  padding: spacing(horizontal: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: borderRadius(width),
                              child: netImage(
                                widget.post['publisher']['avatar'],
                              ),
                            ),
                          ),
                          gap(w: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.post['publisher']['name'],
                                style: TextStyle(
                                  color: blackPrimary,
                                  fontSize: 12,
                                ),
                              ),
                              gap(h: 3),
                              Text(
                                '@${widget.post['publisher']['username']}',
                                style: TextStyle(
                                  color: grayMed,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      gap(h: 10),
                      TextFormField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: grayPrimary,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          color: grayPrimary,
                        ),
                        maxLines: 4,
                      ),
                      gap(h: 10),
                    ],
                  ),
                ),
                selectedImages.length > 0
                    ? Container(
                        width: width,
                        height: height * 0.35,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: selectedImages.length,
                            itemBuilder: (context, i) {
                              return Center(
                                child: Container(
                                  width: width,
                                  child: Image.memory(
                                    selectedImages[i],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                      )
                    : InkWell(
                        onTap: () {
                          selectImages();
                        },
                        child: postFile(
                          file: widget.post['postFile'],
                          thumbnail: widget.post['postFileThumb'].toString(),
                          post_id: widget.post['post_id'],
                          disableTap: true,
                        ),
                      ),
                gap(h: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            pop(context);
                            createBottomModalSheet(
                              context: context,
                              screen: PostAudience(),
                            );
                            // print("id == ${privacyId}");
                          },
                          child: Container(
                            padding: spacing(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10,
                                  child: Image.asset(
                                    'assets/icons/lock.png',
                                  ),
                                ),
                                gap(w: 5),
                                Text(
                                  'Public',
                                  style: TextStyle(
                                    color: grayPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                gap(w: 10),
                                Container(
                                  width: 15,
                                  child: Image.asset(
                                    'assets/new/icons/livestream/arrow_down.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            pop(context);
                            createBottomModalSheet(
                              context: context,
                              screen: PostCategory(),
                            );
                          },
                          child: Container(
                            padding: spacing(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(
                                    color: grayPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                gap(w: 10),
                                Container(
                                  width: 15,
                                  child: Image.asset(
                                    'assets/new/icons/livestream/arrow_down.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: grayMed,
                            ),
                            borderRadius: borderRadius(10),
                          ),
                          child: Container(
                            width: 15,
                            child: Image.asset(
                              'assets/images/#.png',
                            ),
                          ),
                        ),
                        Container(
                          padding: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: grayMed,
                            ),
                            borderRadius: borderRadius(10),
                          ),
                          child: Container(
                            width: 15,
                            child: Image.asset(
                              'assets/new/icons/@.png',
                            ),
                          ),
                        ),
                        Container(
                          padding: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: grayMed,
                            ),
                            borderRadius: borderRadius(10),
                          ),
                          child: Container(
                            width: 15,
                            child: Image.asset(
                              'assets/images/emoji_face.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                gap(h: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width * 0.4,
                      padding: spacing(
                        horizontal: width * 0.05,
                        vertical: height * 0.02,
                      ),
                      margin: spacing(
                        horizontal: width * 0.025,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor('#F1F4FB'),
                        borderRadius: BorderRadius.circular(
                          width * 0.02,
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: grayPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    isUpdating
                        ? loadingSpinner()
                        : InkWell(
                            onTap: () {
                              updatePicturePost();
                            },
                            child: Container(
                              width: width * 0.4,
                              padding: spacing(
                                horizontal: width * 0.05,
                                vertical: height * 0.02,
                              ),
                              margin: spacing(
                                horizontal: width * 0.025,
                              ),
                              decoration: BoxDecoration(
                                gradient: gradient,
                                borderRadius: BorderRadius.circular(
                                  width * 0.02,
                                ),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
