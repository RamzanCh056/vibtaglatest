import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:vibetag/screens/home/comment/audio_player.dart';
import 'package:vibetag/screens/home/post_types/file_post.dart';
import 'package:vibetag/screens/video_player/video_player.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/constant.dart';

Widget postFile({
  required String file,
  required String thumbnail,
  required String post_id,
  String postFileName = '',
  bool isAds = false,
  bool autoPlay = true,
  bool videoTimer = false,
  bool disableTap = false,
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
        disableTap: disableTap,
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
    return Container(
      width: width,
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/new/gif/image_loading1.gif',
        image: getFullLink(file),
        fit: BoxFit.fill,
        placeholderFit: BoxFit.fill,
      ),
    );
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
  } else if (ex == '.pdf' || ex == '.docx' || ex == '.doc') {
    return FilePostView(
      fileName: postFileName,
      ex: ex,
      url: file,
    );
  } else {
    return Container();
  }
}
