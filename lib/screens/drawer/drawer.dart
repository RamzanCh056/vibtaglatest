import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/screens/activties/activities.dart';
import 'package:vibetag/screens/album/album.dart';
import 'package:vibetag/screens/article/article.dart';
import 'package:vibetag/screens/advertising/advertising.dart';
import 'package:vibetag/screens/auth/login.dart';
import 'package:vibetag/screens/blog/blogs.dart';
import 'package:vibetag/screens/funding/funding.dart';
import 'package:vibetag/screens/gift/gift.dart';
import 'package:vibetag/screens/memories/memories.dart';
import 'package:vibetag/screens/offers/offers.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/screens/nudge/nudge.dart';
import 'package:vibetag/screens/saved_post/saved_post.dart';
import 'package:vibetag/screens/shop/cart.dart';
import 'package:vibetag/screens/find_friends_old/find_friends.dart';
import 'package:vibetag/screens/find%20vibes/find_vibes.dart';
import 'package:vibetag/screens/groups/groups.dart';
import 'package:vibetag/screens/page/pages.dart';
import 'package:vibetag/screens/drawer/drawer_item.dart';
import 'package:vibetag/screens/shop/shop.dart';
import '../explore/explore.dart';
import '../playlists/playlist.dart';
import '../shop/product/my_products.dart';
import '../../utils/constant.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Drawer(
      width: width * 0.95,
      backgroundColor: darkGrayNew,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            right: width * 0.07,
            left: width * 0.03,
            top: 10,
            bottom: 10,
          ),
          width: width * 0.85,
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    pushRoute(
                      context: context,
                      screen: Profile(
                        user_id: loginUserId.toString(),
                      ),
                    );
                  },
                  child: Container(
                    padding: spacing(
                      horizontal: width * 0.05,
                      vertical: height * 0.02,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: spacing(
                            vertical: 4,
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: borderRadius(width),
                          ),
                          child: const CircleAvatar(
                            foregroundImage: AssetImage(
                              'assets/images/streamer.jpg',
                            ),
                            radius: 30,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * 0.3,
                                    child: const Text(
                                      'David Millan',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: lightGray,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              '@david_millan1',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.001,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/flag.png',
                                  width: width * 0.05,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Pakistan',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: height * 0.9,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: darkGray,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Cart(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Cart',
                              imgUrl: 'assets/images/drawer/Cart.png',
                              notifications: 1,
                              isNewNotification: true,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const FindVibes(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Find Vibes',
                              imgUrl: 'assets/images/drawer/find-vibe.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: Pages(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Pages',
                              imgUrl: 'assets/images/drawer/page-bk.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: MyProducts(),
                              );
                            },
                            child: DrawerItems(
                              title: 'My Products',
                              imgUrl: 'assets/images/drawer/Productsd.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Shop(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Market',
                              imgUrl:
                                  'assets/images/drawer/shopping-bag_Gold-bk.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Blogs(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Blog',
                              imgUrl: 'assets/images/drawer/blog.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Article(),
                              );
                            },
                            child: DrawerItems(
                              title: 'My Articals',
                              imgUrl:
                                  'assets/images/drawer/My_thoughts_Icon_Gold-bk.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: DrawerItems(
                              title: 'Events',
                              imgUrl: 'assets/images/drawer/event_Gold-bk.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Groups(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Groups',
                              imgUrl: 'assets/images/drawer/team_Gold.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Advertising(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Advertising',
                              imgUrl: 'assets/images/drawer/Adverting.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Album(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Album',
                              imgUrl: 'assets/images/drawer/Album.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const SavedPost(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Saved Posts',
                              imgUrl:
                                  'assets/images/drawer/Save_Post icon_Gold-bk.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Nudge(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Nudge',
                              imgUrl: 'assets/images/drawer/Nodge.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const PlayList(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Playlists',
                              imgUrl: 'assets/images/drawer/Playlists.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Gift(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Gifts',
                              imgUrl: 'assets/images/drawer/team_Gold.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Activities(),
                              );
                            },
                            child: DrawerItems(
                              title: 'My Activity',
                              imgUrl: 'assets/images/drawer/history-icon.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Explore(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Explore',
                              imgUrl:
                                  'assets/images/drawer/Explore_Gold-bk.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Explore(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Popular Posts',
                              imgUrl: 'assets/images/drawer/popular.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: FindFriends(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Find Friends',
                              imgUrl:
                                  'assets/images/drawer/Friends near by.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Offer(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Offer',
                              imgUrl:
                                  'assets/images/drawer/Friends near by.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Memories(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Memory',
                              imgUrl:
                                  'assets/images/drawer/Friends near by.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          
                          InkWell(
                            onTap: () {
                              pushRoute(
                                context: context,
                                screen: const Funding(),
                              );
                            },
                            child: DrawerItems(
                              title: 'Funding',
                              imgUrl: 'assets/images/drawer/funding-icon.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              await preferences.clear().then((value) {
                                pushRoute(
                                  context: context,
                                  screen: const Login(),
                                );
                              });
                            },
                            child: DrawerItems(
                              title: 'Logout',
                              imgUrl: 'assets/images/drawer/funding-icon.png',
                              notifications: 1,
                              isNewNotification: false,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
