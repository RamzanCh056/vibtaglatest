import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constant.dart';

class ChewieVideoMediaPlayer extends StatefulWidget {
  final Map<String, dynamic> post;
  const ChewieVideoMediaPlayer({super.key, required this.post});

  @override
  State<ChewieVideoMediaPlayer> createState() => _ChewieVideoMediaPlayerState();
}

class _ChewieVideoMediaPlayerState extends State<ChewieVideoMediaPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(
      '${widget.post['postFile']}', // Replace with your video URL
    );

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          if (!_chewieController.isPlaying) {
            _chewieController.play();
            setState(() {});
          }
        } else {
          if (_chewieController.isPlaying) {
            _chewieController.pause();
            setState(() {});
          }
        }
      },
      key: Key('${widget.post['postFile']}'),
      child: Stack(
        children: [
          _videoPlayerController.value.isInitialized
              ? Container(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    // Set the desired aspect ratio for your video
                    child: Chewie(controller: _chewieController),
                  ),
                )
              : Positioned(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Image.network(
                      getFullLink(widget.post['postFileThumb']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          _videoPlayerController.value.isInitialized
              ? gap()
              : Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Center(
                    child: CircularProgressIndicator(),
                  ),
              )
        ],
      ),
    );
  }
}
