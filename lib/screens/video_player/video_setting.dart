import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';

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

VideoSetting({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);

  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor:const Color.fromARGB(0, 255, 255, 255),
          insetPadding: EdgeInsets.only(
            top: height * 0.1,
            right: 40,
            left: width * 0.4,
            bottom: height * 0.45,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.zero,
          content: Container(
            width: width * 0.18,
            height: height * 0.1,
            decoration: BoxDecoration(
              color: whitePrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: spacing(horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                'assets/new/images/video_icons/video_quality.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            gap(w: 10),
                            Text(
                              'Video Quality',
                              style: TextStyle(
                                color: blackPrimary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '250p',
                          style: TextStyle(
                            color: grayMed,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: grayLight,
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: spacing(horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                'assets/new/images/video_icons/playback.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            gap(w: 10),
                            Text(
                              'Playback Speed',
                              style: TextStyle(
                                color: blackPrimary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '1.0x',
                          style: TextStyle(
                            color: grayMed,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
