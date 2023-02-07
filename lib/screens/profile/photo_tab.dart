import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';

class PhotoTab extends StatefulWidget {
  const PhotoTab({super.key});

  @override
  State<PhotoTab> createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  List<String> Photos = [];
  bool isLoading = false;
  @override
  void initState() {
    getProfilePhotos();
    super.initState();
  }

  void getProfilePhotos() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_images',
      'user_id': loginUserId,
      'user_profile_id': loginUserId,
      'after_post_id': '0',
    };
    final result = await API().postData(data);
    final photo = jsonDecode(result.body)['posts_data'];
    if (photo.length > 0) {
      for (var i = 0; i < photo.length; i++) {
        if (photo[i]['postFile'].trim() != '') {
          photo[i]['postFile'].toString().contains(serverUrl)
              ? Photos.add(photo[i]['postFile'].toString())
              : Photos.add('${serverUrl}${photo[i]['postFile']}');
        }
      }
    }
    print(Photos);
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return isLoading
        ? loadingSpinner()
        : Container(
            child: Center(
              child: Container(
                width: width * 0.96,
                height: height * 0.8,
                margin: spacing(
                  horizontal: width * 0.02,
                  vertical: width * 0.02,
                ),
                color: backgroundColor,
                child: true
                    ? GridView.custom(
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 4,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 2),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: Photos.length,
                          (context, i) {
                            return Image.network(
                              Photos[i],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      )
                    : ListView.builder(
                        itemCount: Photos.length,
                        itemBuilder: (context, i) {
                          if (i < 3) {
                            return Row(
                              children: [
                                Container(
                                  width: width * 0.47,
                                  height: height * 0.25,
                                  child: ClipRRect(
                                    borderRadius: borderRadius(7),
                                    child: Image.asset(
                                      'assets/images/post_cover.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                gap(w: 5),
                                Container(
                                  height: height * 0.25,
                                  width: width * 0.47,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: height * 0.12,
                                        width: width * 0.47,
                                        child: ClipRRect(
                                          borderRadius: borderRadius(7),
                                          child: Image.asset(
                                            'assets/images/post_cover.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      gap(h: height * 0.01),
                                      Container(
                                        height: height * 0.12,
                                        width: width * 0.47,
                                        child: ClipRRect(
                                          borderRadius: borderRadius(7),
                                          child: Image.asset(
                                            'assets/images/post_cover.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else if (i > 2 && i < 11) {
                            return Container(
                              width: width * 0.96,
                              height: height * 0.235,
                              child: Center(
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: 8,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      child: ClipRRect(
                                        borderRadius: borderRadius(7),
                                        child: Image.asset(
                                          'assets/images/post_cover.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            return Row(
                              children: [
                                Container(
                                  width: width * 0.47,
                                  height: height * 0.25,
                                  child: ClipRRect(
                                    borderRadius: borderRadius(7),
                                    child: Image.asset(
                                      'assets/images/post_cover.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                gap(w: 5),
                                Container(
                                  height: height * 0.25,
                                  width: width * 0.47,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: height * 0.25,
                                        width: width * 0.227,
                                        child: ClipRRect(
                                          borderRadius: borderRadius(7),
                                          child: Image.asset(
                                            'assets/images/post_cover.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      gap(w: 5),
                                      Container(
                                        height: height * 0.25,
                                        width: width * 0.227,
                                        child: ClipRRect(
                                          borderRadius: borderRadius(7),
                                          child: Image.asset(
                                            'assets/images/post_cover.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
              ),
            ),
          );
  }
}
