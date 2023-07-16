// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant.dart';

class WorldNewSection extends StatefulWidget {
  List<dynamic> world_news;
  WorldNewSection({
    Key? key,
    required this.world_news,
  }) : super(key: key);

  @override
  State<WorldNewSection> createState() => _WorldNewSectionState();
}

class _WorldNewSectionState extends State<WorldNewSection> {
  List<Widget> trendingWorldNews = [];
  int pageIndex = 0;
  final PageController _Controller = PageController(initialPage: 0);
  setWidgets() {
    List<Widget> currentWidgets = [];
    int countWidget = 0;
    trendingWorldNews = [];
    for (var post in widget.world_news) {
      countWidget++;
      if (post['post_id'] != null) {
        currentWidgets.add(
          WordNewsTrend(
            worldnews: post,
          ),
        );
        if (countWidget == 4 ||
            post['id'] ==
                widget.world_news[(widget.world_news.length - 1)]['id']) {
          trendingWorldNews.add(
            Column(children: currentWidgets),
          );
          countWidget = 0;
          currentWidgets = [];
        }
      }
    }
    Slider();
  }

  @override
  void initState() {
    setWidgets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'World News',
          style: TextStyle(
            fontSize: 18,
            color: blackPrimary,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
          ),
        ),
        gap(h: 10),
        Container(
          width: width,
          height: height * 0.53,
          child: PageView(
            reverse: true,
            controller: _Controller,
            children: trendingWorldNews,
          ),
        ),
      ],
    );
  }

  void Slider() {
    Timer.periodic(
      Duration(seconds:90),
      (Timer timer) {
        if (mounted) {
          if (pageIndex == (trendingWorldNews.length - 1)) {
            setState(() {
              pageIndex = 0;
            });
          } else {
            setState(() {
              pageIndex++;
            });
          }
          _Controller.animateToPage(pageIndex,
              duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
        }
      },
    );
  }
}

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
  required Map<String, dynamic> worldnews,
}) {
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
                    fontSize: FontSize(14.0),
                    textOverflow: TextOverflow.ellipsis,
                    color: blackPrimary,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Manrope',
                    maxLines: 2,
                  ),
                  'a': Style(
                    color: orangePrimary,
                  )
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
                      fontSize: 14,
                      color: lightblue,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  gap(w: 4),
                  Text(
                    worldnews['publisher']['name'],
                    style: TextStyle(
                      fontSize: 14,
                      color: grayPrimary,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
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
                      Image.asset(
                        'assets/images/eye.png',
                      ),
                      gap(w: 7),
                      Text(
                        '206k Views',
                        style: TextStyle(
                          fontSize: 13,
                          color: grayPrimary,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    worldnews['post_time'],
                    style: TextStyle(
                      fontSize: 13,
                      color: lightblue,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Manrope',
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
