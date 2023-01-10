import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/model/user.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/home/home_search.dart';
import 'package:vibetag/screens/home/home_tab_bar.dart';
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
import '../home/revibe.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    ModelUser user = Provider.of<UserProvider>(context, listen: false).user;

    return Scaffold(
      backgroundColor: backgroundColor,
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
                                    'assets/images/group_cover.png',
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
                                          'assets/images/group_avatar.png'),
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
                                                'Epic Crash',
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
                                          gap(h: 2.5),
                                          const Text(
                                            '@epic_crash1',
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
                                                width: 1, color: grayMed),
                                            borderRadius: borderRadius(7),
                                          ),
                                          child: Column(
                                            children: [
                                              const Text(
                                                '2.1M',
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
                                                width: 1, color: grayMed),
                                            borderRadius: borderRadius(7),
                                          ),
                                          child: Column(
                                            children: [
                                              const Text(
                                                '3.2M',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                'Members',
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
                                                width: 1, color: grayMed),
                                            borderRadius: borderRadius(7),
                                          ),
                                          child: Column(
                                            children: [
                                              const Text(
                                                '12k',
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
                                    child: Center(
                                      child: Container(
                                        width: width * 0.9,
                                        padding: spacing(
                                          horizontal: width * 0.15,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orangePrimary,
                                          borderRadius: borderRadius(5),
                                        ),
                                        child: Text(
                                          'Join Now',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  HomeTabBar(),
                                  gap(h: 10),
                                  HomeSearchBar(user: user),
                                  gap(h: 10),
                                  Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: PostTab(context: context),
                                          ),
                                          Padding(
                                            padding: spacing(horizontal: 10),
                                            child: const Text(
                                              'Suggested Groups',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          gap(h: 10),
                                          Padding(
                                            padding: spacing(horizontal: 10),
                                            child: Container(
                                              height: height * 0.38,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 10,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      width: width * 0.65,
                                                      margin: spacing(
                                                        horizontal: 10,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                            ),
                                                            child: Container(
                                                              height:
                                                                  height * 0.2,
                                                              width:
                                                                  width * 0.65,
                                                              child:
                                                                  Image.asset(
                                                                'assets/new/images/wwe.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: spacing(
                                                                horizontal: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color:
                                                                        white,
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10),
                                                                    )),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                gap(h: 10),
                                                                Container(
                                                                  width: width *
                                                                      0.6,
                                                                  child:
                                                                      const Text(
                                                                    'WWE Wrestling',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ),
                                                                gap(h: 5),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Public Group',
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            grayMed,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                    gap(w: 5),
                                                                    Container(
                                                                      width: 4,
                                                                      height: 4,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            borderRadius(4),
                                                                        color:
                                                                            grayMed,
                                                                      ),
                                                                    ),
                                                                    gap(w: 5),
                                                                    Text(
                                                                      '170k members',
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            grayMed,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                gap(h: 10),
                                                                Center(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        width *
                                                                            0.55,
                                                                    padding:
                                                                        spacing(
                                                                      vertical:
                                                                          10,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          orangePrimary,
                                                                      borderRadius:
                                                                          borderRadius(
                                                                              10),
                                                                    ),
                                                                    child: Text(
                                                                      'Join Now',
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            whitePrimary,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                ),
                                                                gap(h: 20),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
