import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vibetag/screens/livestream/create/room_activities.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

class CreateStream extends StatefulWidget {
  const CreateStream({super.key});

  @override
  State<CreateStream> createState() => _CreateStreamState();
}

class _CreateStreamState extends State<CreateStream> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.8,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: spacing(
              vertical: 20,
            ),
            child: Text(
              'Build Your Live Room',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: grayMed,
          ),
          gap(h: 15),
          InkWell(
            onTap: () {
              pop(context);
              createBottomModalSheet(
                context: context,
                screen: RoomActivities(),
              );
            },
            child: Container(
              padding: spacing(
                horizontal: 10,
                vertical: 10,
              ),
              margin: spacing(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(width),
                          color: white,
                        ),
                        padding: spacing(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Image.asset(
                            'assets/new/icons/livestream/room_activity.png'),
                      ),
                      gap(w: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Room Activity',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: blackPrimary,
                            ),
                          ),
                          Text(
                            'Surfing Vibes',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: grayMed,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 30,
                    child: Image.asset(
                      'assets/new/icons/livestream/arrow_right.png',
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: spacing(
              horizontal: 10,
              vertical: 10,
            ),
            margin: spacing(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: width * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(width),
                        color: white,
                      ),
                      padding: spacing(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Image.asset(
                          'assets/new/icons/livestream/invite_friends.png'),
                    ),
                    gap(w: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Invite Friends',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: blackPrimary,
                          ),
                        ),
                        Text(
                          'Everyone',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: grayMed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 30,
                  child: Image.asset(
                    'assets/new/icons/livestream/arrow_right.png',
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: spacing(
              horizontal: 10,
              vertical: 10,
            ),
            margin: spacing(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: width * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(width),
                        color: white,
                      ),
                      padding: spacing(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Image.asset(
                          'assets/new/icons/livestream/stream_schedule.png'),
                    ),
                    gap(w: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Schedule Time',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: blackPrimary,
                          ),
                        ),
                        Text(
                          'Now',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: grayMed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 30,
                  child: Image.asset(
                    'assets/new/icons/livestream/arrow_right.png',
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: spacing(
              horizontal: 10,
              vertical: 10,
            ),
            margin: spacing(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: width * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(width),
                        color: white,
                      ),
                      padding: spacing(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Image.asset(
                          'assets/new/icons/livestream/post_thumbnail_cover.png'),
                    ),
                    gap(w: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Post Title & Cover',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: blackPrimary,
                          ),
                        ),
                        Text(
                          'Add title & cover of your post',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: grayMed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 30,
                  child: Image.asset(
                    'assets/new/icons/livestream/arrow_right.png',
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: spacing(
              horizontal: 10,
              vertical: 10,
            ),
            margin: spacing(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: width * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(width),
                        color: white,
                      ),
                      padding: spacing(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Image.asset(
                          'assets/new/icons/livestream/video_call_bold.png'),
                    ),
                    gap(w: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Camera Controls',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: blackPrimary,
                          ),
                        ),
                        Text(
                          'Select Audio & Camera source',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: grayMed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 30,
                  child: Image.asset(
                    'assets/new/icons/livestream/arrow_right.png',
                  ),
                )
              ],
            ),
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.35,
                  padding: spacing(
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: grayLight,
                    borderRadius: borderRadius(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: grayMed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gap(w: 25),
                Container(
                  width: width * 0.35,
                  padding: spacing(
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: borderRadius(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
