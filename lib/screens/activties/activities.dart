// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../header/header.dart';

class Activities extends StatefulWidget {
  final String user_id;
  const Activities({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  List<dynamic> activities = [];
  int currentActive = 0;
  bool isLoading = false;
  List<String> buttonText = [
    'Activities',
    'History',
  ];

  @override
  void initState() {
    super.initState();
    getUserActivities();
  }

  getUserActivities() async {
    setState(() {
      isLoading = true;
    });
    final result = await API().postData({
      'type': 'get_activity_history',
      'action': 'get_activity_history',
      'user_id': '${widget.user_id}',
      'loggedin': 'true',
    });
    activities = jsonDecode(result.body)['data'];
    print(activities);
    setState(() {
      isLoading = false;
    });
  }

  String reactionType(String reactionType, Map<String, dynamic> activity) {
    if (reactionType.contains('post')) {
      return ' reacted to ${activity['postData']['publisher']['name']} post.';
    }
    if (reactionType.contains('friend')) {
      return ' started following you';
    }
    return '';
  }

  Widget reactionIcons(String reactionType) {
    if (reactionType.contains('post')) {
      return Image.asset(
        reactions[
            (int.parse(reactionType[reactionType.length - 1].toString()) - 1)],
      );
      return gap();
    }
    return gap();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(),
                  ],
                ),
                gap(h: 10),
                Container(
                  width: double.infinity,
                  height: height * 0.05,
                  child: ListView.builder(
                    itemCount: buttonText.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: spacing(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            currentActive = i;
                            setState(() {});
                          },
                          child: Container(
                            padding: spacing(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            alignment: Alignment.center,
                            decoration: i == currentActive
                                ? BoxDecoration(
                                    gradient: gradient,
                                    borderRadius: borderRadius(width),
                                  )
                                : BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(width),
                                  ),
                            child: Text(
                              buttonText[i],
                              style: TextStyle(
                                color:
                                    i == currentActive ? white : blackPrimary,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                gap(h: 15),
                isLoading
                    ? loadingSpinner()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: activities.length,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: spacing(vertical: 5),
                            padding: spacing(vertical: 7),
                            decoration: BoxDecoration(
                              color: white,
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        pushRoute(
                                            context: context,
                                            screen: Profile(
                                              user_id: activities[i]
                                                  ['activator']['user_id'],
                                            ));
                                      },
                                      child: CircleAvatar(
                                        radius: width * 0.07,
                                        foregroundImage: NetworkImage(
                                            activities[i]['activator']
                                                ['avatar']),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: borderRadius(25),
                                        ),
                                        child: reactionIcons(
                                          activities[i]['activity_type'],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                gap(
                                  w: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            pushRoute(
                                                context: context,
                                                screen: Profile(
                                                  user_id: activities[i]
                                                      ['activator']['user_id'],
                                                ));
                                          },
                                          child: Text(
                                            activities[i]['activator']['name'],
                                            style: TextStyle(
                                              color: blackPrimary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          reactionType(
                                            activities[i]['activity_type'],
                                            activities[i],
                                          ),
                                          style: TextStyle(
                                            color: blackPrimary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    gap(h: 5),
                                    Text(
                                      readTimestamp(int.parse(
                                          activities[i]['time'].toString())),
                                      style: TextStyle(
                                        color: blackPrimary,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
