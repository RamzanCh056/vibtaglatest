// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:vibetag/screens/playlists/playlist/playlist_sheet.dart';
import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_setting.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

/// Stateful widget to fetch and then display video content.
class SingleScreenLinkedVideo extends StatefulWidget {
  final String videoUrl;
  final String post_id;
  bool showSlider = true;
  bool showTime = true;
  bool showFullScreen = true;
  double buttonSize = 20;
  SingleScreenLinkedVideo({
    Key? key,
    required this.videoUrl,
    required this.post_id,
    this.showSlider = true,
    this.showTime = true,
    this.showFullScreen = true,
    this.buttonSize = 70,
  }) : super(key: key);

  @override
  _SingleScreenLinkedVideoState createState() =>
      _SingleScreenLinkedVideoState();
}

class _SingleScreenLinkedVideoState extends State<SingleScreenLinkedVideo> {
  late VideoPlayerController controller;

  bool hideButtton = false;
  bool isIcreased = false;
  bool isDecreased = false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
      widget.videoUrl.toString(),
    )..initialize().then(
        (_) {
          setState(() {});
        },
      );
    setMic();
  }

  void setMic() {
    isMuted ? controller.setVolume(0.0) : controller.setVolume(1.0);
    Timer(
      Duration(seconds: 1),
      () {
        controller.play();
        if (mounted) {
          setState(() {
            hideButtton = true;
          });
        }
      },
    );
  }

  void videoPlayAndPause() {
    setState(() {
      hideButtton = false;
      controller.value.isPlaying ? controller.pause() : controller.play();
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
  }

  void muteAndUnmute() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? controller.setVolume(0.0) : controller.setVolume(1.0);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
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
                  setState(() {
                    hideButtton = true;
                  })
                },
              );
            },
            child: Center(
              child: controller.value.isInitialized
                  ? InkWell(
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
                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller),
                      ),
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
                            width: widget.buttonSize,
                            height: widget.buttonSize,
                            decoration: BoxDecoration(
                                borderRadius: borderRadius(50),
                                color: Color.fromARGB(54, 0, 0, 0),
                                border: Border.all(
                                  width: 2,
                                  color: white,
                                )),
                            child: Icon(
                              controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: widget.buttonSize * 0.5,
                              color: white,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 15,
            child: Row(
              children: [
                InkWell(
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
                gap(w: 10),
                InkWell(
                  onTap: () {
                    createBottomModalSheet(
                      context: context,
                      screen: PlayListOption(
                        music_id: widget.post_id,
                      ),
                    );
                  },
                  child: Container(
                    width: 15,
                    height: 15,
                    child: Image.asset(
                      'assets/new/images/video_icons/playlist.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
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
                      widget.showSlider
                          ? Container(
                              child: SizedBox(
                                height: 5,
                                child: VideoProgressIndicator(
                                  controller,
                                  allowScrubbing: true,
                                  colors: VideoProgressColors(
                                    backgroundColor: white,
                                    bufferedColor: grayMed,
                                    playedColor: orange,
                                  ),
                                  padding: spacing(),
                                ),
                              ),
                            )
                          : SizedBox(),
                      gap(h: 5),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.showTime
                                ? Row(
                                    children: [
                                      ValueListenableBuilder(
                                        valueListenable: controller,
                                        builder: (context,
                                            VideoPlayerValue value, child) {
                                          //Do Something with the value.
                                          return Text(
                                            '${value.position.inHours}:${value.position.inMinutes % 60}:${value.position.inSeconds % 60}',
                                            style: TextStyle(
                                              color: white,
                                            ),
                                          );
                                        },
                                      ),
                                      Text(
                                        ' / ${controller.value.duration.inHours}:${controller.value.duration.inMinutes % 60}:${controller.value.duration.inSeconds % 60}',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                            widget.showFullScreen
                                ? Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          VideoSetting(context: context);
                                        },
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                            'assets/new/images/video_icons/video_options.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      gap(w: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LandScapeVideoPlayer(
                                                      controller: controller),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                            'assets/new/images/video_icons/full_screen_mode.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          widget.showFullScreen
              ? Positioned(
                  top: 0,
                  bottom: 0,
                  child: controller.value.isPlaying
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
                                  await controller.seekTo(
                                    Duration(
                                      seconds:
                                          controller.value.position.inSeconds -
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
                                  await controller.seekTo(
                                    Duration(
                                      seconds:
                                          controller.value.position.inSeconds +
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
              : SizedBox(),
        ],
      ),
    );
  }
}
