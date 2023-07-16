// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:native_video_player/native_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/single_native_video_player.dart';

import '../../utils/constant.dart';

class LandScapeNativeVideoPlayer extends StatefulWidget {
  String videoUrl;
  int position;
  LandScapeNativeVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.position,
  }) : super(key: key);

  @override
  State<LandScapeNativeVideoPlayer> createState() =>
      _LandScapeNativeVideoPlayerState();
}

class _LandScapeNativeVideoPlayerState
    extends State<LandScapeNativeVideoPlayer> {
  late NativeVideoPlayerController _controller;
  bool isPlay = false;
  bool hideBtn = false;
  bool isAlreadyInitialized = false;
  bool isAutoplayEnabled = false;
  bool isPlaybackLoopEnabled = false;
  @override
  void initState() {
    super.initState();
    landScapMode();
  }

  Future landScapMode() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

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
    setMic();

    setState(() {});
    _controller.seekTo(widget.position);
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

    await _controller.seekTo(widget.position);
    isPlay = true;
    hideBtn = true;
    isAlreadyInitialized = true;
    setState(() {});
  }

  void setMic() {
    isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void muteAndUnmute() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
    });
  }

  ForwardAndBackwardVideo(int value) {
   
    _controller.seekTo(value);
  }

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: NativeVideoPlayerView(
                  onViewReady: _initController,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            top: 0,
            child: InkWell(
              onTap: () {
                hideBtn = false;
                setState(() {});

                Timer(Duration(seconds: 5), () {
                  hideBtn = true;
                  setState(() {});
                });
              },
              child: Container(
                padding: spacing(horizontal: 150, vertical: 150),
                child: hideBtn
                    ? gap()
                    : Center(
                        child: InkWell(
                          onTap: () {
                            isPlay
                                ? _controller.pause()
                                : _controller.play();
                            isPlay = !isPlay;
                            hideBtn = false;
                            Timer(Duration(seconds: 5), () {
                              hideBtn = true;
                              setState(() {});
                            });
                            setState(() {});
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
                                  isPlay
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
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: hideBtn
                ? gap()
                : !isAlreadyInitialized
                    ? gap()
                    : Column(
                        children: [
                          Container(
                            height: 15,
                            child: Slider(
                              // min: 0,
                              max: (_controller.videoInfo?.duration ?? 0)
                                  .toDouble(),
                              value:
                                  (_controller.playbackInfo?.position ??
                                          0)
                                      .toDouble(),
                              onChanged: (value) {
                                ForwardAndBackwardVideo(value.toInt());
                              },
                            ),
                          ),
                          gap(h: 8),
                          Container(
                            padding: spacing(horizontal: 25),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${formatDuration(
                                    Duration(
                                        seconds: _controller
                                                .playbackInfo?.position ??
                                            0),
                                  )} / ${formatDuration(
                                    Duration(
                                        seconds: _controller
                                                .videoInfo?.duration ??
                                            0),
                                  )}',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                                InkWell(
                                 onTap: (){
                                  pop(context);
                                 },
                                  child: Icon(
                                    Icons.fullscreen,
                                    color: white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
          ),
          Positioned(
            right: 15,
            top: 15+MediaQuery.of(context).padding.top,
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
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {
                hideBtn = false;
                setState(() {});
                Timer(Duration(seconds: 5), () {
                  hideBtn = true;
                  setState(() {});
                });
              },
              onDoubleTap: () async {
                hideBtn = false;
                setState(() {});
                Timer(Duration(seconds: 5), () {
                  hideBtn = true;
                  setState(() {});
                });
                int value = _controller.playbackInfo!.position - 10;
                ForwardAndBackwardVideo(value);
              },
              child: Container(
                width: width * 0.45,
                height: height * 0.2,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {
                hideBtn = false;
                setState(() {});
                Timer(Duration(seconds: 5), () {
                  hideBtn = true;
                  setState(() {});
                });
              },
              onDoubleTap: () async {
                hideBtn = false;
                setState(() {});
                Timer(Duration(seconds: 5), () {
                  hideBtn = true;
                  setState(() {});
                });

                int value = _controller.playbackInfo!.position + 10;
                ForwardAndBackwardVideo(value);
              },
              child: Container(
                width: width * 0.45,
                height: height * 0.2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
