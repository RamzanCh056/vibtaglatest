import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant.dart';

blogTrendingWidget({
  required BuildContext context,
  required Map<String, dynamic> blog,
}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Container(
    margin: spacing(
      vertical: 5,
    ),
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
              blog['thumbnail'],
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
                data: blog['title'],
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
                    blog['author']['name'],
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
                        '${getInK(number: int.parse(blog['view'].toString()))}+ views',
                        style: TextStyle(
                          fontSize: 8,
                          color: grayMed,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    readTimestamp(int.parse(blog['posted'].toString())),
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
