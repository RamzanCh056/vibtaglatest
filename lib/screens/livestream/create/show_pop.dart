import 'package:flutter/material.dart';
import 'package:vibetag/screens/home/create_post/create_post.dart';
import 'package:vibetag/screens/livestream/create/camera_control.dart';
import 'package:vibetag/screens/livestream/create/create_stream.dart';
import 'package:vibetag/screens/livestream/create/custom_friend.dart';
import 'package:vibetag/screens/livestream/create/room_activities.dart';
import 'package:vibetag/screens/livestream/create/start_time.dart';
import 'package:vibetag/screens/livestream/create/title_cover.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

import '../../../utils/constant.dart';

class ShowStreamPop extends StatefulWidget {
  const ShowStreamPop({super.key});

  @override
  State<ShowStreamPop> createState() => _ShowStreamPopState();
}

class _ShowStreamPopState extends State<ShowStreamPop> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                createBottomModalSheet(
                  context: context,
                  screen: CreatePost(),
                );
              },
              child: Container(
                padding: spacing(
                  horizontal: 40,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: borderRadius(width),
                ),
                child: Text(
                  'Create Pop',
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
