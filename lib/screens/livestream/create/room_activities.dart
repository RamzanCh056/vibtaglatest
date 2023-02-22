import 'package:flutter/material.dart';
import 'package:vibetag/utils/constant.dart';

class RoomActivities extends StatefulWidget {
  const RoomActivities({super.key});

  @override
  State<RoomActivities> createState() => _RoomActivitiesState();
}

class _RoomActivitiesState extends State<RoomActivities> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.65,
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
            margin: spacing(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/new/icons/livestream/icons_left.png'),
                Container(
                  padding: spacing(
                    vertical: 20,
                  ),
                  child: Text(
                    'Room Activity',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                gap(),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: grayMed,
          ),
          gap(h: 15),
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
                  child:
                      Image.asset('assets/new/icons/livestream/tea_bottle.png'),
                ),
                gap(w: 10),
                Text(
                  'Charlie\'s Room',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blackPrimary,
                  ),
                ),
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
                      'assets/new/icons/livestream/surfing_vibes.png'),
                ),
                gap(w: 10),
                Text(
                  'Surfing Vibes',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blackPrimary,
                  ),
                ),
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
                  child:
                      Image.asset('assets/new/icons/livestream/vox_space.png'),
                ),
                gap(w: 10),
                Text(
                  'Vox Space',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blackPrimary,
                  ),
                ),
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
                  child:
                      Image.asset('assets/new/icons/livestream/join_link.png'),
                ),
                gap(w: 10),
                Text(
                  'Join Link',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blackPrimary,
                  ),
                ),
              ],
            ),
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 25),
            child: Container(
              width: double.maxFinite,
              padding: spacing(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: borderRadius(10),
                border: Border.all(
                  width: 2,
                  color: orange,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Done',
                style: TextStyle(
                  color: orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
