import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:clipboard/clipboard.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import '../../../provider/userProvider.dart';
import '../../../utils/constant.dart';
import '../../auth/login.dart';

void changeFeeds(BuildContext context) async {
  final data = {
    'type': 'change_feeds',
    'feed_type': feeds ? '1' : '0',
    'user_id': loginUserId.toString(),
  };
  await API().postData(data);
  await PostMethods().getPosts(context: context);
  await AuthMethod().setUser(
    context: context,
  );
}

Options({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);

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
            bottom: height * 0.35,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.zero,
          content: Container(
            width: width * 0.18,
            height: height * 0.4,
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
                  InkWell(
                    onTap: () {
                      togglePlayers = !togglePlayers;
                      setState(() {});
                    },
                    child: Row(
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
                                onChanged: (value) async {
                                  homePostAdsIds = [];
                                  homePostIds = [];
                                  setState(() {
                                    feeds = !feeds;
                                    Provider.of<PostProvider>(
                                      context,
                                      listen: false,
                                    ).clear();
                                  });

                                  changeFeeds(context);
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
                          InkWell(
                            onTap: () {
                              FlutterClipboard.copy(token!);
                            },
                            child: Container(
                              child: const Text(
                                'Dark mode',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
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
                      Provider.of<PostProvider>(context, listen: false).clear();
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();

                      unSubScribeFromTopic('Private_Call_${loginUserId}');
                      unSubScribeFromTopic('Private_Voice_Call_${loginUserId}');
                      unSubScribeFromTopic('VibeTag_Notification');
                      unSubScribeFromTopic('${loginUserId}');
                      await preferences.clear().then((value) {
                        Provider.of<UserProvider>(context, listen: false)
                            .clearUser({});
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
