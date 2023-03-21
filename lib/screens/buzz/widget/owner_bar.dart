import 'package:flutter/material.dart';
import 'package:vibetag/screens/buzz/widget/bar_items.dart';

import '../../../utils/constant.dart';

class OwnerBar extends StatefulWidget {
  const OwnerBar({super.key});

  @override
  State<OwnerBar> createState() => _OwnerBarState();
}

class _OwnerBarState extends State<OwnerBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.75,
      decoration: BoxDecoration(
        color: white,
        borderRadius: radiusOnly(topLeft: 15, topRight: 15),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            gap(h: 25),
            BarItems(
              icon: 'assets/new/icons/buzzin/Edit.png',
              text: 'Edit Post',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/delete.png',
              text: 'Delete',
            ),
            BarItems(
              icon: 'assets/new/images/copy.png',
              text: 'Copy Link',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/chat.png',
              text: 'Disable Comments',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/new_tab.png',
              text: 'Open Post in New Tab',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/audience.png',
              text: 'Edit Audience',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/pin.png',
              text: 'Pin Post',
            ),
            BarItems(
              icon: 'assets/new/icons/buzzin/boost.png',
              text: 'Boost Post',
            ),
           
          ],
        ),
      ),
    );
  }
}
