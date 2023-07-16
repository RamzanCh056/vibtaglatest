// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:native_video_player/native_video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/screens/video_player/native_video_screen.dart';

import '../../utils/constant.dart';

class SuggestedVideoNativeVideoPlayer extends StatefulWidget {
  String videoUrl;
  String post_id;
  SuggestedVideoNativeVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.post_id,
  }) : super(key: key);

  @override
  State<SuggestedVideoNativeVideoPlayer> createState() =>
      _SuggestedVideoNativeVideoPlayerState();
}

class _SuggestedVideoNativeVideoPlayerState
    extends State<SuggestedVideoNativeVideoPlayer> {
  late NativeVideoPlayerController _controller;
  bool isPlay = false;
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

    isAlreadyInitialized = true;
    setMic();
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

  @override
  Widget build(BuildContext context) {
    print(widget.videoUrl);
    return Center(
      child: Container(
        child: Stack(
          children: [
            Container(
              child: AspectRatio(
                aspectRatio: 16 / 9,
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
            Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: !isAlreadyInitialized
                    ? gap()
                    : Container(
                        padding: spacing(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              '${formatDuration(
                                Duration(
                                    seconds:
                                        _controller.videoInfo?.duration ?? 0),
                              )}',
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
