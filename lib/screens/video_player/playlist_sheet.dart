import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';

class PlayListOption extends StatefulWidget {
  const PlayListOption({super.key});

  @override
  State<PlayListOption> createState() => _PlayListOptionState();
}

class _PlayListOptionState extends State<PlayListOption> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            color: Color.fromARGB(76, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 4,
          )
        ],
      ),
      height: height * 0.5,
      child: Column(
        children: [
          gap(h: 30),
          Text(
            'Save to',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          gap(h: 15),
          Text(
            'Select the playlist to save the video',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: grayMed,
              fontSize: 10,
            ),
          ),
          gap(h: 15),
          Container(
            padding: spacing(horizontal: 20, vertical: 15),
            margin: spacing(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(10),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/new/images/video_icons/playlist.png',
                  color: grayMed,
                ),
                gap(w: 10),
                Text(
                  'Create new playlist',
                  style: TextStyle(
                    color: blackLight,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: spacing(horizontal: 20, vertical: 15),
            margin: spacing(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: grayMed,
                ),
                gap(w: 10),
                Text(
                  'Watch Later',
                  style: TextStyle(
                    color: blackLight,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: spacing(horizontal: 20, vertical: 15),
            margin: spacing(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check_box,
                  color: orange,
                ),
                gap(w: 10),
                Text(
                  'My Videos',
                  style: TextStyle(
                    color: blackLight,
                  ),
                )
              ],
            ),
          ),
          gap(h: 30),
          Container(
            width: double.maxFinite,
            padding: spacing(vertical: 15),
            margin: spacing(horizontal: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadius(10),
              gradient: gradient,
            ),
            child: Text(
              'Save',
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
