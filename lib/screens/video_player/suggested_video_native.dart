// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vibetag/screens/video_player/suggested_video_native_player.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';
import 'package:vibetag/utils/constant.dart';

/// Stateful widget to fetch and then display video content.
class SuggestedVideosNative extends StatefulWidget {
  final Map<String, dynamic> post;
  SuggestedVideosNative({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _SuggestedVideosNativeState createState() => _SuggestedVideosNativeState();
}

class _SuggestedVideosNativeState extends State<SuggestedVideosNative> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.post['postFile'].toString().isEmpty
        ? gap()
        : Container(
            margin: spacing(
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: white,
              boxShadow: boxShadow,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                        child: InkWell(
                      onTap: () {},
                      child: SuggestedVideoNativeVideoPlayer(
                        post_id: widget.post['post_id'],
                        videoUrl: getFullLink(
                          widget.post['postFile'],
                        ),
                      ),
                    )),
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: white,
                  margin: spacing(
                    vertical: 8,
                  ),
                  padding: spacing(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: spacing(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                gap(
                                  h: 10,
                                ),
                                Container(
                                  width: width * 0.8,
                                  child: Html(
                                    data: widget.post['postText'],
                                    style: {
                                      "body": Style(
                                        fontSize: FontSize(12.0),
                                        textOverflow: TextOverflow.ellipsis,
                                        color: Colors.black54,
                                        maxLines: 3,
                                      )
                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            size: 16,
                                            color: grayMed,
                                          ),
                                        ),
                                        gap(w: 3),
                                        Text(
                                          '${getInK(number: int.parse(widget.post['videoViews'].toString()))} views',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: blackLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    gap(w: 20),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Container(
                                            width: 14,
                                            child: Image.asset(
                                              'assets/new/icons/heart.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        gap(w: 3),
                                        Text(
                                          '${getInK(number: int.parse(widget.post['reaction']['count'].toString()))} Reacts',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: blackLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/new/icons/more_v.png',
                              color: grayMed,
                            )
                          ],
                        ),
                      ),
                      gap(
                        h: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
