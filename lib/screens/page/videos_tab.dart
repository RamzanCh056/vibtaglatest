import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vibetag/screens/page/page_video_player.dart';

import '../../utils/constant.dart';

Widget VideoTab({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Container(
    width: width * 0.95,
    color: backgroundColor,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: spacing(
              horizontal: 10,
              vertical: 10,
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: borderRadius(10),
                child: PageVideoPlayer(
                  videoUrl:
                      'https://assets.mixkit.co/videos/preview/mixkit-waves-on-the-sand-of-a-sunny-beach-44400-large.mp4',
                  showFullScreen: false,
                  showSlider: false,
                  showTime: false,
                  buttonSize: 60,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: width * 0.9,
              child: const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
          gap(h: 10),
          Padding(
            padding: spacing(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: spacing(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(20),
                    border: Border.all(
                      width: 1,
                      color: orangePrimary,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_emotions_sharp,
                        color: orangePrimary,
                        size: 18,
                      ),
                      gap(w: 5),
                      Center(
                        child: Text(
                          '11.2k',
                          style: TextStyle(
                            color: orangePrimary,
                            fontSize: 8,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.03,
                      height: width * 0.03,
                      child: Image.asset(
                        'assets/new/icons/comment.png',
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '144',
                      style: TextStyle(
                        fontSize: 10,
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width * 0.05,
                  height: width * 0.05,
                  child: Image.asset(
                    'assets/new/icons/revibe.png',
                  ),
                )
              ],
            ),
          ),
          gap(h: 10),
          Container(
            height: height * 0.6,
            width: width * 0.95,
            child: GridView.builder(
              itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: whitePrimary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.13,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: borderRadius(10),
                              child: PageVideoPlayer(
                                videoUrl:
                                    'https://assets.mixkit.co/videos/preview/mixkit-waves-on-the-sand-of-a-sunny-beach-44400-large.mp4',
                                showFullScreen: false,
                                showSlider: false,
                                showTime: false,
                                buttonSize: 40,
                              ),
                            ),
                          ),
                        ),
                        gap(h: 10),
                        Container(
                          width: width * 0.45,
                          padding: spacing(horizontal: 10),
                          child: const Text(
                            'Lorem Ipsum is the simply dummy...',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        gap(h: 10),
                        Padding(
                          padding: spacing(horizontal: 10),
                          child: Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.03,
                                    height: width * 0.03,
                                    child: Image.asset(
                                      'assets/new/icons/heart.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '144',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: grayMed,
                                    ),
                                  ),
                                ],
                              ),
                              gap(w: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.03,
                                    height: width * 0.03,
                                    child: Image.asset(
                                      'assets/new/icons/comment.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '144',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: grayMed,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ),
  );
}
