// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';
import 'package:vibetag/utils/constant.dart';

/// Stateful widget to fetch and then display video content.
class BuzzinPlayer extends StatefulWidget {
  final String videoUrl;
  final String thumbnail;
  BuzzinPlayer({
    Key? key,
    required this.videoUrl,
    required this.thumbnail,
  }) : super(key: key);

  @override
  _BuzzinPlayerState createState() => _BuzzinPlayerState();
}

class _BuzzinPlayerState extends State<BuzzinPlayer> {
  late VideoPlayerController controller;
  bool hidebutton = false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
      widget.videoUrl.toString(),
    )..initialize().then(
        (_) {
          controller.play();
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

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    isMuted ? controller.setVolume(0) : controller.setVolume(1);

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
                  Center(
                    child:
                        Image.network(widget.thumbnail, fit: BoxFit.fitHeight),
                  ),
                  loadingSpinner(),
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
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
