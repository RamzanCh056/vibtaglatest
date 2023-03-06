import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant.dart';

thumbnail(Map<String, dynamic> post) {
  String thumbnailFile = '';
  if (post['postFileThumb'].toString().isNotEmpty) {
    thumbnailFile = post['postFileThumb'].toString().contains(serverUrl)
        ? post['postFileThumb']
        : '${serverUrl}${post['postFileThumb']}';
  } else {
    thumbnailFile = post['publisher']['avatar'].toString().contains(serverUrl)
        ? post['publisher']['avatar']
        : '${serverUrl}${post['publisher']['avatar']}';
  }
  return thumbnailFile;
}

WordNewsTrend({
  required BuildContext context,
  required Map<String, dynamic> worldnews,
}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.12,
            height: width * 0.12,
            decoration: BoxDecoration(
              borderRadius: borderRadius(5),
            ),
            child: ClipRRect(
              borderRadius: borderRadius(5),
              child: Image.network(
                thumbnail(worldnews),
                fit: BoxFit.cover,
              ),
            ),
          ),
          gap(
            w: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width * 0.7,
                child: Html(
                  data: worldnews['postText'],
                  style: {
                    "body": Style(
                      fontSize: FontSize(12.0),
                      textOverflow: TextOverflow.ellipsis,
                      color: Colors.black54,
                      maxLines: 2,
                    ),
                  },
                ),
              ),
              Padding(
                padding: spacing(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'By',
                      style: TextStyle(
                        fontSize: 12,
                        color: grayMed,
                      ),
                    ),
                    gap(w: 7),
                    Text(
                      worldnews['publisher']['name'],
                      style: TextStyle(
                        fontSize: 12,
                        color: blackPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              gap(h: 3),
              Container(
                padding: spacing(horizontal: 10),
                width: width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/eye.png'),
                        gap(w: 7),
                        Text(
                          '206k Views',
                          style: TextStyle(
                            fontSize: 10,
                            color: grayMed,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      worldnews['post_time'],
                      style: TextStyle(
                        fontSize: 10,
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
              ),
              gap(h: 7),
            ],
          )
        ],
      ),
      gap(h: 10),
      Container(
        width: double.maxFinite,
        color: grayMed,
        height: 1.5,
      ),
      gap(h: 10)
    ],
  );
}
