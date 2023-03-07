// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/methods/api.dart';

import '../../../utils/constant.dart';
import '../../shop/drop_down_list.dart';

class CreatePlaylist extends StatefulWidget {
  final String music_id;
  const CreatePlaylist({
    Key? key,
    required this.music_id,
  }) : super(key: key);

  @override
  State<CreatePlaylist> createState() => _CreatePlaylistState();
}

class _CreatePlaylistState extends State<CreatePlaylist> {
  bool private = false;
  TextEditingController category = TextEditingController();
  TextEditingController playlistTitle = TextEditingController();
  bool isLoading = false;
  bool creatingPlaylist = false;
  bool showtheme = false;
  bool isImageSelected = false;
  String selectedColor = '#FF9200';
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

  createNewPlaylist() async {
    setState(() {
      creatingPlaylist = true;
    });
    final data = {
      'type': 'playlist_api',
      'action': 'add_playist',
      'user_id': loginUserId.toString(),
      'private': private ? '1' : '0',
      'playlist': playlistTitle.text.toString(),
      'background': selectedColor.toString(),
      'category':
          playlistCategories.indexOf(category.text.toString()).toString(),
      'music_id': widget.music_id.toString(),
    };
    print(data);
    final result = await API().MultiPartRequest(
      path: file,
      data: data,
      fileName: 'cover',
    );
    if (mounted) {
      setState(() {
        creatingPlaylist = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Stack(
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
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            height: height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  gap(h: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/new/images/video_icons/playlist.png',
                        color: grayMed,
                      ),
                      gap(w: 10),
                      Text(
                        'Create new playlist',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: grayMed,
                        ),
                      ),
                    ],
                  ),
                  gap(h: 15),
                  Container(
                    margin: spacing(horizontal: 15),
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
                  gap(h: 15),
                  isLoading
                      ? loadingSpinner()
                      : Container(
                          height: height * 0.055,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(7)),
                          margin: spacing(horizontal: 15),
                          padding: spacing(horizontal: 15),
                          child: DropDownList(
                            controller: category,
                            first: 'Select',
                            items: playlistCategories,
                            bgColor: white,
                            textColor: grayMed,
                            fontSize: 15,
                            fieldHeight: 0.05,
                            padding: 10,
                            isUnderline: true,
                          ),
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
                              margin: spacing(horizontal: 15),
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
                              margin: spacing(horizontal: 15),
                              decoration: BoxDecoration(
                                color: grayLight,
                                borderRadius: borderRadius(10),
                              ),
                              child: Container(
                                width: width * 0.15,
                                child: Center(
                                  child: Image.asset(
                                    'assets/new/icons/take_a_photo.png',
                                    width: width * 0.15,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                    ),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        InkWell(
                          onTap: () {
                            createNewPlaylist();
                          },
                          child: Container(
                            padding: spacing(horizontal: 15, vertical: 10),
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
    );
  }
}
