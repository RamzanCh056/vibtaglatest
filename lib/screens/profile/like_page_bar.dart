import 'package:flutter/material.dart';

import '../../utils/constant.dart';

LikedPageBar(
    {required BuildContext context, required Map<String, dynamic> pages}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Container(
    height: width * 0.25,
    width: width * 0.95,
    margin: spacing(
      vertical: 5,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          child: Container(
            height: width * 0.25,
            width: width * 0.25,
            child: Image.network(
              pages['avatar'].trim().toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: spacing(horizontal: 10),
          height: width * 0.25,
          width: width * 0.7,
          decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gap(h: 10),
              Container(
                width: width * 0.6,
                child: Text(
                  pages['page_title'],
                  style: const TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              gap(h: 5),
              Row(
                children: [
                  Text(
                    'Public Group',
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 10,
                    ),
                  ),
                  gap(w: 5),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(4),
                      color: grayMed,
                    ),
                  ),
                  gap(w: 5),
                  Text(
                    '${getInK(number: int.parse(pages['page_likes']))} Likes',
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              gap(h: 5),
              Container(
                width: width * 0.5,
                padding: spacing(
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: orangePrimary,
                  borderRadius: borderRadius(5),
                ),
                child: Text(
                  'Liked',
                  style: TextStyle(
                    color: whitePrimary,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              gap(h: 5),
            ],
          ),
        )
      ],
    ),
  );
}
