import 'package:flutter/material.dart';
import 'package:vibetag/screens/buzz/widget/bar_items.dart';

import '../../utils/constant.dart';

class ProfileBotttomBar extends StatefulWidget {
  ProfileBotttomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileBotttomBar> createState() => _ProfileBotttomBarState();
}

class _ProfileBotttomBarState extends State<ProfileBotttomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.35,
      decoration: BoxDecoration(
        color: white,
        borderRadius: radiusOnly(topLeft: 15, topRight: 15),
        boxShadow: boxShadow,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            gap(h: 25),
            BarItems(
              icon: 'assets/icons/lock.png',
              text: 'Block',
            ),
            BarItems(
              icon: 'assets/new/images/copy.png',
              text: 'Add as family',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/report.png',
              text: 'Report',
            ),
          ],
        ),
      ),
    );
  }
}
