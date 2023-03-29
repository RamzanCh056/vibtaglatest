// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';

import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/page/page_video_tab.dart';
import 'package:vibetag/screens/page/page_photo_tab.dart';
import 'package:vibetag/screens/page/post_tab_page.dart';
import 'package:vibetag/screens/page/review_tab.dart';
import 'package:vibetag/screens/page/shop_tab.dart';
import 'package:vibetag/screens/profile/user_video_tab.dart';
import 'package:vibetag/screens/profile/photo_tab.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../utils/constant.dart';
import '../home/create_post/home_search.dart';
import '../home/home_tab_bar.dart';
import '../profile/about_items.dart';

class PageScreen extends StatefulWidget {
  final String page_id;
  const PageScreen({
    Key? key,
    required this.page_id,
  }) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  List<Widget> aboutItems = [];
  Map<String, dynamic> pageData = {};
  bool isLoading = false;
  bool isLiked = false;
  int currenttab = 1;

  @override
  void initState() {
    super.initState();
    getPageData();
  }

  getPageData() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_page_data',
      'sub_type': 'page_info',
      'page_profile_id': widget.page_id,
      'user_id': loginUserId,
    };
    final result = await API().postData(data);
    pageData = jsonDecode(result.body)['page_data'];
    isLiked = pageData['is_liked'];
    addAboutItems();
  }

  addAboutItems() {
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/Group.png',
        leading: 'Page',
        itemName: pageData['page_description'],
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/like_page.png',
        leading: '1234657675',
        itemName: 'People like this',
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/category_items.png',
        leading: pageData['post_count'].toString(),
        itemName: 'Posts',
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/Iconly Bold Work.png',
        leading: '',
        itemName: 'One Opened Job',
        haveIcon: true,
        showButton: true,
        buttonText: 'Apply',
      ),
    );
    setState(() {
      isLoading = false;
    });
  }

  likePage() async {
    final data = {
      'type': 'follow_like_join',
      'action': 'like_page',
      'user_id': loginUserId.toString(),
      'page_id': pageData['page_id'],
    };
    await API().postData(data);
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    Map<String,dynamic> user = Provider.of<UserProvider>(context, listen: false).user;
    List<Widget> screen = isLoading
        ? []
        : [
            Container(
              padding: spacing(
                horizontal: 15,
                vertical: 15,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bio',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    gap(h: 4),
                    Container(
                      child: Text(
                        pageData['about'],
                        style: TextStyle(
                          fontSize: 14,
                          color: grayMed,
                        ),
                      ),
                    ),
                    gap(
                      h: 10,
                    ),
                    Container(
                      height: 1,
                      width: double.maxFinite,
                      color: grayMed,
                    ),
                    gap(
                      h: 10,
                    ),
                    Text(
                      'More Info',
                      style: TextStyle(
                        color: blackPrimary,
                      ),
                    ),
                    gap(h: 10),
                    Container(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: spacing(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(7),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '2k',
                                  style: TextStyle(
                                    color: blackPrimary,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Likes',
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: spacing(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(7),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${getInK(number: int.parse(pageData['post_count'].toString()))}',
                                  style: TextStyle(
                                    color: blackPrimary,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Posts',
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    gap(h: 10),
                    SingleChildScrollView(
                      child: Column(
                        children: aboutItems,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PostTabPage(
              page_id: widget.page_id,
            ),
            PageVideoTab(
              page_id: widget.page_id,
            ),
            PagePhotoTab(
              page_id: widget.page_id,
            ),
            ShopTab(context: context),
            ReviewTab(context: context),
          ];
    return Scaffold(
      body: isLoading
          ? loadingSpinner()
          : SafeArea(
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
                                        child: Image.network(
                                          pageData['cover'],
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
                                            foregroundImage: NetworkImage(
                                                pageData['avatar']),
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
                                                  children: [
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      pageData['name'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    pageData['verified'] != '0'
                                                        ? Icon(
                                                            Icons.verified,
                                                            color: Colors.cyan,
                                                            size: 18,
                                                          )
                                                        : gap(),
                                                  ],
                                                ),
                                                gap(h: 10),
                                                Text(
                                                  pageData['username'],
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
                                                      width: 1,
                                                      color: blackLight),
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
                                                      width: 1,
                                                      color: blackLight),
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
                                                      width: 1,
                                                      color: blackLight),
                                                  borderRadius: borderRadius(7),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${getInK(number: int.parse(pageData['post_count'].toString()))}',
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
                                              InkWell(
                                                onTap: () {
                                                  likePage();
                                                  setState(() {
                                                    isLiked = !isLiked;
                                                  });
                                                },
                                                child: Container(
                                                  padding: spacing(
                                                    horizontal: width * 0.12,
                                                    vertical: 10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: orangePrimary,
                                                    borderRadius:
                                                        borderRadius(5),
                                                  ),
                                                  child: Text(
                                                    isLiked ? 'Liked' : 'Like',
                                                    style: TextStyle(
                                                      color: white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: spacing(
                                                  horizontal: width * 0.10,
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
                                        widget.page_id == loginUserId
                                            ? createPost(user)
                                            //HomeSearchBar(user: user)
                                            : gap(),
                                        gap(h: 10),
                                        Container(
                                          child: DefaultTabController(
                                              initialIndex: 1,
                                              length: 6,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: height * 0.07,
                                                      child: TabBar(
                                                        isScrollable: true,
                                                        unselectedLabelColor:
                                                            blackLight,
                                                        onTap: (i) {
                                                          setState(() {
                                                            currenttab = i;
                                                          });
                                                        },
                                                        labelColor:
                                                            orangePrimary,
                                                        labelStyle:
                                                            const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                        unselectedLabelStyle:
                                                            const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                        tabs: const [
                                                          Tab(
                                                            text: 'About',
                                                          ),
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
                                                  ],
                                                ),
                                              )),
                                        ),
                                        gap(h: 15),
                                        screen[currenttab],
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
