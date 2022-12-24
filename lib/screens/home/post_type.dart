import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:vibetag/screens/home/overlay.dart';
import 'package:video_player/video_player.dart';

Widget postFile({required String file, required BuildContext context}) {
  late VideoPlayerController controller;
  final ex = p.extension(file);
  print(ex);
  if (file == '') {
    return Container();
  } else if (ex == '.mp4' || ex == '.avi' || ex == '.mkv') {
    controller = VideoPlayerController.network(file);
    return StatefulBuilder(
      builder: (context, setState) {
        return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(controller),
              ControlsOverlay(controller: controller),
              VideoProgressIndicator(controller, allowScrubbing: true),
            ],
          ),
        );
      },
    );
  } else {
    if ((file.contains('https://vibetagspace.nyc3.digitaloceanspaces.com/'))) {
      return Image.network(file);
    } else {
      String url = 'https://vibetagspace.nyc3.digitaloceanspaces.com/' + file;
      return Image.network(url);
    }
  }
}
