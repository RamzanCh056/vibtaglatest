import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/screens/page/photo_tab.dart';
import 'package:vibetag/screens/page/post_tab.dart';
import 'package:vibetag/screens/page/videos_tab.dart';
import 'package:vibetag/screens/profile/group_tab.dart';
import 'package:vibetag/screens/profile/like_tab.dart';
import 'package:vibetag/widgets/bottom_navigation_bar.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../model/user.dart';
import '../../provider/userProvider.dart';
import '../../utils/constant.dart';
import '../home/comment.dart';
import '../home/home_search.dart';
import '../home/home_tab_bar.dart';
import '../home/revibe.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                        Container(
                          width: width,
                          height: width * 0.8,
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
                                          horizontal: 10,
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
                                          horizontal: 10,
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
                                              'Followers',
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
                                          horizontal: 10,
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
                                              '234',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            Text(
                                              'Following',
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
                                          horizontal: 10,
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
                                              '9M+',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            Text(
                                              'Views',
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
                                          'Follow',
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
                                  color: backgroundColor,
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
                                                labelStyle: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                                unselectedLabelStyle:
                                                    const TextStyle(
                                                  fontSize: 14,
                                                ),
                                                tabs: const [
                                                  Tab(
                                                    text: 'Timeline',
                                                  ),
                                                  Tab(
                                                    text: 'Groups',
                                                  ),
                                                  Tab(
                                                    text: 'Likes',
                                                  ),
                                                  Tab(
                                                    text: 'Videos',
                                                  ),
                                                  Tab(
                                                    text: 'Photos',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.maxFinite,
                                              height: height * 0.7,
                                              child: TabBarView(children: [
                                                PostTab(context: context),
                                                GroupTab(context: context),
                                                LikeTab(context: context),
                                                VideoTab(context: context),
                                                PhotoTab(context: context),
                                              ]),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        gap(h: 10)
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
