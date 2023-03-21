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
  return Container(
    margin: spacing(vertical: 5),
    decoration: BoxDecoration(
      borderRadius: borderRadius(5),
      color: white,
      boxShadow: lightShadow,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * 0.23,
          height: width * 0.23,
          padding: spacing(
            horizontal: 5,
            vertical: 5,
          ),
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
                    color: blackPrimary,
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
                      fontSize: 8,
                      color: grayMed,
                    ),
                  ),
                  gap(w: 4),
                  Text(
                    worldnews['publisher']['name'],
                    style: TextStyle(
                      fontSize: 10,
                      color: grayPrimary,
                    ),
                  ),
                ],
              ),
            ),
            gap(h: 3),
            Container(
              padding: spacing(horizontal: 10),
              width: width * 0.65,
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
                          fontSize: 8,
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
  );
}
