// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../utils/constant.dart';

class LatestPostSlider extends StatefulWidget {
  final List<Widget> posts;
  const LatestPostSlider({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  State<LatestPostSlider> createState() => _LatestPostSliderState();
}

class _LatestPostSliderState extends State<LatestPostSlider> {
  int pageIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slider();
  }

  slider() {
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (pageIndex == widget.posts.length) {
          if (mounted) {
            setState(() {
              pageIndex = 0;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              pageIndex++;
            });
          }
        }
        pageController.animateToPage(
          pageIndex,
          duration: Duration(
            seconds: 1,
          ),
          curve: Curves.easeInSine,
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.5,
            child: PageView(
              reverse: true,
              controller: pageController,
              onPageChanged: (i) {
                pageIndex = i;
              },
              children: widget.posts,
            ),
          ),
          gap(h: 15),
          Container(
            width: double.infinity,
            child: Center(
              child: Container(
                width: widget.posts.length * 15,
                height: 25,
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: widget.posts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Center(
                      child: Container(
                        margin: spacing(
                          horizontal: 3,
                        ),
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(width),
                          color: pageIndex == i ? orange : grayMed,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrendPostWidget extends StatelessWidget {
  final Map<String, dynamic> post;
  const TrendPostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: spacing(
        horizontal: 3,
        vertical: 7,
      ),
      margin: spacing(horizontal: 3),
      child: Container(
        width: width * 0.85,
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
            Container(
              padding: spacing(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: grayMed,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.12,
                        height: width * 0.12,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                width: width * 0.10,
                                height: width * 0.10,
                                child: ClipRRect(
                                  borderRadius: borderRadius(width),
                                  child: Image.network(
                                    post['publisher']['avatar'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: width * 0.12,
                                height: width * 0.12,
                                child: ClipRRect(
                                  borderRadius: borderRadius(width),
                                  child: Image.asset(
                                    'assets/images/avatar_border.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      gap(w: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['publisher']['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          gap(h: 2),
                          Text(
                            post['post_time'].toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: grayMed,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/more_h.png',
                    color: grayMed,
                  )
                ],
              ),
            ),
            gap(h: 7),
            Container(
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              margin: spacing(
                horizontal: 10,
              ),
              child: Text(
                post['Orginaltext'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: grayMed,
                ),
                maxLines: 3,
              ),
            ),
            gap(h: 7),
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: height * 0.25,
                  child: ClipRRect(
                    borderRadius: radiusOnly(
                      topLeft: 7,
                      topRight: 7,
                    ),
                    child: Image.network(
                      post['postFileThumb'].toString().isEmpty
                          ? post['publisher']['avatar']
                          : post['postFileThumb'].toString().contains(serverUrl)
                              ? post['postFileThumb']
                              : '${serverUrl}${post['postFileThumb']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            gap(h: 7),
            Container(
              width: double.maxFinite,
              margin: spacing(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: spacing(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(width),
                          border: Border.all(
                            color: orange,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Reactions',
                              style: TextStyle(
                                color: orange,
                              ),
                            ),
                            gap(w: 7),
                            Text(
                              '${getInK(number: int.parse(post['reaction']['count'].toString()))}',
                              style: TextStyle(
                                color: orange,
                              ),
                            )
                          ],
                        ),
                      ),
                      gap(w: 15),
                      Container(
                        padding: spacing(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(width),
                          color: whiteGray,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/comment.png',
                            ),
                            gap(w: 7),
                            Text(
                              post['post_comments'],
                              style: TextStyle(
                                color: grayMed,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: spacing(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(width),
                      color: whiteGray,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/revibe.png',
                        ),
                        post['post_share'].toString() == '0'
                            ? gap()
                            : gap(w: 7),
                        post['post_share'].toString() == '0'
                            ? gap()
                            : Text(
                                post['post_share'],
                                style: TextStyle(
                                  color: grayMed,
                                ),
                              )
                      ],
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
