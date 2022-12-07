import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/widgets/live.dart';
import 'package:vibetag/widgets/popup/live/activities_tile.dart';
import 'package:vibetag/widgets/popup/live/list_tile.dart';
import 'package:vibetag/widgets/popup/live/live_activities.dart';

import '../../../utils/constant.dart';

LiveActivities({required BuildContext context}) {
  List<Widget> activitise = [
    ActivitiesTile(
      title: 'David\'s Room',
      titleColor: '#000000',
      imgUrl: 'assets/images/live/Room.png',
      background: '#F0F0F0',
    ),
    ActivitiesTile(
      title: 'Surfing Vibes',
      titleColor: '#000000',
      imgUrl: 'assets/images/live/Surfing Vibes.png',
      background: '#F0F0F0',
    ),
    ActivitiesTile(
      title: 'Echo Back',
      titleColor: '#000000',
      imgUrl: 'assets/images/live/Echo back.png',
      background: '#F0F0F0',
    ),
    ActivitiesTile(
      title: 'On A Roll',
      titleColor: '#000000',
      imgUrl: 'assets/images/live/On A Roll.png',
      background: '#F0F0F0',
    ),
    ActivitiesTile(
      title: 'Vox Space',
      titleColor: '#000000',
      imgUrl: 'assets/images/live/Vox Space.png',
      background: '#F0F0F0',
    ),
    ActivitiesTile(
      title: 'Join link',
      titleColor: '#000000',
      imgUrl: 'assets/images/live/Join me.png',
      background: '#F0F0F0',
    ),
  ];
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
          height: height * 0.55,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: spacing(
                  horizontal: width * 0.07,
                  vertical: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        LivePopUp(context: context);
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_left,
                        size: 48,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    const Text(
                      'Room Activity',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width * 0.8,
                height: height * 0.4,
                child: GridView.builder(
                  itemCount: activitise.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4 / 2,
                  ),
                  itemBuilder: (context, i) {
                    return activitise[i];
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
