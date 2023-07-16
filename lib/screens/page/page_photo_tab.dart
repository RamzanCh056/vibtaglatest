// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vibetag/screens/profile/profile_photo_timeline.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';

class PagePhotoTab extends StatefulWidget {
  final String page_id;
  const PagePhotoTab({
    Key? key,
    required this.page_id,
  }) : super(key: key);

  @override
  State<PagePhotoTab> createState() => _PagePhotoTabState();
}

class _PagePhotoTabState extends State<PagePhotoTab> {
  List<String> Photos = [];
  List<dynamic> PhotoPosts = [];

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
      'type': 'get_page_data',
      'sub_type': 'get_page_images',
      'user_id': loginUserId,
      'page_id': widget.page_id,
      'after_post_id': '0',
    };
    final result = await API().postData(data);
    PhotoPosts = jsonDecode(result.body)['posts_data'];
    if (PhotoPosts.length > 0) {
      for (var i = 0; i < PhotoPosts.length; i++) {
        if (PhotoPosts[i]['postFile'].trim() != '') {
          PhotoPosts[i]['postFile'].toString().contains(serverUrl)
              ? Photos.add(PhotoPosts[i]['postFile'].toString())
              : Photos.add('${serverUrl}${PhotoPosts[i]['postFile']}');
        }
      }
    }
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
        : Photos.length == 0
            ? Center(
                child: Text('No Photo yet'),
              )
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
                      child: GridView.custom(
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
                            return InkWell(
                              onTap: () {
                                pushRoute(
                                  context: context,
                                  screen: ProfilePhotoTimeline(
                                    first: PhotoPosts[i],
                                    posts: PhotoPosts,
                                  ),
                                );
                              },
                              child: Image.network(
                                Photos[i],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      )),
                ),
              );
  }
}
