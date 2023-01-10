import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/drawer/bottom_modal_items.dart';
import 'package:vibetag/screens/find%20friends/find_friends.dart';
import 'package:vibetag/screens/funding/funding.dart';
import 'package:vibetag/screens/job/job.dart';
import 'package:vibetag/screens/livestream/create%20stream/live.dart';
import 'package:vibetag/screens/offers/offers.dart';
import '../../utils/constant.dart';
import '../memories/memories.dart';

SeeMoreMenu({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          insetPadding: EdgeInsets.only(
            top: height * 0.4,
          ),
          contentPadding: spacing(
            vertical: 15,
          ),
          iconPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            width: width * 0.95,
            height: height * 0.4,
            child: Column(
              children: [
                BottomModalItems(
                  iconPath: 'assets/new/svg/bottom_drawer/jobs.svg',
                  title: 'Jobs',
                  notifications: 0,
                  onTap: () {
                    pushReplacement(
                      context: context,
                      screen: Job(),
                    );
                  },
                ),
                BottomModalItems(
                  iconPath: 'assets/new/svg/bottom_drawer/offers.svg',
                  title: 'Offer',
                  notifications: 0,
                  onTap: () {
                    pushReplacement(
                      context: context,
                      screen: Offer(),
                    );
                  },
                ),
                BottomModalItems(
                  iconPath: 'assets/new/svg/bottom_drawer/memories.svg',
                  title: 'Memories',
                  notifications: 0,
                  onTap: () {
                    pushReplacement(
                      context: context,
                      screen: Memories(),
                    );
                  },
                ),
                BottomModalItems(
                  iconPath: 'assets/new/svg/bottom_drawer/find friends.svg',
                  title: 'Find Friends',
                  notifications: 0,
                  onTap: () {
                    pushReplacement(
                      context: context,
                      screen: FindFriends(),
                    );
                  },
                ),
                BottomModalItems(
                  iconPath: 'assets/new/svg/bottom_drawer/funds.svg',
                  title: 'Funding',
                  notifications: 0,
                  onTap: () {
                    pushReplacement(
                      context: context,
                      screen: Funding(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
