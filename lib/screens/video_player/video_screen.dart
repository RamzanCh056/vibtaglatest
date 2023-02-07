import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/model/user_details.dart';
import 'package:vibetag/provider/user_detailsProvider.dart';
import 'package:vibetag/screens/profile/photo_tab.dart';
import 'package:vibetag/screens/profile/post_tab_profile.dart';
import 'package:vibetag/screens/page/videos_tab.dart';
import 'package:vibetag/screens/profile/group_tab.dart';
import 'package:vibetag/screens/profile/like_tab.dart';
import 'package:vibetag/screens/video_player/page_video_player.dart';
import 'package:vibetag/screens/video_player/video_player.dart';
import 'package:vibetag/widgets/bottom_navigation_bar.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:video_player/video_player.dart';

import '../../methods/api.dart';
import '../../methods/auth_method.dart';
import '../../model/user.dart';
import '../../provider/userProvider.dart';
import '../../utils/constant.dart';
import '../home/comment.dart';
import '../home/home_search.dart';
import '../home/home_tab_bar.dart';
import '../home/revibe.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<String> videoBar = [
    'You may like',
    'Related video',
    'Music',
    'Entertainment'
  ];
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    String videoUrl =
        'https://vibetagspace.nyc3.digitaloceanspaces.com/upload/videos/2022/12/vtmuirRZfa7Leb3kh78P_30_da602fae99e84dc3407923dca254cc50_video.mp4';
    print(videoUrl);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBar(),
                Header(),
                Container(
                  width: double.infinity,
                  height: height * 0.875,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: double.maxFinite,
                                child: Center(
                                  child: PageVideoPlayer(
                                    videoUrl: videoUrl,
                                    showFullScreen: true,
                                    showTime: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: spacing(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  gap(
                                    h: 10,
                                  ),
                                  Text(
                                    'IceAge - Dawn of the Dinosaurs',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: blackPrimary,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
                                            child: Icon(
                                              Icons.remove_red_eye,
                                              size: 16,
                                              color: grayMed,
                                            ),
                                          ),
                                          gap(w: 3),
                                          Text(
                                            '1.2k views',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: blackLight,
                                            ),
                                          ),
                                        ],
                                      ),
                                      gap(w: 20),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
                                            child: Container(
                                              width: 14,
                                              child: Image.asset(
                                                'assets/new/icons/heart.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          gap(w: 3),
                                          Text(
                                            '238 Reacts',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: blackLight,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/new/icons/more_v.png',
                                color: grayMed,
                              )
                            ],
                          ),
                        ),
                        gap(
                          h: 10,
                        ),
                        Container(
                          margin: spacing(horizontal: 15),
                          height: 1,
                          width: double.maxFinite,
                          color: grayMed,
                        ),
                        gap(
                          h: 10,
                        ),
                        Padding(
                          padding: spacing(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.03,
                                      height: width * 0.03,
                                      child: Image.asset(
                                        'assets/new/icons/heart.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'React',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Comments(
                                    context: context,
                                  );
                                },
                                child: Row(
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
                                      'Comment',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Revibe(context: context);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.03,
                                      height: width * 0.03,
                                      child: Image.asset(
                                        'assets/new/icons/revibe.png',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Revibe',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        gap(
                          h: 10,
                        ),
                        Container(
                          margin: spacing(horizontal: 15),
                          height: 1,
                          width: double.maxFinite,
                          color: grayMed,
                        ),
                        gap(
                          h: 10,
                        ),
                        Padding(
                          padding: spacing(
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: const AssetImage(
                                      'assets/new/images/user.png',
                                    ),
                                    radius: width * 0.08,
                                  ),
                                  gap(w: 10),
                                  Column(
                                    children: [
                                      const Text(
                                        'Cartoon Box',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      gap(h: 5),
                                      Text(
                                        '1.2k followers',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: blackLight,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      HexColor('#FFC107'),
                                      HexColor('#FE9700'),
                                    ],
                                  ),
                                  borderRadius: borderRadius(5),
                                ),
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        gap(h: 10),
                        Padding(
                          padding: spacing(horizontal: 15),
                          child: Center(
                            child: Container(
                              width: width * 0.9,
                              child: Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry...Read more',
                                style: TextStyle(
                                  color: blackLight,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        gap(h: 10),
                        Container(
                          height: height * 0.05,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: videoBar.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) {
                                if (i == 0) {
                                  return Container(
                                    margin: spacing(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    padding: spacing(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: orangePrimary,
                                      ),
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Center(
                                      child: Text(
                                        videoBar[i],
                                        style: TextStyle(
                                          color: orange,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  margin: spacing(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  padding: spacing(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(width),
                                  ),
                                  child: Center(
                                    child: Text(
                                      videoBar[i],
                                      style: TextStyle(
                                        color: grayMed,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          height: height * 0.75,
                          width: double.infinity,
                          padding: spacing(horizontal: 15),
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: spacing(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: width * 0.25,
                                        height: width * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius: borderRadius(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: borderRadius(10),
                                          child: Image.asset(
                                            'assets/images/streamer.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      gap(w: 10),
                                      Container(
                                        width: width * 0.65,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: width * 0.5,
                                                    child: const Text(
                                                      'IceAge - Dawn of the Dinosaur',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  gap(h: 15),
                                                  Row(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 4),
                                                            child: Icon(
                                                              Icons
                                                                  .remove_red_eye,
                                                              size: 16,
                                                              color: grayMed,
                                                            ),
                                                          ),
                                                          gap(w: 3),
                                                          Text(
                                                            '1.2k views',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color: blackLight,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      gap(w: 10),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 4),
                                                            child: Container(
                                                              width: 14,
                                                              child:
                                                                  Image.asset(
                                                                'assets/new/icons/heart.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          gap(w: 3),
                                                          Text(
                                                            '238 Reacts',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color: blackLight,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: width * 0.05,
                                              child: Image.asset(
                                                'assets/new/icons/more_v.png',
                                                color: grayMed,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
