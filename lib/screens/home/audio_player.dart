// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class AudioMediaPlayer extends StatefulWidget {
  final String url;
  final String audioThumbnail;

  const AudioMediaPlayer({
    Key? key,
    required this.url,
    required this.audioThumbnail,
  }) : super(key: key);

  @override
  State<AudioMediaPlayer> createState() => _AudioMediaPlayerState();
}

class _AudioMediaPlayerState extends State<AudioMediaPlayer> {
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  bool isMuted = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    // TODO: implement dispose
    player.pause();
    player.dispose();

    super.dispose();
  }

  Future setAudio() async {
    await player.setReleaseMode(ReleaseMode.loop);
    player.setSourceUrl(widget.url);
  }

  @override
  void initState() {
    super.initState();
    setAudio();
    player.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
    player.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });
    player.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          duration = newPosition;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width,
      height: height * 0.3,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height * 0.3,
            child: widget.audioThumbnail.trim().toString().isNotEmpty
                ? Image.network(
                    widget.audioThumbnail.contains(serverUrl)
                        ? widget.audioThumbnail
                        : '${serverUrl}${widget.audioThumbnail}',
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/No-Audio-thumbnail.png',
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await player.seek(position);
                    await player.resume();
                  },
                ),
                Padding(
                  padding: spacing(horizontal: 15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          if (isPlaying) {
                            await player.pause();
                          } else {
                            await player.resume();
                          }
                          ;
                        },
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: white,
                        ),
                      ),
                      gap(w: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isMuted = !isMuted;
                          });
                          isMuted ? player.setVolume(0) : player.setVolume(1);
                        },
                        child: Icon(
                          isMuted
                              ? Icons.volume_off_outlined
                              : Icons.volume_up_outlined,
                          color: white,
                        ),
                      ),
                      gap(w: 10),
                      Text(formatTime(duration),
                          style: TextStyle(
                            color: white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hour = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hour, minutes, seconds].join(':');
  }
}
