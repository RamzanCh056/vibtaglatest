// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';
import 'package:vibetag/utils/constant.dart';

import '../../methods/api.dart';

/// Stateful widget to fetch and then display video content.
class BuzzinPlayer extends StatefulWidget {
  final String videoUrl;
  final String thumbnail;
  final String post_id;
  BuzzinPlayer({
    Key? key,
    required this.videoUrl,
    required this.thumbnail,
    required this.post_id,
  }) : super(key: key);

  @override
  _BuzzinPlayerState createState() => _BuzzinPlayerState();
}

class _BuzzinPlayerState extends State<BuzzinPlayer> {
  late VideoPlayerController controller;
  bool hidebutton = false;
  bool isViewAdd = false;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(
      widget.videoUrl.toString(),
    )..initialize().then(
        (_) {
          setState(() {});
          controller.play();
          controller.setLooping(true);
          controller.addListener(videoListener);
          Timer(Duration(seconds: 3), () {
            if (mounted) {
              setState(() {
                hidebutton = true;
              });
            }
          });
        },
      );
  }

  videoListener() {
    if (controller.value.position.inSeconds > 10 && !isViewAdd) {
      isViewAdd = true;
      addVideoView();
    }
    if (controller.value.isPlaying) {
      isMuted ? controller.setVolume(0) : controller.setVolume(1);
    } else {
      controller.setVolume(0);
    }
  }

  addVideoView() async {
    await PostMethods().addVideoView(widget.post_id.toString());
    controller.removeListener(videoListener);
  }

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Stack(
      children: [
        controller.value.isInitialized
            ? Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      hidebutton = false;
                    });
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                    Timer(Duration(seconds: 3), () {
                      if (mounted) {
                        setState(() {
                          hidebutton = true;
                        });
                      }
                    });
                  },
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                ),
              )
            : Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Center(
                      child: Image.network(
                        widget.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
        Positioned(
          child: hidebutton
              ? gap()
              : controller.value.isInitialized
                  ? Center(
                      child: controller.value.isPlaying
                          ? Icon(
                              Icons.pause,
                              color: white,
                              size: 48,
                            )
                          : Icon(
                              Icons.play_arrow,
                              color: white,
                              size: 48,
                            ),
                    )
                  : gap(),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: hidebutton
              ? gap()
              : Container(
                  width: double.infinity,
                  height: 5,
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
                ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(videoListener);
    controller.dispose();
  }
}
