import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/model/user.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/page/page_video_player.dart';
import 'package:vibetag/screens/page/photo_tab.dart';
import 'package:vibetag/screens/page/post_tab.dart';
import 'package:vibetag/screens/page/review_tab.dart';
import 'package:vibetag/screens/page/shop_tab.dart';
import 'package:vibetag/screens/page/videos_tab.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../utils/constant.dart';
import '../home/comment.dart';
import '../home/home_search.dart';
import '../home/home_tab_bar.dart';
import '../home/revibe.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({super.key});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    ModelUser user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SafeArea(
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
                          Container(
                            width: width,
                            height: width * 0.75,
                            decoration: BoxDecoration(
                              color: white,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: width,
                                  height: width * 0.4,
                                  child: Image.asset(
                                    'assets/new/images/cover.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: width * 0.25,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: width * 0.15,
                                      foregroundImage: AssetImage(
                                          'assets/new/images/user.png'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: width * 0.05,
                                  child: Container(
                                    width: width,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                'Mark Henry',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Icon(
                                                Icons.verified,
                                                color: Colors.cyan,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                          gap(h: 10),
                                          const Text(
                                            '@mark_h01',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    color: white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: spacing(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: blackLight),
                                            borderRadius: borderRadius(7),
                                          ),
                                          child: Column(
                                            children: [
                                              const Text(
                                                '11k',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                'Likes',
                                                style: TextStyle(
                                                  color: blackLight,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: blackLight),
                                            borderRadius: borderRadius(7),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                '234k',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                'Reactions',
                                                style: TextStyle(
                                                  color: blackLight,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: blackLight),
                                            borderRadius: borderRadius(7),
                                          ),
                                          child: Column(
                                            children: [
                                              const Text(
                                                '358',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                'Posts',
                                                style: TextStyle(
                                                  color: blackLight,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: white,
                                    padding: spacing(vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: spacing(
                                            horizontal: width * 0.15,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: orangePrimary,
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Text(
                                            'Like',
                                            style: TextStyle(
                                              color: white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: width * 0.15,
                                            vertical: 10,
                                          ),
                                          margin: spacing(
                                            horizontal: 2,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: borderRadius(5),
                                            border: Border.all(
                                              width: 1,
                                              color: orangePrimary,
                                            ),
                                          ),
                                          child: Text(
                                            'Message',
                                            style: TextStyle(
                                              color: orangePrimary,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.more_vert_rounded,
                                          color: grayMed,
                                        )
                                      ],
                                    ),
                                  ),
                                  HomeTabBar(),
                                  gap(h: 10),
                                  HomeSearchBar(user: user),
                                  gap(h: 10),
                                  gap(h: 10),
                                  Container(
                                    child: DefaultTabController(
                                        initialIndex: 1,
                                        length: 5,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height * 0.07,
                                                child: TabBar(
                                                  isScrollable: true,
                                                  unselectedLabelColor:
                                                      blackLight,
                                                  labelColor: orangePrimary,
                                                  labelStyle: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                  unselectedLabelStyle:
                                                      TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                  tabs: const [
                                                    Tab(
                                                      text: 'Timeline',
                                                    ),
                                                    Tab(
                                                      text: 'Videos',
                                                    ),
                                                    Tab(
                                                      text: 'Photos',
                                                    ),
                                                    Tab(
                                                      text: 'Shops',
                                                    ),
                                                    Tab(
                                                      text: 'Reviews',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.maxFinite,
                                                height: height * 0.7,
                                                child: TabBarView(children: [
                                                  PostTab(context: context),
                                                  VideoTab(context: context),
                                                  PhotoTab(context: context),
                                                  ShopTab(context: context),
                                                  ReviewTab(context: context),
                                                ]),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
