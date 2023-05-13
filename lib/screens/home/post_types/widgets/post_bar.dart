// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vibetag/screens/buzz/widget/bar_items.dart';

import '../../../../utils/constant.dart';

class PostBottomBar extends StatefulWidget {
  bool is_publisher;
  PostBottomBar({
    Key? key,
    required this.is_publisher,
  }) : super(key: key);

  @override
  State<PostBottomBar> createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.is_publisher ? height * 0.75 : height * 0.5,
      decoration: BoxDecoration(
        color: white,
        borderRadius: radiusOnly(topLeft: 15, topRight: 15),
        boxShadow: boxShadow,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            gap(h: 25),
            widget.is_publisher
                ? BarItems(
                    icon: 'assets/new/images/copy.png',
                    text: 'Edit Post',
                  )
                : gap(),
            widget.is_publisher
                ? BarItems(
                    icon: 'assets/new/images/copy.png',
                    text: 'Delete',
                  )
                : gap(),
            BarItems(
              icon: 'assets/new/images/copy.png',
              text: 'Copy Link',
            ),
            widget.is_publisher
                ? BarItems(
                    icon: 'assets/new/images/copy.png',
                    text: 'Disable Comments',
                  )
                : gap(),
            widget.is_publisher
                ? gap()
                : BarItems(
                    icon: 'assets/new/icons/buzzin/saved.png',
                    text: 'Saved Post',
                  ),
            BarItems(
              icon: 'assets/new/icons/buzzin/new_tab.png',
              text: 'Open Post in New Tab',
            ),
            widget.is_publisher
                ? BarItems(
                    icon: 'assets/new/icons/buzzin/new_tab.png',
                    text: 'Edit Audience',
                  )
                : gap(),
            widget.is_publisher
                ? BarItems(
                    icon: 'assets/new/icons/buzzin/new_tab.png',
                    text: 'Pin Post',
                  )
                : gap(),
            widget.is_publisher
                ? BarItems(
                    icon: 'assets/new/icons/buzzin/new_tab.png',
                    text: 'Boast Post',
                  )
                : gap(),
            widget.is_publisher
                ? gap()
                : BarItems(
                    icon: 'assets/new/icons/buzzin/report.png',
                    text: 'Report Post',
                  ),
            widget.is_publisher
                ? gap()
                : BarItems(
                    icon: 'assets/new/icons/buzzin/Hide.png',
                    text: 'Hide Post',
                  ),
          ],
        ),
      ),
    );
  }
}
