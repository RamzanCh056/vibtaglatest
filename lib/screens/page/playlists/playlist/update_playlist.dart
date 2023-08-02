// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/methods/api.dart';

import '../../../../utils/constant.dart';
import '../../../shop/drop_down_list.dart';

class UpdatePlaylist extends StatefulWidget {
  final Map<String, dynamic> playlist;
  const UpdatePlaylist({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  State<UpdatePlaylist> createState() => _UpdatePlaylistState();
}

class _UpdatePlaylistState extends State<UpdatePlaylist> {
  bool private = false;
  TextEditingController category = TextEditingController();
  TextEditingController playlistTitle = TextEditingController();
  bool isLoading = false;
  bool updatingPlaylist = false;
  bool showtheme = false;
  bool showCategoryOptions = false;
  bool showVisibiliyOptions = false;
  bool isImageSelected = false;
  String selectedColor = '#FF9200';
  String selectedCategory = 'Select';
  late String file = '';
  late Uint8List? selectedImage;
  void selectImage() async {
    final image = await pickImage();
    if (image != null) {
      selectedImage = await image.readAsBytes();
      ToastMessage(message: 'Image selected successfully');
      file = image.path;
      setState(() {
        isImageSelected = true;
      });
    }
  }

  updateCurrentPlayList() async {
    setState(() {
      updatingPlaylist = true;
    });
    final data = {
      'type': 'playlist_api',
      'action': 'update_playist',
      'user_id': loginUserId.toString(),
      'private': private ? '0' : '1',
      'playlist': playlistTitle.text.toString(),
      'background': selectedColor.toString(),
      'category':
          playlistCategories.indexOf(category.text.toString()).toString(),
      'pid': '${widget.playlist['p_id']}'
    };

    final result = await API().MultiPartRequest(
      path: file,
      data: data,
      fileName: 'cover',
    );
    print(result);
    if (mounted) {
      setState(() {
        updatingPlaylist = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    selectedColor = widget.playlist['background'].toString();
    playlistTitle.text = widget.playlist['name'].toString();
    // if (int.parse(widget.playlist['cat'].toString()) > 0) {
    //   selectedCategory =
    //       playlistCategories[(int.parse(widget.playlist['cat'].toString()) + 1)]
    //           .toString();
    // }

    private = widget.playlist['private'].toString() == '0' ? true : false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.8,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              if (showtheme) {
                setState(() {
                  showtheme = false;
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                boxShadow: boxShadow,
              ),
              height: height * 0.8,
              child: SingleChildScrollView(
                child: Container(
                  margin: spacing(horizontal: 10),
                  child: Column(
                    children: [
                      gap(h: 15),
                      Container(
                        padding: spacing(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/new/images/back.png',
                              color: blackPrimary,
                            ),
                            Text(
                              'Edit Playlist',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: blackPrimary,
                              ),
                            ),
                            gap()
                          ],
                        ),
                      ),
                      gap(h: 15),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: grayMed,
                      ),
                      gap(h: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cover Image',
                                style: TextStyle(
                                  color: blackPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              gap(h: 5),
                              Text(
                                'Recommended Ratio of 12:9.',
                                style: TextStyle(
                                  color: grayMed,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: grayLight,
                              borderRadius: borderRadius(40),
                            ),
                            child: DottedBorder(
                              strokeWidth: 2,
                              dashPattern: [8, 1],
                              borderType: BorderType.RRect,
                              color: grayPrimary,
                              radius: Radius.circular(40),
                              child: Container(
                                padding: spacing(horizontal: 15, vertical: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.05,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/svg/upload_photo.svg',
                                          width: width * 0.05,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    gap(w: 10),
                                    Text(
                                      'Upload',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      gap(h: 15),
                      InkWell(
                        onTap: () {
                          selectImage();
                        },
                        child: Container(
                          child: isImageSelected
                              ? Container(
                                  width: double.maxFinite,
                                  height: height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(10),
                                  ),
                                  child: ClipRRect(
                                    child: Image.memory(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.maxFinite,
                                  height: height * 0.15,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        getFullLink(
                                          widget.playlist['cover'].toString(),
                                        ),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: borderRadius(10),
                                  ),
                                ),
                        ),
                      ),
                      gap(h: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(
                              color: blackPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          gap(h: 5),
                          Container(
                            height: height * 0.055,
                            child: TextFormField(
                              controller: playlistTitle,
                              decoration: InputDecoration(
                                hintText: 'Playlist Name...',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: grayMed,
                                  ),
                                  borderRadius: borderRadius(7),
                                ),
                                contentPadding: EdgeInsets.only(
                                  bottom: 0,
                                  top: 0,
                                  left: 15,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: grayMed,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 12,
                                color: grayMed,
                              ),
                            ),
                          ),
                        ],
                      ),
                      gap(h: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visibility',
                            style: TextStyle(
                              color: blackPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          gap(h: 5),
                          InkWell(
                            onTap: () {
                              showVisibiliyOptions = !showVisibiliyOptions;
                              setState(() {});
                            },
                            child: Container(
                              height: height * 0.055,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: grayMed,
                                  ),
                                  borderRadius: borderRadius(7),
                                ),
                                padding: spacing(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                            'assets/new/icons/lock.png'),
                                        gap(w: 10),
                                        Container(
                                          width: 5,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: grayMed,
                                            borderRadius: borderRadius(width),
                                          ),
                                        ),
                                        gap(w: 10),
                                        Text(
                                          'Private',
                                          style: TextStyle(
                                            color: grayMed,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                        'assets/new/icons/livestream/arrow_down.png'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      gap(h: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                              color: blackPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          gap(h: 5),
                          InkWell(
                            onTap: () {
                              showCategoryOptions = !showCategoryOptions;
                              setState(() {});
                            },
                            child: Container(
                              height: height * 0.055,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: grayMed,
                                  ),
                                  borderRadius: borderRadius(7),
                                ),
                                padding: spacing(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Funny Videos',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/new/icons/livestream/arrow_down.png'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      gap(h: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                              color: blackPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          gap(h: 5),
                          InkWell(
                            onTap: () {
                              showCategoryOptions = !showCategoryOptions;
                              setState(() {});
                            },
                            child: Container(
                              height: height * 0.055,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: grayMed,
                                  ),
                                  borderRadius: borderRadius(7),
                                ),
                                padding: spacing(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Blue',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Image.asset(
                                        'assets/new/icons/livestream/arrow_down.png'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      gap(h: 30),
                      Container(
                        margin: spacing(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      showtheme = !showtheme;
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: HexColor(selectedColor),
                                      borderRadius: borderRadius(width),
                                    ),
                                  ),
                                ),
                                gap(w: 15),
                                InkWell(
                                  onTap: () {
                                    private = !private;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 30,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        private
                                            ? Container(
                                                alignment: Alignment.center,
                                                child: Center(
                                                  child: Icon(
                                                    Icons.check_box,
                                                    color: orange,
                                                    size: 26,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                child: Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: grayMed,
                                                  size: 26,
                                                ),
                                              ),
                                        gap(w: 10),
                                        Text(
                                          'Private?',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: grayMed,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            updatingPlaylist
                                ? loadingSpinner()
                                : InkWell(
                                    onTap: () {
                                      updateCurrentPlayList();
                                    },
                                    child: Container(
                                      padding:
                                          spacing(horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                        gradient: gradient,
                                        borderRadius: borderRadius(5),
                                      ),
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          showVisibiliyOptions
              ? Positioned(
                  child: InkWell(
                    onTap: () {
                      showVisibiliyOptions = !showVisibiliyOptions;
                      setState(() {});
                    },
                    child: Center(
                      child: Container(
                        height: height * 0.4,
                        margin: spacing(
                          horizontal: 25,
                          vertical: 25,
                        ),
                        padding: spacing(
                          horizontal: 15,
                          vertical: 25,
                        ),
                        decoration: BoxDecoration(
                          color: grayLight,
                          borderRadius: borderRadius(15),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  'Select Visibiliy',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              gap(h: 25),
                              Container(
                                decoration: BoxDecoration(
                                  color: white,
                                  boxShadow: lightShadow,
                                  borderRadius: borderRadius(7),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: width * 0.8,
                                      height: height * 0.055,
                                      child: Container(
                                        padding: spacing(horizontal: 12),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/new/icons/lock.png',
                                              color: grayPrimary,
                                            ),
                                            gap(w: 10),
                                            Container(
                                              width: 5,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                color: grayMed,
                                                borderRadius:
                                                    borderRadius(width),
                                              ),
                                            ),
                                            gap(w: 10),
                                            Text(
                                              'Private',
                                              style: TextStyle(
                                                color: grayPrimary,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.8,
                                      height: 2,
                                      color: grayPrimary,
                                    )
                                  ],
                                ),
                              ),
                              gap(h: 7),
                              Container(
                                decoration: BoxDecoration(
                                  color: white,
                                  boxShadow: lightShadow,
                                  borderRadius: borderRadius(7),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: width * 0.8,
                                      height: height * 0.055,
                                      child: Container(
                                        padding: spacing(horizontal: 12),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/eye.png',
                                              color: grayPrimary,
                                            ),
                                            gap(w: 10),
                                            Container(
                                              width: 5,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                color: grayMed,
                                                borderRadius:
                                                    borderRadius(width),
                                              ),
                                            ),
                                            gap(w: 10),
                                            Text(
                                              'Public',
                                              style: TextStyle(
                                                color: grayPrimary,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.8,
                                      height: 2,
                                      color: grayPrimary,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : gap(),
          showCategoryOptions
              ? Positioned(
                  child: InkWell(
                    onTap: () {
                      showCategoryOptions = !showCategoryOptions;
                      setState(() {});
                    },
                    child: Center(
                      child: Container(
                        height: height * 0.7,
                        margin: spacing(
                          horizontal: 25,
                          vertical: 25,
                        ),
                        padding: spacing(
                          horizontal: 15,
                          vertical: 25,
                        ),
                        decoration: BoxDecoration(
                          color: grayLight,
                          borderRadius: borderRadius(15),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  'Select Category',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              gap(h: 25),
                              Container(
                                width: double.infinity,
                                height: height * 0.6,
                                child: ListView.builder(
                                    itemCount: playlistCategories.length,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        margin: spacing(vertical: 5),
                                        decoration: BoxDecoration(
                                          color: white,
                                          boxShadow: lightShadow,
                                          borderRadius: borderRadius(7),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: width * 0.8,
                                              height: height * 0.055,
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                padding:
                                                    spacing(horizontal: 12),
                                                child: Text(
                                                  playlistCategories[i],
                                                  style: TextStyle(
                                                    color: grayPrimary,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: width * 0.8,
                                              height: 2,
                                              color: grayPrimary,
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              gap(h: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : gap(),
          showtheme
              ? Positioned(
                  child: Container(
                    height: height * 0.5,
                    margin: spacing(
                      horizontal: 25,
                      vertical: 25,
                    ),
                    padding: spacing(
                      horizontal: 15,
                      vertical: 25,
                    ),
                    decoration: BoxDecoration(
                      color: grayLight,
                      borderRadius: borderRadius(15),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                            height: height * 0.4,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                childAspectRatio: 1,
                              ),
                              itemCount: playlistColors.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    selectedColor = playlistColors[i];
                                    showtheme = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    margin: spacing(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: HexColor(playlistColors[i]),
                                      borderRadius: borderRadius(width),
                                      border: Border.all(
                                        width: 5,
                                        color: white,
                                      ),
                                      boxShadow: boxShadow,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          gap(h: 15),
                          Text(
                            'Set Theme Color',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
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
