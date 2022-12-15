import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/livestream/create%20stream/list_tile.dart';
import 'package:vibetag/screens/livestream/create%20stream/live_activities.dart';
import 'package:vibetag/screens/livestream/create%20stream/live_invite.dart';
import 'package:vibetag/screens/livestream/create%20stream/live_post.dart';
import '../../../utils/constant.dart';

LivePopUp({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        iconPadding: EdgeInsets.only(
          top: height * 0.01,
          right: height * 0.01,
          left: width * 0.95,
        ),
        icon: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
              padding: EdgeInsets.all(
                width * 0.01,
              ),
              decoration: BoxDecoration(
                  color: HexColor('#DDDDDD'),
                  borderRadius: BorderRadius.circular(
                    width * 0.3,
                  )),
              child: Icon(Icons.close)),
        ),
        content: Container(
          width: width * 0.95,
          height: height * 0.85,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/live/Build-your-live-Room.png',
                    width: width * 0.1,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const Text(
                    'Build Your Live Room',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  LiveActivities(context: context);
                },
                child: const LiveListTile(
                  imgUrl: 'assets/images/live/Room-activity.png',
                  title: 'Room Activity',
                  subtitle: 'David\'s Room',
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  LiveInvite(context: context);
                },
                child: const LiveListTile(
                  imgUrl: 'assets/images/live/Invite friends.png',
                  title: 'Invite friends',
                  subtitle: 'Select Peoples...',
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const LiveListTile(
                imgUrl: 'assets/images/live/Time-started.png',
                title: 'Time started',
                subtitle: 'Now',
              ),
              SizedBox(
                height: height * 0.01,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  LivePost(context: context);
                },
                child: const LiveListTile(
                  imgUrl: 'assets/images/live/Title.png',
                  title: 'Post Title',
                  subtitle: 'Post title here',
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'To get started, select people to invite',
                style: TextStyle(
                  color: HexColor(
                    '#9E9E9E',
                  ),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width * 0.8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: HexColor('#FFCF8F'),
                  borderRadius: BorderRadius.circular(
                    width * 0.02,
                  ),
                ),
                padding: spacing(
                  horizontal: width * 0.05,
                  vertical: height * 0.03,
                ),
                child: Text(
                  'Create Room',
                  style: TextStyle(
                    color: HexColor(
                      '#FF9200',
                    ),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
