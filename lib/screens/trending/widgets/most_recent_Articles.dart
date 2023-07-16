// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant.dart';

class MostRecentArticles extends StatefulWidget {
  List<dynamic> most_recent_articles;
  MostRecentArticles({
    Key? key,
    required this.most_recent_articles,
  }) : super(key: key);

  @override
  State<MostRecentArticles> createState() => _MostRecentArticlesState();
}

class _MostRecentArticlesState extends State<MostRecentArticles> {
  List<Widget> trendingPopularBlogs = [];
  List<Widget> currentWidgets = [];

  int pageIndex = 0;
  final PageController _BlogsController = PageController(initialPage: 0);
  void setWidgets() {
    int countWidget = 0;
    currentWidgets = [];
    for (var post in widget.most_recent_articles) {
      countWidget++;
      if (post['id'] != null) {
        currentWidgets.add(
          blogTrendingWidget(
            blog: post,
          ),
        );
        if (countWidget == 4 ||
            post['id'] ==
                widget.most_recent_articles[
                    (widget.most_recent_articles.length - 1)]['id']) {
          trendingPopularBlogs.add(
            Column(children: currentWidgets),
          );
          countWidget = 0;
          currentWidgets = [];
        }
      }
    }
    
    setSlider();
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
          'Most Recent Articles',
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
            controller: _BlogsController,
            children: trendingPopularBlogs,
          ),
        ),
      ],
    );
  }

  void setSlider() {
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (mounted) {
          if (pageIndex == (trendingPopularBlogs.length - 1)) {
            setState(() {
              pageIndex = 0;
            });
          } else {
            setState(() {
              pageIndex++;
            });
          }

          _BlogsController.animateToPage(pageIndex,
              duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
        }
      },
    );
  }
}

blogTrendingWidget({
  required Map<String, dynamic> blog,
}) {
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
                    fontSize: FontSize(14.0),
                    textOverflow: TextOverflow.ellipsis,
                    color: blackPrimary,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Manrope',
                    maxLines: 2,
                  ),
                  'a': Style(
                    color: orangePrimary,
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
                      fontSize: 14,
                      color: lightblue,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  gap(w: 4),
                  Text(
                    blog['author']['name'],
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
                      Image.asset('assets/images/eye.png'),
                      gap(w: 7),
                      Text(
                        '${getInK(number: int.parse(blog['view'].toString()))}+ views',
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
                    readTimestamp(int.parse(blog['posted'].toString())),
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
