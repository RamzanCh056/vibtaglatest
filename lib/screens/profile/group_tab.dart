// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vibetag/model/user.dart';
import 'package:vibetag/screens/groups/group.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';
import '../home/create_post/home_search.dart';
import '../home/home_tab_bar.dart';

class GroupTab extends StatefulWidget {
  final String user_id;
  const GroupTab({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<GroupTab> createState() => _GroupTabState();
}

class _GroupTabState extends State<GroupTab> {
  late List<dynamic> groups;
  late List<dynamic> sGroups;
  bool isLoading = false;
  @override
  void initState() {
    getProfileGroups();
    super.initState();
  }

  void getProfileGroups() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_groups',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id,
      'after_post_id': '0',
    };
    final result = await API().postData(data);
    groups = jsonDecode(result.body)['posts_data'];
    final suggested = {
      'type': 'get_suggested_groups',
      'user_id': widget.user_id,
    };
    final sResults = await API().postData(suggested);
    sGroups = jsonDecode(sResults.body);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return SingleChildScrollView(
      child: isLoading
          ? loadingSpinner()
          : Column(
              children: [
                groups.length > 0
                    ? Container(
                        height: height * 0.38,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: groups.length,
                            itemBuilder: (context, i) {
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
                                      child: InkWell(
                                        onTap: () {
                                          pushRoute(
                                              context: context,
                                              screen: GroupScreen(
                                                  group_id: groups[i]['id']));
                                        },
                                        child: Container(
                                          height: height * 0.2,
                                          width: width * 0.65,
                                          child: Image.network(
                                            groups[i]['avatar']
                                                .trim()
                                                .toString(),
                                            fit: BoxFit.cover,
                                          ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          gap(h: 10),
                                          InkWell(
                                            onTap: () {
                                              pushRoute(
                                                  context: context,
                                                  screen: GroupScreen(
                                                      group_id: groups[i]
                                                          ['id']));
                                            },
                                            child: Container(
                                              width: width * 0.6,
                                              child: Text(
                                                groups[i]['group_title'],
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
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
                                                '${getInK(number: int.parse(groups[i]['members_count']))} members',
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
                                                'Joined',
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
                      )
                    : gap(),
                gap(h: 5),
                Center(
                  child: Container(
                    height: height * 0.85,
                    width: width * 0.95,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: sGroups.length,
                        itemBuilder: (context, i) {
                          return Container(
                            height: width * 0.25,
                            width: width * 0.95,
                            margin: spacing(
                              vertical: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      pushRoute(
                                          context: context,
                                          screen: GroupScreen(
                                              group_id: groups[i]['id']));
                                    },
                                    child: Container(
                                      height: width * 0.25,
                                      width: width * 0.25,
                                      child: Image.network(
                                        sGroups[i]['avatar'].trim().toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: spacing(horizontal: 10),
                                  height: width * 0.25,
                                  width: width * 0.7,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      gap(h: 10),
                                      InkWell(
                                        onTap: () {
                                          pushRoute(
                                            context: context,
                                            screen: GroupScreen(
                                              group_id: groups[i]['id'],
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: width * 0.6,
                                          child: Text(
                                            sGroups[i]['group_title'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis,
                                            ),
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
                                              fontSize: 10,
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
                                            '${getInK(number: int.parse(sGroups[i]['members_count']))} members',
                                            style: TextStyle(
                                              color: grayMed,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      gap(h: 5),
                                      Container(
                                        width: width * 0.5,
                                        padding: spacing(
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orangePrimary,
                                          borderRadius: borderRadius(5),
                                        ),
                                        child: Text(
                                          'Join Now',
                                          style: TextStyle(
                                            color: whitePrimary,
                                            fontSize: 10,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      gap(h: 5),
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
    );
  }
}
