// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';

import 'package:vibetag/model/user_details.dart';
import 'package:vibetag/provider/user_detailsProvider.dart';
import 'package:vibetag/screens/profile/user_video_tab.dart';
import 'package:vibetag/screens/profile/about_items.dart';
import 'package:vibetag/screens/profile/group_tab.dart';
import 'package:vibetag/screens/profile/like_tab.dart';
import 'package:vibetag/screens/profile/photo_tab.dart';
import 'package:vibetag/screens/profile/post_tab_profile.dart';
import 'package:vibetag/widgets/bottom_navigation_bar.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../methods/api.dart';
import '../../methods/auth_method.dart';
import '../../model/user.dart';
import '../../provider/userProvider.dart';
import '../../utils/constant.dart';
import 'followers_screen.dart';

class Profile extends StatefulWidget {
  final String user_id;
  const Profile({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Widget> aboutItems = [];
  late dynamic profileUser;
  late dynamic profileUserDetails;
  bool isLoading = false;
  bool followLoading = false;
  bool isFollowing = false;
  bool isScrollDown = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getUsers();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isScrollDown = true;
        });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          isScrollDown = false;
        });
      }
    });
  }

  getUsers() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_user_data',
      'sub_type': 'profile_info',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id
    };
    final result = await API().postData(data);
    profileUser = jsonDecode(result.body)['user_data'];
    profileUserDetails = jsonDecode(result.body)['user_data']['details'];
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/Work.png',
        leading: 'Working at',
        itemName: profileUser['working'],
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/user_location.png',
        leading: 'Lives in',
        itemName: profileUser['address'],
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/birthday_date.png',
        leading: 'Born in',
        itemName: profileUser['birthday'],
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/relationship_status.png',
        leading: relationship[int.parse(
          profileUser['relationship_id'].toString(),
        )],
        itemName: '',
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/birthday_date.png',
        leading: 'Born in',
        itemName: profileUser['birthday'],
        haveIcon: true,
      ),
    );
    if (profileUser['side_fields'].length > 0) {
      for (var i = 0; i < profileUser['side_fields'].length; i++) {
        if (aboutIcons[i] != '') {
          aboutItems.add(
            AboutItems(
              context: context,
              iconsUrl: aboutIcons[i],
              haveIcon: aboutIcons[i] != '' ? true : false,
              leading: profileUser['side_fields'][i]['name'],
              itemName: profileUser['side_fields'][i]['user_value'],
            ),
          );
        }
      }
      for (var i = 0; i < profileUser['side_fields'].length; i++) {
        if (aboutIcons[i] == '') {
          aboutItems.add(
            AboutItems(
              context: context,
              iconsUrl: aboutIcons[i],
              haveIcon: aboutIcons[i] != '' ? true : false,
              leading: profileUser['side_fields'][i]['name'],
              itemName: profileUser['side_fields'][i]['user_value'],
            ),
          );
        }
      }
    }
    if (profileUser['followers_data'].indexOf(loginUserId.toString()) != -1) {
      setState(() {
        isFollowing = true;
      });
    } else {
      setState(() {
        isFollowing = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void followUser() async {
    setState(() {
      isFollowing = !isFollowing;
    });

    final data = {
      'type': 'follow_user_startup',
      'user_id': loginUserId,
      'user': widget.user_id == loginUserId.toString()
          ? loginUserId.toString()
          : widget.user_id.toString(),
    };

    await API().postData(data);
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    ModelUser user = Provider.of<UserProvider>(context, listen: false).user;

    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? loadingSpinner()
            : Container(
                width: width,
                height: height,
                color: backgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      isScrollDown ? gap() : NavBar(),
                      Header(),
                      Container(
                        width: double.infinity,
                        height: isScrollDown ? height * 0.93 : height * 0.875,
                        child: ListView.builder(
                          itemCount: 1,
                          controller: scrollController,
                          itemBuilder: (context, index) => Column(
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
                                        profileUser['cover'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: width * 0.25,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 3,
                                                color: whitePrimary,
                                              ),
                                              borderRadius:
                                                  borderRadius(width)),
                                          child: CircleAvatar(
                                            radius: width * 0.15,
                                            foregroundImage: NetworkImage(
                                                profileUser['avatar']),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: width * 0.02,
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
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '${profileUser['first_name']} ${profileUser['last_name']}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  gap(w: 5),
                                                  profileUser['verified'] != '0'
                                                      ? const Icon(
                                                          Icons.verified,
                                                          color: Colors.cyan,
                                                          size: 18,
                                                        )
                                                      : gap()
                                                ],
                                              ),
                                              gap(h: 5),
                                              Text(
                                                '${profileUser['username']}',
                                                style: const TextStyle(
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
                                                    width: 1,
                                                    color: blackLight),
                                                borderRadius: borderRadius(7),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${getInK(number: profileUserDetails['total_reactions'] != '[]' ? int.parse(profileUserDetails['total_reactions'].toString()) : 0)}',
                                                    style: const TextStyle(
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
                                                    width: 1,
                                                    color: blackLight),
                                                borderRadius: borderRadius(7),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${getInK(number: profileUserDetails['followers_count'] != null ? int.parse(profileUserDetails['followers_count'].toString()) : 0)}',
                                                    style: const TextStyle(
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
                                                    width: 1,
                                                    color: blackLight),
                                                borderRadius: borderRadius(7),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${getInK(number: profileUserDetails['following_count'] != null ? int.parse(profileUserDetails['following_count'].toString()) : 0)}',
                                                    style: const TextStyle(
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
                                                    width: 1,
                                                    color: blackLight),
                                                borderRadius: borderRadius(7),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${getInK(number: profileUserDetails['video_views'] != null ? int.parse(profileUserDetails['video_views'].toString()) : 0)}',
                                                    style: const TextStyle(
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
                                            widget.user_id == loginUserId
                                                ? Container(
                                                    padding: spacing(
                                                      horizontal: width * 0.15,
                                                      vertical: 10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: orangePrimary,
                                                      borderRadius:
                                                          borderRadius(5),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.edit,
                                                          size: 16,
                                                          color: white,
                                                        ),
                                                        gap(w: 5),
                                                        Text(
                                                          'Edit',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: followUser,
                                                    child: Container(
                                                      padding: spacing(
                                                        horizontal:
                                                            width * 0.15,
                                                        vertical: 10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: orangePrimary,
                                                        borderRadius:
                                                            borderRadius(5),
                                                      ),
                                                      child: Text(
                                                        isFollowing
                                                            ? 'Following'
                                                            : 'Follow',
                                                        style: TextStyle(
                                                          color: white,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            widget.user_id == loginUserId
                                                ? Container(
                                                    padding: spacing(
                                                      horizontal: width * 0.15,
                                                      vertical: 10,
                                                    ),
                                                    margin: spacing(
                                                      horizontal: 2,
                                                      vertical: 2,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          borderRadius(5),
                                                      color: orange,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.list,
                                                          size: 16,
                                                          color: white,
                                                        ),
                                                        gap(w: 5),
                                                        Text(
                                                          'Activities',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    padding: spacing(
                                                      horizontal: width * 0.15,
                                                      vertical: 10,
                                                    ),
                                                    margin: spacing(
                                                      horizontal: 2,
                                                      vertical: 2,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          borderRadius(5),
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
                                            widget.user_id == loginUserId
                                                ? gap()
                                                : Icon(
                                                    Icons.more_vert_rounded,
                                                    color: grayMed,
                                                  )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: backgroundColor,
                                        child: DefaultTabController(
                                            initialIndex: 1,
                                            length: 6,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: height * 0.04,
                                                    child: TabBar(
                                                      isScrollable: true,
                                                      unselectedLabelColor:
                                                          blackLight,
                                                      labelColor: orangePrimary,
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
                                                    height: height * 0.89,
                                                    child: TabBarView(
                                                        children: [
                                                          Container(
                                                            padding: spacing(
                                                              horizontal: 15,
                                                              vertical: 15,
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Bio',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                  ),
                                                                  gap(h: 4),
                                                                  profileUser['about'] !=
                                                                          null
                                                                      ? Container(
                                                                          child:
                                                                              Text(
                                                                            profileUser['about'],
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              color: grayMed,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : gap(),
                                                                  gap(
                                                                    h: 10,
                                                                  ),
                                                                  Container(
                                                                    height: 1,
                                                                    width: double
                                                                        .maxFinite,
                                                                    color:
                                                                        grayMed,
                                                                  ),
                                                                  gap(
                                                                    h: 10,
                                                                  ),
                                                                  Text(
                                                                    'More Info',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          blackPrimary,
                                                                    ),
                                                                  ),
                                                                  gap(h: 10),
                                                                  Container(
                                                                    width: double
                                                                        .maxFinite,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            pushRoute(
                                                                                context: context,
                                                                                screen: Followers());
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                spacing(
                                                                              horizontal: 40,
                                                                              vertical: 15,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: white,
                                                                              borderRadius: borderRadius(7),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Text(
                                                                                  getInK(number: int.parse(profileUserDetails['followers_count'])).toString(),
                                                                                  style: TextStyle(
                                                                                    color: blackPrimary,
                                                                                    fontSize: 14,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Followers',
                                                                                  style: TextStyle(
                                                                                    color: grayMed,
                                                                                    fontSize: 10,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            pushRoute(
                                                                                context: context,
                                                                                screen: Followers());
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                spacing(
                                                                              horizontal: 40,
                                                                              vertical: 15,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: white,
                                                                              borderRadius: borderRadius(7),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Text(
                                                                                  getInK(number: int.parse(profileUserDetails['following_count'])).toString(),
                                                                                  style: TextStyle(
                                                                                    color: blackPrimary,
                                                                                    fontSize: 14,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Following',
                                                                                  style: TextStyle(
                                                                                    color: grayMed,
                                                                                    fontSize: 10,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  gap(h: 10),
                                                                  SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children:
                                                                          aboutItems,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          PostTabProfile(
                                                            user_id:
                                                                widget.user_id,
                                                            user: user,
                                                          ),
                                                          GroupTab(
                                                            user_id:
                                                                widget.user_id,
                                                          ),
                                                          LikeTab(
                                                            user_id:
                                                                widget.user_id,
                                                          ),
                                                          UserVideoTab(
                                                            user_id:
                                                                widget.user_id,
                                                          ),
                                                          PhotoTab(
                                                            user_id:
                                                                widget.user_id,
                                                          )
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
