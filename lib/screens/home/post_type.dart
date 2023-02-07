import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:vibetag/screens/home/audio_player.dart';
import 'package:vibetag/screens/video_player/video_player.dart';
import 'package:video_player/video_player.dart';

import '../../utils/constant.dart';

Widget postFile(
    {required String file,
    required BuildContext context,required String thumbnail}) {
  final ex = p.extension(file);
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
        thumbnail: thumbnail,
      );
    } else {
      String url = serverUrl + file;

      return VideoMediaPlayer(
        videoUrl: url,
        thumbnail: thumbnail,

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
      return FadeInImage.assetNetwork(
        placeholder: 'assets/new/gif/image_loading1.gif',
        image: url,
        fit: BoxFit.cover,
        placeholderFit: BoxFit.fitWidth,
      );
      // return Image.network(
      //   url,
      //   fit: BoxFit.cover,
      // );
    }
  } else if (ex == '.mp3' || ex == '.wave') {
    if ((file.contains(serverUrl))) {
      return AudioMediaPlayer(url: file,);
    } else {
      String url = serverUrl + file;
      return AudioMediaPlayer(url: url);
    }
  } else {
    return Container();
  }
}
