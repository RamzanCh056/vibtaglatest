// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';
import 'package:vibetag/utils/constant.dart';

/// Stateful widget to fetch and then display video content.
class VideoMediaPlayer extends StatefulWidget {
  final String post_id;
  final String videoUrl;
  final String thumbnail;
  bool isAds = false;
  VideoMediaPlayer({
    Key? key,
    required this.post_id,
    required this.videoUrl,
    required this.thumbnail,
    this.isAds = false,
  }) : super(key: key);

  @override
  _VideoMediaPlayerState createState() => _VideoMediaPlayerState();
}

class _VideoMediaPlayerState extends State<VideoMediaPlayer> {
  late VideoPlayerController _controller;
  bool isFocused = false;
  bool hideButtton = false;
  bool isIcreased = false;
  bool isDecreased = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoUrl.toString(),
    )..initialize().then(
        (_) {
          setMic();
          setState(() {
            hideButtton = true;
          });
        },
      );
  }

  void setMic() {
    isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
  }

  void videoPlayAndPause() {
    setState(() {
      hideButtton = false;
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
    Timer(
      Duration(seconds: 3),
      () => {
        setState(() {
          hideButtton = true;
        })
      },
    );
  }

  void muteAndUnmute() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    String videoThumbnail = widget.thumbnail.contains(serverUrl)
        ? '${widget.thumbnail}'
        : '${serverUrl}${widget.thumbnail}';
    return Stack(
      children: [
        InkWell(
          onTap: () {
            if (mounted) {
              setState(() {
                hideButtton = false;
              });
              Timer(
                Duration(seconds: 3),
                () => {
                  setState(() {
                    hideButtton = true;
                  })
                },
              );
            }
          },
          child: VisibilityDetector(
            key: Key('Video-Player'),
            onVisibilityChanged: (info) {
              var isVisible = info.visibleFraction;
              Future.delayed(const Duration(milliseconds: 1), () {
                if (mounted) {
                  if (isVisible > 0.6) {
                    if (_controller.value.isInitialized &&
                        !_controller.value.isPlaying) {
                      _controller.play();
                      setState(() {
                        isFocused = true;
                      });
                    }
                  } else {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                      setState(() {
                        isFocused = true;
                      });
                    }
                  }
                }
              });
            },
            child: Center(
              child: !isFocused
                  ? Container(
                      width: double.maxFinite,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/new/gif/image_loading1.gif',
                        image: videoThumbnail,
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.fitWidth,
                      ),
                    )
                  : _controller.value.isInitialized
                      ? InkWell(
                          onTap: () {
                            if (!(widget.isAds)) {
                              pushRoute(
                                context: context,
                                screen: VideoScreen(
                                  post_id: widget.post_id,
                                  controller: _controller,
                                ),
                              );
                            }
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
                              height: height * 0.3,
                              child: FadeInImage.assetNetwork(
                                placeholder:
                                    'assets/new/gif/image_loading1.gif',
                                image: videoThumbnail,
                                fit: BoxFit.cover,
                                placeholderFit: BoxFit.fitWidth,
                              ),
                            ),
                            Positioned(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: orangeLight,
                                ),
                              ),
                            )
                          ],
                        ),
            ),
          ),
        ),
        isFocused
            ? Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Center(
                  child: Center(
                    child: hideButtton
                        ? Container()
                        : InkWell(
                            onTap: () {
                              videoPlayAndPause();
                              setState(() {
                                isFocused = !isFocused;
                              });
                            },
                            child: Center(
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
                            ),
                          ),
                  ),
                ),
              )
            : gap(),
        isFocused
            ? Positioned(
                bottom: 5,
                left: 10,
                right: 10,
                child: hideButtton
                    ? Container()
                    : Column(
                        children: [
                          Container(
                            child: SizedBox(
                              height: 5,
                              child: VideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                  backgroundColor: white,
                                  bufferedColor: grayMed,
                                  playedColor: orange,
                                ),
                                padding: spacing(),
                              ),
                            ),
                          ),
                          gap(h: 5),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable: _controller,
                                      builder: (context, VideoPlayerValue value,
                                          child) {
                                        //Do Something with the value.
                                        return Text(
                                          '${value.position.inHours}:${value.position.inMinutes}:${value.position.inSeconds}',
                                          style: TextStyle(
                                            color: white,
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                      ' / ${_controller.value.duration.inHours}:${_controller.value.duration.inMinutes}:${_controller.value.duration.inSeconds}',
                                      style: TextStyle(
                                        color: white,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LandScapeVideoPlayer(
                                                controller: _controller),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    child: Icon(
                                      Icons.fullscreen,
                                      color: white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              )
            : gap(),
        Positioned(
          right: 15,
          top: 15,
          child: InkWell(
            onTap: () {
              muteAndUnmute();
            },
            child: Container(
              padding: spacing(
                horizontal: 2,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(50, 0, 0, 0),
                borderRadius: borderRadius(3),
              ),
              child: isMuted
                  ? Icon(
                      Icons.volume_off_outlined,
                      color: white,
                      size: 18,
                    )
                  : Icon(
                      Icons.volume_up_outlined,
                      color: white,
                      size: 18,
                    ),
            ),
          ),
        ),
        isFocused
            ? Positioned(
                top: 0,
                bottom: 0,
                child: _controller.value.isPlaying
                    ? Container(
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onDoubleTap: () async {
                                setState(() {
                                  isDecreased = true;
                                });
                                await _controller.seekTo(
                                  Duration(
                                    seconds:
                                        _controller.value.position.inSeconds -
                                            10,
                                  ),
                                );
                                Timer(
                                  Duration(seconds: 1),
                                  () => {
                                    setState(() {
                                      isDecreased = false;
                                    })
                                  },
                                );
                              },
                              child: Container(
                                width: width * 0.4,
                                height: width * 0.4,
                                child: isDecreased
                                    ? Center(
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          color: white,
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                            InkWell(
                              onDoubleTap: () async {
                                setState(() {
                                  isIcreased = true;
                                });
                                await _controller.seekTo(
                                  Duration(
                                    seconds:
                                        _controller.value.position.inSeconds +
                                            10,
                                  ),
                                );
                                Timer(
                                  Duration(seconds: 1),
                                  () => {
                                    setState(() {
                                      isIcreased = false;
                                    })
                                  },
                                );
                              },
                              child: Container(
                                width: width * 0.4,
                                height: width * 0.4,
                                child: isIcreased
                                    ? Center(
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: white,
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              )
            : gap(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
