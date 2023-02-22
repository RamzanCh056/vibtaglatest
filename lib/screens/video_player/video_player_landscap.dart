import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

import '../../utils/constant.dart';

class LandScapeVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  const LandScapeVideoPlayer({super.key, required this.controller});

  @override
  State<LandScapeVideoPlayer> createState() => _LandScapeVideoPlayerState();
}

class _LandScapeVideoPlayerState extends State<LandScapeVideoPlayer> {
  bool hideButtton = false;
  bool isIcreased = false;
  bool isDecreased = false;
  Future landScapMode() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void initState() {
    super.initState();
    landScapMode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setAllOrientations();
  }

  Future setAllOrientations() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  void videoPlayAndPause() {
    setState(() {
      hideButtton = false;
      widget.controller.value.isPlaying
          ? widget.controller.pause()
          : widget.controller.play();
    });
    Timer(
      Duration(seconds: 3),
      () => {
        setState(() {
          setMic();
          hideButtton = true;
        })
      },
    );
  }

  void setMic() {
    isMuted
        ? widget.controller.setVolume(0.0)
        : widget.controller.setVolume(1.0);
  }

  void muteAndUnmute() {
    if (mounted) {
      setState(() {
        isMuted = !isMuted;
        isMuted
            ? widget.controller.setVolume(0.0)
            : widget.controller.setVolume(1.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                hideButtton = false;
              });
              Timer(
                Duration(seconds: 3),
                () => {
                  if (mounted)
                    {
                      setState(() {
                        hideButtton = true;
                      })
                    }
                },
              );
            },
            child: Center(
              child: widget.controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: widget.controller.value.aspectRatio,
                      child: VideoPlayer(widget.controller),
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
                              widget.controller.value.isPlaying
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
                            widget.controller,
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
                                  valueListenable: widget.controller,
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
                                  ' / ${widget.controller.value.duration.inHours}:${widget.controller.value.duration.inMinutes}:${widget.controller.value.duration.inSeconds}',
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
                                        controller: widget.controller),
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
            top: height * 0.1,
            child: hideButtton
                ? const SizedBox()
                : InkWell(
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
            child: widget.controller.value.isPlaying
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
                            await widget.controller.seekTo(
                              Duration(
                                seconds:
                                    widget.controller.value.position.inSeconds -
                                        10,
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
                            await widget.controller.seekTo(
                              Duration(
                                seconds:
                                    widget.controller.value.position.inSeconds +
                                        10,
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
      ),
    );
  }
}
