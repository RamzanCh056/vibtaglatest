import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/article/widgets.dart';
import 'package:vibetag/screens/groups/groups.dart';
import 'package:vibetag/screens/livestream/create%20stream/live.dart';
import 'package:vibetag/screens/page/pages.dart';
import 'package:vibetag/screens/shop/product/my_products.dart';
import 'package:vibetag/screens/shop/product/recent_product.dart';
import 'package:vibetag/screens/shop/sale/sale.dart';
import 'package:vibetag/screens/wishlist/wishlist.dart';
import '../../utils/constant.dart';

import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:vibetag/screens/drawer/bottom_modal_items.dart';

SetUpPopUp({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showBarModalBottomSheet(
    topControl: Container(),
    context: context,
    builder: (context) {
      return Container(
        height: height * 0.75,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    gap(h: height * 0.03),
                    const Text(
                      'Set Up',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    gap(h: height * 0.03),
                    Container(
                      width: double.maxFinite,
                      height: 1,
                      color: grayPrimary,
                      margin: spacing(
                        horizontal: 20,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: height * 0.65,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      gap(h: 10),
                      BottomModalItems(
                        iconPath: 'assets/new/svg/create_live.svg',
                        title: 'Create Live',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath: 'assets/svg/create ads.svg',
                        title: 'Create Ad',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath: 'assets/new/svg/bottom_drawer/blog.svg',
                        title: 'Create Blog',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath: 'assets/new/svg/bottom_drawer/events.svg',
                        title: 'Create Event',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath: 'assets/new/svg/bottom_drawer/groups.svg',
                        title: 'Create Group',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath: 'assets/new/svg/bottom_drawer/mypage.svg',
                        title: 'Create Page',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath: 'assets/new/svg/bottom_drawer/blog.svg',
                        title: 'Create Currency',
                        notifications: 0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

setupPop({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          insetPadding: EdgeInsets.only(
            bottom: height * 0.37,
          ),
          contentPadding: spacing(
            horizontal: 0,
            vertical: height * 0.01,
          ),
          iconPadding: spacing(
            horizontal: 0,
            vertical: 0,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            width: width,
            height: height * 0.5,
            decoration: BoxDecoration(
              borderRadius: borderRadius(40),
              color: white,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * 0.15,
                  height: 5,
                  color: darkGray,
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width * 0.9,
                  padding: spacing(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/create ads.svg',
                            width: width * 0.08,
                            color: orange,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              'Create Ad',
                              style: TextStyle(
                                fontSize: textMed,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/create blog.svg',
                            width: width * 0.08,
                            color: orange,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              'Create Blog',
                              style: TextStyle(
                                fontSize: textMed,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Create Event.svg',
                            width: width * 0.08,
                            color: orange,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              'Create Event',
                              style: TextStyle(
                                fontSize: textMed,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/create group.svg',
                            width: width * 0.08,
                            color: orange,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              'Create Group',
                              style: TextStyle(
                                fontSize: textMed,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/create page.svg',
                            width: width * 0.08,
                            color: orange,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              'Create Page',
                              style: TextStyle(
                                fontSize: textMed,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/coins.svg',
                            width: width * 0.08,
                            color: orange,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: width * 0.7,
                            child: Text(
                              'Change Currency',
                              style: TextStyle(
                                fontSize: textMed,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

MyVibes({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showBarModalBottomSheet(
    topControl: Container(),
    context: context,
    builder: (context) {
      return Container(
        height: height * 0.75,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    gap(h: height * 0.03),
                    const Text(
                      'Quick Pins',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    gap(h: height * 0.03),
                    Container(
                      width: double.maxFinite,
                      height: 1,
                      color: grayPrimary,
                      margin: spacing(
                        horizontal: 20,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: height * 0.6,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      gap(h: 10),
                      BottomModalItems(
                        iconPath: 'assets/new/svg/bottom_drawer/mypage.svg',
                        title: 'Shortcut to your page',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath:
                            'assets/new/svg/bottom_drawer/explore groups and discover.svg',
                        title: 'Explore your groups & discover other Groups',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath:
                            'assets/new/svg/bottom_drawer/check daily sales of your fav.svg',
                        title: 'Checkout daily sale on your favorite items',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath:
                            'assets/new/svg/bottom_drawer/See all wishlists.svg',
                        title: 'See all your wishlist',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath:
                            'assets/new/svg/bottom_drawer/see all your inspired recently.svg',
                        title:
                            'See all your inspired recently viewed shop items',
                        notifications: 0,
                      ),
                      BottomModalItems(
                        iconPath:
                            'assets/new/svg/bottom_drawer/publish edit.svg',
                        title: 'Publish, Edit, Discover, Product & Business',
                        notifications: 0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

myVibePop({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          insetPadding: EdgeInsets.only(
            bottom: height * 0.27,
          ),
          contentPadding: spacing(
            horizontal: 0,
            vertical: height * 0.01,
          ),
          iconPadding: spacing(
            horizontal: 0,
            vertical: 0,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            width: width,
            height: height * 0.6,
            decoration: BoxDecoration(
              borderRadius: borderRadius(40),
              color: white,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * 0.8,
                  padding: spacing(
                    horizontal: 0,
                    vertical: 10,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/fireworks.svg',
                            width: width * 0.08,
                            color: accent,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Quick Pin',
                            style: TextStyle(
                              fontSize: textMed,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 5,
                        color: darkGray,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width * 0.9,
                  padding: spacing(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          pushRoute(
                            context: context,
                            screen: const Pages(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/website.svg',
                              width: width * 0.08,
                              color: orange,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: width * 0.7,
                              child: Text(
                                'Shortcut to your page(s)',
                                style: TextStyle(
                                  fontSize: textSm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          pushRoute(
                            context: context,
                            screen: const Groups(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/friends.svg',
                              width: width * 0.08,
                              color: orange,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: width * 0.7,
                              child: Text(
                                'Explore your group(s) and discover other groups',
                                style: TextStyle(
                                  fontSize: textSm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          pushRoute(
                            context: context,
                            screen: Sale(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/percent.svg',
                              width: width * 0.08,
                              color: orange,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: width * 0.7,
                              child: Text(
                                'Checkout daily sale of your favorite items',
                                style: TextStyle(
                                  fontSize: textSm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          pushRoute(
                            context: context,
                            screen: const WishList(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/wishlist.svg',
                              width: width * 0.08,
                              color: orange,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: width * 0.7,
                              child: Text(
                                'See all your whishlist(s)',
                                style: TextStyle(
                                  fontSize: textSm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          pushRoute(
                            context: context,
                            screen: const RecentProducts(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/refresh.svg',
                              width: width * 0.08,
                              color: orange,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: width * 0.7,
                              child: Text(
                                'See all your inspired recently viewed shop items',
                                style: TextStyle(
                                  fontSize: textSm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          pushRoute(
                            context: context,
                            screen: const MyProducts(),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/new-product.svg',
                              width: width * 0.08,
                              color: orange,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: width * 0.7,
                              child: Text(
                                'Publish, Edit, Discover, products and Business',
                                style: TextStyle(
                                  fontSize: textSm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          pushRoute(
                            context: context,
                            screen: MyArticles(context: context),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/symbols.svg',
                              width: width * 0.08,
                              color: orange,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: width * 0.7,
                              child: Text(
                                'Quick access to your Blogs',
                                style: TextStyle(
                                  fontSize: textSm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
