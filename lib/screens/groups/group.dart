// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';

import 'package:vibetag/model/user.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/groups/Methods/group_methods.dart';
import 'package:vibetag/screens/groups/post_tab_group.dart';
import 'package:vibetag/screens/home/home_search.dart';
import 'package:vibetag/screens/home/home_tab_bar.dart';

import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../utils/constant.dart';
import '../page/shop_tab.dart';
import '../profile/about_items.dart';

class GroupScreen extends StatefulWidget {
  final String group_id;
  const GroupScreen({
    Key? key,
    required this.group_id,
  }) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  late dynamic group;
  bool isLoading = false;
  List<Widget> aboutItems = [];
  bool isJoined = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGroupData();
  }

  getGroupData() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_group_data',
      'group_profile_id': widget.group_id.toString(),
      'user_id': loginUserId,
    };
    final result = await API().postData(data);
    group = jsonDecode(result.body)['group_data'];
    isJoined = group['is_joined'];

    addAboutItems();
    setState(() {
      isLoading = false;
    });
  }

  joinGroup() async {
    setState(() {
      isJoined = !isJoined;
    });
    await GroupMethod().JoinGroup(group_id: widget.group_id);
  }

  addAboutItems() {
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/like_page.png',
        leading: '${group['members_count']}',
        itemName: 'Members',
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/icons/lock.png',
        leading: '',
        itemName: group['privacy'] == '2' ? 'Public' : 'Private',
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/Group.png',
        leading: '',
        itemName: '${group['category']}',
        haveIcon: true,
      ),
    );
    aboutItems.add(
      AboutItems(
        context: context,
        iconsUrl: 'assets/new/icons/category_items.png',
        leading: '${group['post_count']}',
        itemName: 'Posts',
        haveIcon: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: isLoading
            ? loadingSpinner()
            : Container(
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
                                          group['cover']
                                                  .toString()
                                                  .contains(serverUrl)
                                              ? group['cover'].toString().trim()
                                              : '${serverUrl}${group['cover'].toString().trim()}',
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
                                              group['avatar']
                                                      .toString()
                                                      .contains(serverUrl)
                                                  ? group['avatar']
                                                      .toString()
                                                      .trim()
                                                  : '${serverUrl}${group['avatar'].toString().trim()}',
                                            ),
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
                                                      '${group['group_title']}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    gap(w: 5),
                                                    Icon(
                                                      Icons.verified,
                                                      color: Colors.cyan,
                                                      size: 18,
                                                    )
                                                  ],
                                                ),
                                                gap(h: 2.5),
                                                Text(
                                                  '${group['username']}',
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
                                                    Text(
                                                      '${group['members_count']}',
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
                                                    Text(
                                                      '${group['post_count']}',
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
                                        group['is_owner']
                                            ? Container(
                                                color: white,
                                                padding: spacing(
                                                  vertical: 10,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: height * 0.045,
                                                      width: width * 0.3,
                                                      decoration: BoxDecoration(
                                                        color: orange,
                                                        borderRadius:
                                                            borderRadius(5),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Edit',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontSize: 12,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                    gap(w: 20),
                                                    Container(
                                                      height: height * 0.045,
                                                      width: width * 0.3,
                                                      decoration: BoxDecoration(
                                                        color: orange,
                                                        borderRadius:
                                                            borderRadius(5),
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Add Frieds',
                                                              style: TextStyle(
                                                                color: white,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            gap(w: 10),
                                                            Image.asset(
                                                              'assets/icons/lock.png',
                                                              color: white,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  joinGroup();
                                                },
                                                child: Container(
                                                  color: white,
                                                  padding:
                                                      spacing(vertical: 15),
                                                  child: Center(
                                                    child: Container(
                                                      width: width * 0.9,
                                                      padding: spacing(
                                                        horizontal:
                                                            width * 0.12,
                                                        vertical: 10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: orangePrimary,
                                                        borderRadius:
                                                            borderRadius(5),
                                                      ),
                                                      child: Text(
                                                        isJoined
                                                            ? 'Joined'
                                                            : 'Join Now',
                                                        style: TextStyle(
                                                          color: white,
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        HomeTabBar(),
                                        Container(
                                          child: DefaultTabController(
                                              initialIndex: 1,
                                              length: 2,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: height * 0.05,
                                                      child: TabBar(
                                                        isScrollable: true,
                                                        unselectedLabelColor:
                                                            blackLight,
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
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.maxFinite,
                                                      height: height * 0.8,
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
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        '${group['about']}',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              grayMed,
                                                                        ),
                                                                      ),
                                                                    ),
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
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
                                                                                  '${getInK(number: int.parse(group['members_count'].toString()))}',
                                                                                  style: TextStyle(
                                                                                    color: blackPrimary,
                                                                                    fontSize: 14,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Members',
                                                                                  style: TextStyle(
                                                                                    color: grayMed,
                                                                                    fontSize: 10,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
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
                                                                                  '${getInK(number: int.parse(group['post_count'].toString()))}',
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
                                                                    Column(
                                                                      children:
                                                                          aboutItems,
                                                                    ),
                                                                    gap(h: 10),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            SingleChildScrollView(
                                                              child: Column(
                                                                children: [
                                                                  gap(h: 10),
                                                                  Container(
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                spacing(horizontal: 10),
                                                                            child:
                                                                                const Text(
                                                                              'Suggested Groups',
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          gap(h: 10),
                                                                          Padding(
                                                                            padding:
                                                                                spacing(horizontal: 10),
                                                                            child:
                                                                                Container(
                                                                              height: height * 0.38,
                                                                              width: double.infinity,
                                                                              child: ListView.builder(
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  itemCount: 10,
                                                                                  itemBuilder: (context, index) {
                                                                                    return Container(
                                                                                      width: width * 0.65,
                                                                                      margin: spacing(
                                                                                        horizontal: 10,
                                                                                      ),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          ClipRRect(
                                                                                            borderRadius: const BorderRadius.only(
                                                                                              topLeft: Radius.circular(10),
                                                                                              topRight: Radius.circular(10),
                                                                                            ),
                                                                                            child: Container(
                                                                                              height: height * 0.2,
                                                                                              width: width * 0.65,
                                                                                              child: Image.asset(
                                                                                                'assets/new/images/wwe.png',
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            padding: spacing(horizontal: 10),
                                                                                            decoration: BoxDecoration(
                                                                                                color: white,
                                                                                                borderRadius: const BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(10),
                                                                                                  bottomRight: Radius.circular(10),
                                                                                                )),
                                                                                            child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                gap(h: 10),
                                                                                                Container(
                                                                                                  width: width * 0.6,
                                                                                                  child: const Text(
                                                                                                    'WWE Wrestling',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 14,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                gap(h: 5),
                                                                                                Row(
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Public Group',
                                                                                                      style: TextStyle(
                                                                                                        color: grayMed,
                                                                                                        fontSize: 12,
                                                                                                      ),
                                                                                                    ),
                                                                                                    gap(w: 5),
                                                                                                    Container(
                                                                                                      width: 4,
                                                                                                      height: 4,
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: borderRadius(4),
                                                                                                        color: grayMed,
                                                                                                      ),
                                                                                                    ),
                                                                                                    gap(w: 5),
                                                                                                    Text(
                                                                                                      '170k members',
                                                                                                      style: TextStyle(
                                                                                                        color: grayMed,
                                                                                                        fontSize: 12,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                gap(h: 10),
                                                                                                Center(
                                                                                                  child: Container(
                                                                                                    width: width * 0.55,
                                                                                                    padding: spacing(
                                                                                                      vertical: 10,
                                                                                                    ),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: orangePrimary,
                                                                                                      borderRadius: borderRadius(10),
                                                                                                    ),
                                                                                                    child: Text(
                                                                                                      isJoined ? 'Joined' : 'Join Now',
                                                                                                      style: TextStyle(
                                                                                                        color: whitePrimary,
                                                                                                        fontSize: 12,
                                                                                                      ),
                                                                                                      textAlign: TextAlign.center,
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
                                                                          Container(
                                                                            child:
                                                                                PostTabGroup(
                                                                              group_id: widget.group_id,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
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
