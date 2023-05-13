// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../utils/constant.dart';
import '../../home/post_types/post_file.dart';

class TrendLatestVideos extends StatelessWidget {
  final Map<String, dynamic> video;
  const TrendLatestVideos({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (!video['postFile_full'].toString().contains('.mp4'))
        ? gap()
        : Container(
            padding: spacing(
              horizontal: 3,
              vertical: 7,
            ),
            margin: spacing(horizontal: 3),
            child: Container(
              width: width * 0.8,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: grayLight,
                ),
                boxShadow: lightShadow,
                color: white,
                borderRadius: borderRadius(7),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: ClipRRect(
                          borderRadius: borderRadius(7),
                          child: postFile(
                            file: video['postFile_full'],
                            thumbnail: '${serverUrl}${video['postFileThumb']}',
                            post_id: video['post_id'],
                            autoPlay: false,
                            videoTimer: true,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Container(
                            width: width * 0.15,
                            child: Image.asset(
                              'assets/play_icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  gap(h: 7),
                  Container(
                    width: width * 0.75,
                    child: Text(
                      video['Orginaltext'],
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  gap(h: 7),
                  Container(
                    width: width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: width * 0.05,
                              foregroundImage:
                                  NetworkImage(video['publisher']['avatar']),
                            ),
                            gap(w: 10),
                            Container(
                              width: width * 0.4,
                              child: Text(
                                video['publisher']['name'],
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: spacing(horizontal: 15, vertical: 7),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: grayLight,
                            ),
                            borderRadius: borderRadius(5),
                          ),
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: grayMed,
                              fontSize: 8,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  gap(h: 15),
                ],
              ),
            ),
          );
  }
}
