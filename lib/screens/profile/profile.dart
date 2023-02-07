import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/model/user_details.dart';
import 'package:vibetag/provider/user_detailsProvider.dart';
import 'package:vibetag/screens/profile/photo_tab.dart';
import 'package:vibetag/screens/profile/post_tab_profile.dart';
import 'package:vibetag/screens/page/videos_tab.dart';
import 'package:vibetag/screens/profile/group_tab.dart';
import 'package:vibetag/screens/profile/like_tab.dart';
import 'package:vibetag/widgets/bottom_navigation_bar.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../methods/api.dart';
import '../../methods/auth_method.dart';
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
  late ModelUser user;
  late UserDetails userDetails;
  bool isLoading = false;
  bool followLoading = false;
  bool isFollowing = false;
  String profileUserId = '1724025';
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  getUsers() async {
    user = Provider.of<UserProvider>(context, listen: false).user;
    userDetails =
        Provider.of<UsersDetailsProvider>(context, listen: false).userDetails;

    if (user.username == '') {
      setState(() {
        isLoading = true;
      });
      await AuthMethod().setUser(
        context: context,
        userId: loginUserId,
      );
      user = Provider.of<UserProvider>(context, listen: false).user;
      userDetails =
          Provider.of<UsersDetailsProvider>(context, listen: false).userDetails;

      setState(() {
        isLoading = false;
      });
    }
  }

  void followUser() async {
    setState(() {
      isFollowing = !isFollowing;
      followLoading = true;
    });

    final data = {
      'type': 'follow_user_startup',
      'user_id': loginUserId,
      'user': profileUserId,
    };

    await API().postData(data);
    setState(() {
      followLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

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
                                        user.cover!,
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
                                            foregroundImage:
                                                NetworkImage(user.avatar!),
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
                                                    '${user.first_name} ${user.last_name}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  gap(w: 5),
                                                  const Icon(
                                                    Icons.verified,
                                                    color: Colors.cyan,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                              gap(h: 5),
                                              Text(
                                                '${user.username}',
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
                                                    '${getInK(number: userDetails.total_reactions)}',
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
                                                    '${getInK(number: int.parse(userDetails.followers_count))}',
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
                                                    '${getInK(number: int.parse(userDetails.following_count))}',
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
                                                    '${getInK(number: int.parse(userDetails.video_views))}',
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
                                            user.user_id == loginUserId
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
                                                : followLoading
                                                    ? loadingSpinner()
                                                    : InkWell(
                                                        onTap: followUser,
                                                        child: Container(
                                                          padding: spacing(
                                                            horizontal:
                                                                width * 0.15,
                                                            vertical: 10,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                orangePrimary,
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
                                            user.user_id == loginUserId
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
                                            user.user_id == loginUserId
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
                                            initialIndex: 0,
                                            length: 5,
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
                                                    child:
                                                        TabBarView(children: [
                                                      PostTabProfile(
                                                          user: user),
                                                      GroupTab(user: user),
                                                      LikeTab(user: user),
                                                      VideoTab(),
                                                      PhotoTab()
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
