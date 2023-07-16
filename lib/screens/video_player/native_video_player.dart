// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:native_video_player/native_video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/native_video_screen.dart';
import 'package:vibetag/screens/video_player/single_native_video_player.dart';

import '../../utils/constant.dart';

class NativeVideoMediaPlayer extends StatefulWidget {
  String videoUrl;
  String post_id;
  NativeVideoMediaPlayer({
    Key? key,
    required this.videoUrl,
    required this.post_id,
  }) : super(key: key);

  @override
  State<NativeVideoMediaPlayer> createState() => _NativeVideoMediaPlayerState();
}

class _NativeVideoMediaPlayerState extends State<NativeVideoMediaPlayer> {
  late NativeVideoPlayerController _controller;
  bool isPlay = false;
  bool hideBtn = false;
  bool isAlreadyInitialized = false;
  bool isAutoplayEnabled = false;
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

  void _onPlaybackReady() async {
    setState(() {});
    setMic();
    isAlreadyInitialized = true;
    setState(() {});
    if (isAutoplayEnabled) {
      await _controller.play();
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

    setState(() {});
  }

  void setMic() {
    isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void muteAndUnmute() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.4) {
          if (!isPlay) {
            _controller.play();
            _controller.setVolume(1);
            isPlay = true;
            hideBtn = false;
            Timer(Duration(seconds: 5), () {
              hideBtn = true;
              setState(() {});
            });

            setState(() {});
          }
        } else {
          if (isPlay) {
            _controller.pause();
            _controller.setVolume(0);

            isPlay = false;
            setState(() {});
          }
        }
      },
      key: Key(widget.videoUrl.toString()),
      child: Container(
        child: Stack(
          children: [
            Container(
              child: AspectRatio(
                aspectRatio: isAlreadyInitialized
                    ? _controller.videoInfo!.width /
                        _controller.videoInfo!.height
                    : 16 / 9,
                child: NativeVideoPlayerView(
                  onViewReady: _initController,
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
                  pushRoute(
                    context: context,
                    screen: VideoScreen(
                      videoUrl: widget.videoUrl,
                      post_id: widget.post_id,
                      position: _controller.playbackInfo!.position,
                    ),
                  );
                },
                child: hideBtn
                    ? gap()
                    : Center(
                        child: InkWell(
                          onTap: () {
                            isPlay ? _controller.pause() : _controller.play();
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
                                isPlay ? Icons.pause : Icons.play_arrow,
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
                left: 0,
                right: 0,
                child: hideBtn
                    ? gap()
                    : !isAlreadyInitialized
                        ? gap()
                        : Column(
                            children: [
                              true
                                  ? gap()
                                  : Container(
                                      height: 15,
                                      child: Slider(
                                        max: (_controller.videoInfo?.duration ??
                                                0)
                                            .toDouble(),
                                        value: (_controller
                                                    .playbackInfo?.position ??
                                                0)
                                            .toDouble(),
                                        onChanged: (value) =>
                                            _controller.seekTo(value.toInt()),
                                      ),
                                    ),
                              gap(h: 8),
                              Container(
                                padding: spacing(horizontal: 25),
                                child: Row(
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
                                  ],
                                ),
                              ),
                            ],
                          )),
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
          ],
        ),
      ),
    );
  }
}
