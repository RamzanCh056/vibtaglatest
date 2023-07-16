import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlay extends StatefulWidget {
  String? pathh;
  String? time;

  @override
  _AudioPlayState createState() => _AudioPlayState();

  AudioPlay({
    Key? key,
    this.pathh,
    this.time,
  }) : super(key: key);
}

class _AudioPlayState extends State<AudioPlay> {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  late AudioPlayer _audioPlayer;

  PageManager() {
    _init();
  }

  @override
  void initState() {
    PageManager();
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(widget.pathh!);

    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });

    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFEBEFFB)
        ),

        child: Column(

        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(
                  widget.time!,
                ) *
                    1000)),
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ValueListenableBuilder<ButtonState>(
                  valueListenable: buttonNotifier,
                  builder: (_, value, __) {
                    switch (value) {
                      case ButtonState.loading:
                        return Container(
                         // margin: const EdgeInsets.only(bottom: 20),
                          width: 30.0,
                          height: 30.0,
                          child: const CircularProgressIndicator(),
                        );
                      case ButtonState.paused:
                        return GestureDetector(
                          onTap:  play,
                            child: Icon(Icons.play_circle_outline_outlined, size: 32,));
                        //   IconButton(
                        //   icon: const Icon(Icons.play_arrow),
                        //   iconSize: 30.0,
                        //   onPressed: play,
                        // );
                      case ButtonState.playing:
                        return GestureDetector(
                            onTap:  pause,
                            child: Icon(Icons.pause_circle_outline, size: 32,));
                        //   IconButton(
                        //   icon: const Icon(Icons.pause),
                        //   iconSize: 30.0,
                        //   onPressed: pause,
                        // );
                    }
                  },
                ),
              ),
                SizedBox(width: 8,),
              Expanded(

                child: ValueListenableBuilder<ProgressBarState>(
                  valueListenable: progressNotifier,
                  builder: (_, value, __) {
                    return ProgressBar(
                      progress: value.current,
                      buffered: value.buffered,
                      total: value.total,
                      onSeek: seek,
                    );
                  },
                ),
              ),
            ],
          ),




        ],
      ),)
    );
  }
}
// class PageManager  {
//
//
//
//   final progressNotifier = ValueNotifier<ProgressBarState>(
//
//     ProgressBarState(
//       current: Duration.zero,
//       buffered: Duration.zero,
//       total: Duration.zero,
//     ),
//   );
//
//   final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);
//
//   static const url =
//       'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
//
//
//   late AudioPlayer _audioPlayer;
//   PageManager() {
//     _init();
//   }
//
//   void _init() async {
//     _audioPlayer = AudioPlayer();
//     await _audioPlayer.setUrl(widget.pathh!);
//
//     _audioPlayer.playerStateStream.listen((playerState) {
//       final isPlaying = playerState.playing;
//       final processingState = playerState.processingState;
//       if (processingState == ProcessingState.loading ||
//           processingState == ProcessingState.buffering) {
//         buttonNotifier.value = ButtonState.loading;
//       } else if (!isPlaying) {
//         buttonNotifier.value = ButtonState.paused;
//       } else if (processingState != ProcessingState.completed) {
//         buttonNotifier.value = ButtonState.playing;
//       } else {
//         _audioPlayer.seek(Duration.zero);
//         _audioPlayer.pause();
//       }
//     });
//
//     _audioPlayer.positionStream.listen((position) {
//       final oldState = progressNotifier.value;
//       progressNotifier.value = ProgressBarState(
//         current: position,
//         buffered: oldState.buffered,
//         total: oldState.total,
//       );
//     });
//
//     _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
//       final oldState = progressNotifier.value;
//       progressNotifier.value = ProgressBarState(
//         current: oldState.current,
//         buffered: bufferedPosition,
//         total: oldState.total,
//       );
//     });
//
//     _audioPlayer.durationStream.listen((totalDuration) {
//       final oldState = progressNotifier.value;
//       progressNotifier.value = ProgressBarState(
//         current: oldState.current,
//         buffered: oldState.buffered,
//         total: totalDuration ?? Duration.zero,
//       );
//     });
//   }
//
//   void play() {
//     _audioPlayer.play();
//   }
//
//   void pause() {
//     _audioPlayer.pause();
//   }
//
//   void seek(Duration position) {
//     _audioPlayer.seek(position);
//   }
//
//   void dispose() {
//     _audioPlayer.dispose();
//   }
// }

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });

  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }
