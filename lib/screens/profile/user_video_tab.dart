// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:vibetag/screens/video_player/page_video_player.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';

class UserVideoTab extends StatefulWidget {
  final String user_id;
  const UserVideoTab({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<UserVideoTab> createState() => _UserVideoTabState();
}

class _UserVideoTabState extends State<UserVideoTab> {
  List<dynamic> profileVideos = [];
  bool isLoading = false;
  @override
  void initState() {
    getProfileVideos();
    super.initState();
  }

  void getProfileVideos() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_videos',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id,
      'after_post_id': '0',
    };
    final result = await API().postData(data);
    profileVideos = jsonDecode(result.body)['posts_data'];
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
    return Column(
      children: [
        gap(h: 15),
        isLoading
            ? loadingSpinner()
            : profileVideos.length == 0
                ? Center(
                    child: Text('No videos yet'),
                  )
                : Container(
                    width: width * 0.95,
                    color: backgroundColor,
                    child: SingleChildScrollView(
                      child: profileVideos.length > 0
                          ? Column(
                              children: [
                                Container(
                                  margin: spacing(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: borderRadius(10),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: height * 0.3,
                                            width: double.maxFinite,
                                            child: Center(
                                              child: ClipRRect(
                                                borderRadius: borderRadius(10),
                                                child: Image.network(
                                                    '${serverUrl}${profileVideos[0]['postFileThumb']}',
                                                    fit: BoxFit.fitWidth),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            left: 5,
                                            child: Container(
                                              padding: spacing(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                color:
                                                    Color.fromARGB(64, 0, 0, 0),
                                                borderRadius: borderRadius(5),
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 4),
                                                    child: Icon(
                                                      Icons.play_arrow_outlined,
                                                      size: 16,
                                                      color: white,
                                                    ),
                                                  ),
                                                  gap(w: 3),
                                                  Text(
                                                    '${getInK(number: int.parse(profileVideos[0]['videoViews']))}',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: whitePrimary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: width * 0.9,
                                    child: profileVideos[0]['postText'] != null
                                        ? Html(
                                            data: profileVideos[0]['postText'],
                                            style: {
                                              "body": Style(
                                                fontSize: const FontSize(12.0),
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                color: Colors.black54,
                                                maxLines: 1,
                                              ),
                                            },
                                          )
                                        : gap(),
                                  ),
                                ),
                                gap(h: 10),
                                Padding(
                                  padding: spacing(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: spacing(
                                          horizontal: 5,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: borderRadius(20),
                                          border: Border.all(
                                            width: 1,
                                            color: orangePrimary,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.emoji_emotions_sharp,
                                              color: orangePrimary,
                                              size: 18,
                                            ),
                                            gap(w: 5),
                                            Center(
                                              child: Text(
                                                '${getInK(number: int.parse(profileVideos[0]['post_likes']))}',
                                                style: TextStyle(
                                                  color: orangePrimary,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width * 0.03,
                                            height: width * 0.03,
                                            child: Image.asset(
                                              'assets/new/icons/comment.png',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '${getInK(number: int.parse(profileVideos[0]['post_comments']))}',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: grayMed,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: width * 0.05,
                                        height: width * 0.05,
                                        child: Image.asset(
                                          'assets/new/icons/revibe.png',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  height: height * 0.6,
                                  width: width * 0.95,
                                  child: GridView.builder(
                                      itemCount: (profileVideos.length - 1),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 1,
                                      ),
                                      itemBuilder: (context, i) {
                                        return Container(
                                          color: whitePrimary,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: height * 0.13,
                                                    child: Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            borderRadius(10),
                                                        child: Image.network(
                                                            '${serverUrl}${profileVideos[i + 1]['postFileThumb']}'),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 5,
                                                    left: 5,
                                                    child: Container(
                                                      padding: spacing(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            64, 0, 0, 0),
                                                        borderRadius:
                                                            borderRadius(5),
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 4),
                                                            child: Icon(
                                                              Icons
                                                                  .play_arrow_outlined,
                                                              size: 16,
                                                              color: white,
                                                            ),
                                                          ),
                                                          gap(w: 3),
                                                          Text(
                                                            profileVideos[i + 1]
                                                                        [
                                                                        'videoViews'] !=
                                                                    null
                                                                ? '${getInK(number: int.parse(profileVideos[i + 1]['videoViews']))}'
                                                                : '0',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  whitePrimary,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              gap(h: 10),
                                              Container(
                                                width: width * 0.45,
                                                padding:
                                                    spacing(horizontal: 10),
                                                child: profileVideos[i + 1]
                                                            ['postText'] !=
                                                        null
                                                    ? Html(
                                                        data:
                                                            profileVideos[i + 1]
                                                                ['postText'],
                                                        style: {
                                                          "body": Style(
                                                            fontSize:
                                                                const FontSize(
                                                                    12.0),
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color:
                                                                Colors.black54,
                                                            maxLines: 3,
                                                          ),
                                                        },
                                                      )
                                                    : gap(),
                                              ),
                                              gap(h: 10),
                                              Padding(
                                                padding:
                                                    spacing(horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: width * 0.03,
                                                          height: width * 0.03,
                                                          child: Image.asset(
                                                            'assets/new/icons/heart.png',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        profileVideos[i + 1][
                                                                    'post_likes'] !=
                                                                null
                                                            ? Text(
                                                                '${getInK(number: int.parse(profileVideos[i + 1]['post_likes']))}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color:
                                                                      grayMed,
                                                                ),
                                                              )
                                                            : gap(),
                                                      ],
                                                    ),
                                                    gap(w: 10),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: width * 0.03,
                                                          height: width * 0.03,
                                                          child: Image.asset(
                                                            'assets/new/icons/comment.png',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        profileVideos[i + 1][
                                                                    'post_comments'] !=
                                                                null
                                                            ? Text(
                                                                '${getInK(number: int.parse(profileVideos[i + 1]['post_comments']))}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color:
                                                                      grayMed,
                                                                ),
                                                              )
                                                            : gap(),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                )
                              ],
                            )
                          : SizedBox(),
                    ),
                  ),
      ],
    );
  }
}
