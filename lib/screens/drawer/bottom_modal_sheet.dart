import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/activties/activities.dart';
import 'package:vibetag/screens/album/album.dart';
import 'package:vibetag/screens/article/widgets.dart';
import 'package:vibetag/screens/blog/blog.dart';
import 'package:vibetag/screens/blog/blogs.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';
import 'package:vibetag/screens/drawer/bottom_modal_items.dart';
import 'package:vibetag/screens/drawer/see_more_popup.dart';
import 'package:vibetag/screens/events/events.dart';
import 'package:vibetag/screens/find%20vibes/find_vibes.dart';
import 'package:vibetag/screens/gift/gift.dart';
import 'package:vibetag/screens/groups/groups.dart';
import 'package:vibetag/screens/nudge/nudge.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/page/page_old.dart';
import 'package:vibetag/screens/playlists/playlist.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/screens/saved_post/saved_post.dart';
import 'package:vibetag/screens/shop/cart.dart';
import 'package:vibetag/screens/shop/market/explore.dart';
import 'package:vibetag/screens/shop/product/my_products.dart';
import 'package:vibetag/screens/shop/shop.dart';

import '../../utils/constant.dart';
import '../my_articles/my_article.dart';
import '../my_articles/my_article_main_screen.dart';
import '../my_page_screen/browse_event_screen.dart';

BottomDrawer({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showBarModalBottomSheet(
    barrierColor: const Color.fromARGB(0, 255, 255, 255),
    elevation: 0,
    topControl: Container(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
        height: height * 0.88,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.3,
              width: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: height * 0.15,
                      child: Image.asset(
                        'assets/images/cover.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: height * 0.075,
                    child: Center(
                      child: SizedBox(
                        width: width * 0.25,
                        height: width * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            foregroundImage: const AssetImage(
                              'assets/images/streamer.jpg',
                            ),
                            radius: width * 0.125,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: height * 0.02,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              gap(w: 20),
                              const Text(
                                'Illizabat Bab',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              gap(
                                w: 10,
                              ),
                              const Icon(
                                Icons.verified,
                                color: Colors.cyan,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Profile(),
                              );
                            },
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.58,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/cart.svg',
                      title: 'Cart',
                      notifications: 5,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Cart(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/album.svg',
                      title: 'Album',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Album(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/Saved posts.svg',
                      title: 'Saved Post',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const SavedPost(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/nodge.svg',
                      title: 'Nudge',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Nudge(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/mypage.svg',
                      title: 'Pages',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen:const MyPageHomeScreen(),
                          //PageScreen(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/playlist.svg',
                      title: 'Playlist',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const PlayLists(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/gift.svg',
                      title: 'Gifts',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Gift(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath:
                          'assets/new/svg/bottom_drawer/Activity icon.svg',
                      title: 'My Activity',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Activities(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/groups.svg',
                      title: 'My Groups',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Groups(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/mypage.svg',
                      title: 'My Page',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const PageScreen(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/blog.svg',
                      title: 'Blog',
                      notifications: 0,
                      onTap: () {

                        pushReplacement(
                          context: context,
                          screen: const Blog(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/articles.svg',
                      title: 'My Articles',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(

                          context: context,
                          screen:const MyArticleHomeSceen(),
                          //MyArticles(context: context),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/marketplace.svg',
                      title: 'Martket',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Shop(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/products.svg',
                      title: 'My Products',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const MyProducts(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/explore.svg',
                      title: 'Explore',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Explore(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/Find vibes.svg',
                      title: 'Find Vibes',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const FindVibes(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/Popular post.svg',
                      title: 'Popular Posts',
                      notifications: 0,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Blogs(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/events.svg',
                      title: 'Events',
                      notifications: 0,
                      bgColor: orangePrimary,
                      onTap: () {
                        pushReplacement(
                          context: context,
                          screen: const Events(),
                        );
                      },
                    ),
                    BottomModalItems(
                      iconPath: 'assets/new/svg/bottom_drawer/seemore.svg',
                      title: 'See More',
                      notifications: 0,
                      onTap: () {
                        SeeMoreMenu(context: context);
                      },
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