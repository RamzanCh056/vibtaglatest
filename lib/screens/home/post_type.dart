import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:vibetag/screens/home/audio_player.dart';
import 'package:vibetag/screens/video_player/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:zoom_widget/zoom_widget.dart';

import '../../utils/constant.dart';

Widget postFile({
  required String file,
  required BuildContext context,
  required String thumbnail,
  required String post_id,
  bool isAds = false,
  bool autoPlay = true,
  bool videoTimer = false,
}) {
  final ex = p.extension(file);
  if (file == '') {
    return Container();
  } else if (isVideo(ex: ex)) {
    if ((file.contains(serverUrl))) {
      return VideoMediaPlayer(
        videoUrl: file,
        thumbnail: thumbnail,
        isAds: isAds,
        post_id: post_id,
        autoPlay: autoPlay,
        videoTimer: videoTimer,
      );
    } else {
      String url = serverUrl + file;

      return VideoMediaPlayer(
        videoUrl: url,
        thumbnail: thumbnail,
        isAds: isAds,
        post_id: post_id,
        autoPlay: autoPlay,
        videoTimer: videoTimer,
      );
    }
  } else if (ex == '.png' ||
      ex == '.jpeg' ||
      ex == '.jpg' ||
      ex == '.webp' ||
      ex == '.gif' ||
      ex == '.PNG') {
    if ((file.contains(serverUrl))) {
      return Container(
        height: deviceHeight(context: context) * 0.3,
        width: deviceWidth(context: context),
        child: Zoom(
          child: Container(
            height: deviceHeight(context: context) * 0.3,
            width: deviceWidth(context: context),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/new/gif/image_loading1.gif',
              image: file,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.fitWidth,
            ),
          ),
        ),
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
      return AudioMediaPlayer(
        url: file,
        audioThumbnail: thumbnail,
      );
    } else {
      String url = serverUrl + file;
      return AudioMediaPlayer(
        url: url,
        audioThumbnail: thumbnail,
      );
    }
  } else {
    return Container();
  }
}
