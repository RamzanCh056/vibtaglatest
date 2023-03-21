import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/buzz/widget/bar_items.dart';

import '../../../utils/constant.dart';

class BuzzinBottomBar extends StatefulWidget {
  const BuzzinBottomBar({super.key});

  @override
  State<BuzzinBottomBar> createState() => _BuzzinBottomBarState();
}

class _BuzzinBottomBarState extends State<BuzzinBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.5,
      decoration: BoxDecoration(
        color: white,
        borderRadius: radiusOnly(topLeft: 15, topRight: 15),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            gap(h: 25),
            BarItems(
              icon: 'assets/new/images/copy.png',
              text: 'Copy Link',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/saved.png',
              text: 'Saved Post',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/new_tab.png',
              text: 'Open Post in New Tab',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/report.png',
              text: 'Report Post',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/Hide.png',
              text: 'Hide Post',
            ),
          ],
        ),
      ),
    );
  }

  
}
