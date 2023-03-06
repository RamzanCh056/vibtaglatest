import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant.dart';

blogTrendingWidget({
  required BuildContext context,
  required Map<String, dynamic> blog,
}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Column(
    children: [
      gap(h: 10),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.12,
            height: width * 0.12,
            decoration: BoxDecoration(
              color: white,
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
          gap(
            w: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.7,
                child: Text(
                  blog['title'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                  ),
                  maxLines: 2,
                ),
              ),
              gap(
                h: 5,
              ),
              Row(
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
                    blog['author']['name'],
                    style: TextStyle(
                      fontSize: 12,
                      color: blackPrimary,
                    ),
                  ),
                  gap(w: 7),
                  Text(
                    readTimestamp(int.parse(blog['posted'].toString())),
                    style: TextStyle(
                      fontSize: 12,
                      color: grayMed,
                    ),
                  ),
                ],
              ),
              gap(h: 7),
              Container(
                padding: spacing(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: orangePrimary,
                  borderRadius: borderRadius(5),
                ),
                child: Text(
                  '${getInK(number: int.parse(blog['view'].toString()))}+ views',
                  style: TextStyle(
                    color: whitePrimary,
                    fontSize: 8,
                  ),
                ),
              )
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
    ],
  );
}
