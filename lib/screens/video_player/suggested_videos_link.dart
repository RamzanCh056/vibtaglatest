// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vibetag/screens/video_player/single_video_player_link_video.dart';
import 'package:vibetag/screens/video_player/video_screen_link_video.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';
import 'package:vibetag/utils/constant.dart';

/// Stateful widget to fetch and then display video content.
class SuggestedVideosLinkPlayer extends StatefulWidget {
  final Map<String, dynamic> post;
  SuggestedVideosLinkPlayer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _SuggestedVideosLinkPlayerState createState() =>
      _SuggestedVideosLinkPlayerState();
}

class _SuggestedVideosLinkPlayerState extends State<SuggestedVideosLinkPlayer> {
  bool isloadedFully = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.post['postFile'].toString().contains('.mp4')
        ? widget.post['postFileThumb'].toString().isEmpty
            ? gap()
            : InkWell(
                onTap: () {
                 
                  pushRoute(
                    context: context,
                    screen: VideoScreenLinkVideo(
                      videoUrl: getFullLink(widget.post['postFile']),
                      post_id: widget.post['post_id'],
                    ),
                  );
                },
                child: Container(
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
                            child: Stack(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/new/gif/image_loading1.gif',
                                    image: getFullLink(
                                        widget.post['postFileThumb']),
                                    fit: BoxFit.cover,
                                    placeholderFit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              bottom: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(50),
                                    color: Color.fromARGB(54, 0, 0, 0),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 48,
                                    color: white,
                                  ),
                                ),
                              ))
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              textOverflow:
                                                  TextOverflow.ellipsis,
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
                                                padding: const EdgeInsets.only(
                                                    bottom: 4),
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
                                                padding: const EdgeInsets.only(
                                                    bottom: 4),
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
                ),
              )
        : gap();
  }
}
