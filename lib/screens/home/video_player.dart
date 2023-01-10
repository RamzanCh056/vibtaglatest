// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vibetag/screens/home/video_player_landscap.dart';
import 'package:video_player/video_player.dart';

import 'package:vibetag/utils/constant.dart';

/// Stateful widget to fetch and then display video content.
class VideoMediaPlayer extends StatefulWidget {
  final String videoUrl;
  const VideoMediaPlayer({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoMediaPlayerState createState() => _VideoMediaPlayerState();
}

class _VideoMediaPlayerState extends State<VideoMediaPlayer> {
  late VideoPlayerController _controller;
  bool isMuted = false;
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
          setState(() {});
        },
      );
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
    return Stack(
      children: [
        InkWell(
          onTap: () {
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
          },
          child: Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(
                    width: double.maxFinite,
                    height: height * 0.3,
                    child: Center(
                      child: loadingSpinner(),
                    ),
                  ),
          ),
        ),
        Positioned(
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
        ),
        
        Positioned(
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
                                builder:
                                    (context, VideoPlayerValue value, child) {
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
                                  builder: (context) => LandScapeVideoPlayer(
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
        ),
        Positioned(
          right: 25,
          bottom: height * 0.1,
          child: hideButtton? const SizedBox(): InkWell(
            onTap: () {
              muteAndUnmute();
            },
            child: Container(
              padding: spacing(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(50, 0, 0, 0),
                borderRadius: borderRadius(3),
              ),
              child: isMuted
                  ? Icon(
                      Icons.volume_off_outlined,
                      color: white,
                      size: 32,
                    )
                  : Icon(
                      Icons.volume_up_outlined,
                      color: white,
                      size: 32,
                    ),
            ),
          ),
        ),
        Positioned(
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
                                  _controller.value.position.inSeconds - 10,
                            ),
                          );
                          Timer(
                            Duration(seconds: 2),
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
                                  _controller.value.position.inSeconds + 10,
                            ),
                          );
                          Timer(
                            Duration(seconds: 2),
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
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
