// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:native_video_player/native_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';
import 'package:vibetag/utils/constant.dart';

/// Stateful widget to fetch and then display video content.
class BuzzinNativePlayer extends StatefulWidget {
  final String videoUrl;
  final String thumbnail;
  BuzzinNativePlayer({
    Key? key,
    required this.videoUrl,
    required this.thumbnail,
  }) : super(key: key);

  @override
  _BuzzinNativePlayerState createState() => _BuzzinNativePlayerState();
}

class _BuzzinNativePlayerState extends State<BuzzinNativePlayer> {
  late NativeVideoPlayerController _controller;
  bool hideBtn = false;
  bool isPlay = false;
  bool isAlreadyInitialized = false;
  bool isAutoplayEnabled = true;
  bool isPlaybackLoopEnabled = false;

  Future<void> _initController(NativeVideoPlayerController controller) async {
    if (!isAlreadyInitialized) {
      _controller = controller;
      _controller. //
          onPlaybackStatusChanged
          .addListener(_onPlaybackStatusChanged);
      _controller. //
          onPlaybackPositionChanged
          .addListener(_onPlaybackPositionChanged);
      _controller. //
          onPlaybackSpeedChanged
          .addListener(_onPlaybackSpeedChanged);
      _controller. //
          onVolumeChanged
          .addListener(_onPlaybackVolumeChanged);
      _controller. //
          onPlaybackReady
          .addListener(_onPlaybackReady);
      _controller. //
          onPlaybackEnded
          .addListener(_onPlaybackEnded);

      await _loadVideoSource();
    }
  }

  void _onPlaybackReady() {
    setState(() {});
    if (isAutoplayEnabled) {
      _controller.play();
    }
  }

  void _onPlaybackStatusChanged() {
    setState(() {});
  }

  void _onPlaybackPositionChanged() {
    setState(() {});
  }

  void _onPlaybackSpeedChanged() {
    setState(() {});
  }

  void _onPlaybackVolumeChanged() {
    setState(() {});
  }

  void _onPlaybackEnded() {
    if (isPlaybackLoopEnabled) {
      _controller.play();
    }
  }

  Future<void> _loadVideoSource() async {
    
    final videoSource = await VideoSource.init(
      type: VideoSourceType.network,
      path: widget.videoUrl,
    );
    await _controller.loadVideoSource(videoSource);
    await _controller.play();
    // setMic();
    isAlreadyInitialized = true;

    setState(() {});
  }

  void setMic() {
    isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
  }

  void muteAndUnmute() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return InkWell(
      onTap: () {
        hideBtn = false;
        setState(() {});
        Timer(Duration(seconds: 5), () {
          hideBtn = true;
          setState(() {});
        });
      },
      child: Stack(
        children: [
          isAlreadyInitialized
              ? Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        hideBtn = false;
                      });
                      isPlay ? _controller.pause() : _controller.play();
                      Timer(Duration(seconds: 3), () {
                        if (mounted) {
                          setState(() {
                            hideBtn = true;
                          });
                        }
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: NativeVideoPlayerView(
                        onViewReady: _initController,
                      ),
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
            child: hideBtn
                ? gap()
                : isAlreadyInitialized
                    ? Center(
                        child: isPlay
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
            child: !isAlreadyInitialized
                ? gap()
                : hideBtn
                    ? gap()
                    : Container(
                        width: double.infinity,
                        height: 5,
                        child: SizedBox(
                          height: 5,
                          child: Slider(
                            // min: 0,
                            max: (_controller.videoInfo?.duration ?? 0)
                                .toDouble(),
                            value: (_controller.playbackInfo?.position ?? 0)
                                .toDouble(),
                            onChanged: (value) =>
                                _controller.seekTo(value.toInt()),
                          ),
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
