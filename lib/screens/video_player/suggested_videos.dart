// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';
import 'package:vibetag/utils/constant.dart';

/// Stateful widget to fetch and then display video content.
class SuggestedVideos extends StatefulWidget {
  final Map<String, dynamic> post;
  SuggestedVideos({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _SuggestedVideosState createState() => _SuggestedVideosState();
}

class _SuggestedVideosState extends State<SuggestedVideos> {
  late VideoPlayerController _controller;
  bool isloadedFully = false;

  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  initVideoPlayer() {
    _controller = VideoPlayerController.network(
      getFullLink(widget.post['postFile']),
    )..initialize().then(
        (_) {
          setState(() {
            isloadedFully = true;
          });
        },
      );
  }

  void setMic() {
    isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
  }

  void videoPlayAndPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  void muteAndUnmute() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
    });
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
                      child: isloadedFully
                          ? InkWell(
                              onTap: () {
                                pushRoute(
                                  context: context,
                                  screen: VideoScreen(
                                    post_id: widget.post['post_id'].toString(),
                                    controller: _controller,
                                  ),
                                );
                              },
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            )
                          : Stack(
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
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  child: Center(
                                    child: loadingSpinner(),
                                  ),
                                )
                              ],
                            ),
                    ),
                    Positioned(
                      left: 15,
                      bottom: 10,
                      child: isloadedFully
                          ? Container(
                              padding: spacing(horizontal: 7, vertical: 7),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(111, 0, 0, 0),
                                borderRadius: borderRadius(5),
                              ),
                              child: Text(
                                '${setInTwoNumber(_controller.value.duration.inHours)}:${setInTwoNumber(_controller.value.duration.inMinutes % 60)}:${setInTwoNumber(_controller.value.duration.inSeconds % 60)}',
                                style: TextStyle(
                                  color: white,
                                ),
                              ),
                            )
                          : gap(),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: isloadedFully
                          ? Center(
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(50),
                                  color: Color.fromARGB(54, 0, 0, 0),
                                ),
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 48,
                                  color: white,
                                ),
                              ),
                            )
                          : gap(),
                    )
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
