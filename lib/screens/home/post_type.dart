import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:vibetag/screens/home/video_player.dart';
import 'package:video_player/video_player.dart';

Widget postFile(
    {required String file,
    required int videoViews,
    required BuildContext context}) {
  final ex = p.extension(file);
  final String serverUrl = 'https://vibetagspace.nyc3.digitaloceanspaces.com/';
  if (file == '') {
    return Container();
  } else if (ex == '.mp4' ||
      ex == '.avi' ||
      ex == '.mkv' ||
      ex == '.flv' ||
      ex == '.ts') {
    if ((file.contains(serverUrl))) {
      return VideoMediaPlayer(
        videoUrl: file,
        videoViews: videoViews,
      );
    } else {
      String url = serverUrl + file;

      return VideoMediaPlayer(
        videoUrl: url,
        videoViews: videoViews,
      );
    }
  } else if (ex == '.png' ||
      ex == '.jpeg' ||
      ex == '.jpg' ||
      ex == '.webp' ||
      ex == '.gif' ||
      ex == '.PNG') {
    if ((file.contains(serverUrl))) {
      return Image.network(
        file,
        fit: BoxFit.cover,
      );
    } else {
      String url = serverUrl + file;
      return Image.network(
        url,
        fit: BoxFit.cover,
      );
    }
  } else {
    return Container();
  }
}
