import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';

import '../../model/user.dart';
import '../../provider/userProvider.dart';
import '../../utils/constant.dart';
import '../auth/login.dart';

int feedType = 1;

void changeFeeds() async {
  final data = {
    'type': 'change_feeds',
    'feed_type': feedType.toString(),
    'user_id': loginUserId.toString(),
  };
  final result = await API().postData(data);
}

Options({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  ModelUser user = Provider.of<UserProvider>(context, listen: false).user;

  bool feeds = user.order_posts_by == '1' ? true : false;
  bool darkMode = false;
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          insetPadding: EdgeInsets.only(
            top: 0,
            right: 15,
            left: width * 0.45,
            bottom: height * 0.45,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.zero,
          content: Container(
            width: width * 0.18,
            height: height * 0.3,
            decoration: BoxDecoration(
              color: whitePrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width * 0.1,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(5),
                      color: darkGrayNew,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/boast.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Boost Your Vibes',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/setting.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Setting',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/help.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/support.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Support',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  gap(h: 10),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/star.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: const Text(
                              'Your Feeds',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            height: width * 0.045,
                            child: Switch(
                                value: feeds,
                                onChanged: (value) {
                                  setState(() {
                                    feeds = !feeds;

                                    feedType = feeds ? 1 : 0;
                                  });
                                  changeFeeds();
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                  gap(h: 10),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/darkmode.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: const Text(
                              'Dark mode',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            height: width * 0.045,
                            child: Switch(
                                value: darkMode,
                                onChanged: (value) {
                                  setState(() {
                                    darkMode = !darkMode;
                                  });
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                  gap(h: 10),
                  InkWell(
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.clear().then((value) {
                        pushRoute(
                          context: context,
                          screen: const Login(),
                        );
                      });
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: width * 0.045,
                          child: SvgPicture.asset(
                            'assets/new/svg/menu/logout.svg',
                            width: width * 0.045,
                            height: width * 0.045,
                            color: grayMed,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
