import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';
import 'package:vibetag/screens/drawer/bottom_modal_items.dart';

import '../../utils/constant.dart';

BottomDrawer({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showBarModalBottomSheet(
    topControl: Container(),
    context: context,
    builder: (context) {
      return Container(
        height: height * 0.95,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  gap(h: height * 0.035),
                  Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Container(
                      width: width * 0.15,
                      height: 4,
                      color: grayMed,
                    ),
                  ),
                  gap(h: height * 0.035),
                ],
              ),
            ),
            Container(
              height: height * 0.83,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/cart.svg',
                      title: 'cart',
                      notifications: 5,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/playlist.svg',
                      title: 'Playlist',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/post.svg',
                      title: 'Post',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/blog.svg',
                      title: 'Blog',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/mypage.svg',
                      title: 'My Page',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/events.svg',
                      title: 'Events',
                      notifications: 0,
                      bgColor: orangePrimary,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/album.svg',
                      title: 'Album',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/groups.svg',
                      title: 'Groups',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/gift.svg',
                      title: 'Gifts',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/nodge.svg',
                      title: 'Nudge',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/funds.svg',
                      title: 'Funds',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/jobs.svg',
                      title: 'Jobs',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/memories.svg',
                      title: 'Memories',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/offers.svg',
                      title: 'Offer',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/Popular post.svg',
                      title: 'Popular Posts',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/Saved posts.svg',
                      title: 'Saved Post',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/find friends.svg',
                      title: 'Find Friends',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath:
                          'assets/new/svg/bottom_drawer/Activity icon.svg',
                      title: 'Activity',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/jobs.svg',
                      title: 'Jobs',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/marketplace.svg',
                      title: 'Martketplace',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/products.svg',
                      title: 'Products',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/explore.svg',
                      title: 'Explore',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/blog_more.svg',
                      title: 'Blog',
                      notifications: 0,
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/seemore.svg',
                      title: 'See More',
                      notifications: 0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
