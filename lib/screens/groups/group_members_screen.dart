// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constant.dart';

class GroupMembersScreen extends StatefulWidget {
  final String group_id;
  const GroupMembersScreen({
    Key? key,
    required this.group_id,
  }) : super(key: key);

  @override
  State<GroupMembersScreen> createState() => _GroupMembersScreenState();
}

class _GroupMembersScreenState extends State<GroupMembersScreen> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> response = [];
  List<String> groupMembersId = [];
  bool isLoading = false;
  bool isNoMoreUser = false;
  bool isLoadingMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserFollowers();
  }

  getUserFollowers() async {
    setState(() {
      isLoading = true;
    });
    final result = await API().postData({
      'type': 'groups',
      'action': 'get_group_members_info',
      'group_id': '${widget.group_id}',
      'user_id': '1780450',
    });
    final members = jsonDecode(result.body)['data'];
    for (var user in members) {
      if (!(groupMembersId.contains(user['user_id']))) {
        groupMembersId.add(user['user_id']);
        response.add(user);
      }
    }
    setState(() {
      isLoading = false;
    });
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
                      Text('Group Members'),
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
                        getUserFollowers();
                      } else {
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
                          itemCount: response.length,
                          itemBuilder: (context, i) {
                            
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
                                          width: followers_data.contains(
                                                  response[i]['user_id'])
                                              ? 0
                                              : 1,
                                          color: orange,
                                        ),
                                      ),
                                      child: Text(
                                        followers_data.contains(
                                                response[i]['user_id'])
                                            ? 'Following'
                                            : 'Follow Back',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: followers_data.contains(
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
