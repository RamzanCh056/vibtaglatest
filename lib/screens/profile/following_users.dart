// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constant.dart';

class Following extends StatefulWidget {
  final String user_id;
  const Following({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  TextEditingController searchController = TextEditingController();

  List<String> followingIds = [];
  List<dynamic> response = [];
  bool isLoading = false;
  bool isNoMoreUser = false;
  bool isLoadingMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserFollowing();
  }

  getUserFollowing() async {
    response=[];
    setState(() {
      isLoading = true;
    });
    final result = await API().postData({
      'type': 'following',
      'action': 'get_followings',
      'user_id': '${widget.user_id}',
      'limit': '20',
    });
    final following = jsonDecode(result.body)['data'];
    for (var user in following) {
      if (!(followingIds.contains(user['user_id']))) {
        followingIds.add(user['user_id']);
        response.add(user);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  getMoreFollowing() async {
    String lastId = followingIds[(followingIds.length - 1)];

    final data = {
      'type': 'following',
      'action': 'get_more_followings',
      'user_id': '${widget.user_id}',
      'after_user_id': '${response[(response.length - 1)]['user_id']}',
      'limit': '20',
    };
    print(data);
    final result = await API().postData(data);
    final following = jsonDecode(result.body)['data'];

    if (following.length > 0) {
      for (var user in following) {
        if (!(followingIds.contains(user['user_id']))) {
          followingIds.add(user['user_id']);
          response.add(user);
        }
      }
    }
    if (lastId == followingIds[(followingIds.length - 1)]) {
      isNoMoreUser = true;
    }
    isLoadingMore = false;
    setState(() {});
  }

  searchFollowing() async {
    response = [];
    isLoading = true;
    setState(() {});
    final data = {
      'type': 'following',
      'action': 'filter_following',
      'user_id': '${widget.user_id}',
      'profile_type': 'profile',
      'filter_keyword': searchController.text.toString(),
      'placement_in': 'followers',
      'limit': '10',
    };

    final result = await API().postData(data);
    response = jsonDecode(result.body)['data'];

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                gap(h: height * 0.01),
                Container(
                  padding: spacing(
                    horizontal: 15,
                    vertical: height * 0.015,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                      Text('Following'),
                      gap()
                    ],
                  ),
                ),
                Container(
                  margin: spacing(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  width: double.maxFinite,
                  height: 1,
                  color: grayMed,
                ),
                gap(h: 10),
                Container(
                  height: height * 0.06,
                  margin: spacing(
                    horizontal: 15,
                  ),
                  width: double.maxFinite,
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        getUserFollowing();
                      } else {
                        searchFollowing();
                      }
                    },
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      prefix: Padding(
                        padding: spacing(
                          horizontal: 15,
                        ),
                        child: Icon(
                          Icons.search,
                          color: grayPrimary,
                          size: 18,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: grayMed,
                        ),
                        borderRadius: borderRadius(width),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: grayMed,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                gap(h: height * 0.01),
                isLoading
                    ? loadingSpinner()
                    : Container(
                        height: height * 0.83,
                        margin: spacing(
                          horizontal: 15,
                        ),
                        child: ListView.builder(
                          itemCount: (response.length + 1),
                          itemBuilder: (context, i) {
                            if (i == (response.length)) {
                              if (searchController.text.isNotEmpty) {
                                return gap();
                              }
                              return isNoMoreUser
                                  ? Center(
                                      child: Column(
                                        children: [
                                          gap(h: 10),
                                          Text('No More User'),
                                          gap(h: 30),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        VisibilityDetector(
                                          key: Key('Following LoadMore'),
                                          onVisibilityChanged: (info) {
                                            if (info.visibleFraction
                                                    .toDouble() >
                                                0.5) {
                                              if (!isLoadingMore) {
                                                getMoreFollowing();
                                              }

                                              isLoadingMore = true;
                                            }
                                          },
                                          child: loadingSpinner(),
                                        ),
                                        gap(h: 25),
                                      ],
                                    );
                            }
                            return Container(
                              padding: spacing(
                                vertical: 10,
                              ),
                              margin: spacing(
                                vertical: 5,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: width * 0.07,
                                        backgroundColor: grayLight,
                                        foregroundImage:
                                            NetworkImage(response[i]['avatar']),
                                      ),
                                      gap(w: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            setName(response[i]['name']),
                                            style: TextStyle(
                                              color: blackPrimary,
                                              fontSize: 12,
                                            ),
                                          ),
                                          gap(h: 5),
                                          Text(
                                            '@${response[i]['username']}',
                                            style: TextStyle(
                                              color: grayMed,
                                              fontSize: 10,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      AuthMethod()
                                          .followUser(response[i]['user_id']);
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: spacing(
                                        horizontal: 35,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius(5),
                                        color: grayLight,
                                        border: Border.all(
                                          width: following_data.contains(
                                                  response[i]['user_id'])
                                              ? 0
                                              : 1,
                                          color: orange,
                                        ),
                                      ),
                                      child: Text(
                                        following_data.contains(
                                                response[i]['user_id'])
                                            ? 'Following'
                                            : 'Follow Back',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: following_data.contains(
                                                  response[i]['user_id'])
                                              ? grayMed
                                              : orange,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
