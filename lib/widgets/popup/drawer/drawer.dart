import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/cart.dart';
import 'package:vibetag/screens/find_friends.dart';
import 'package:vibetag/screens/find_vibes.dart';
import 'package:vibetag/screens/pages.dart';
import 'package:vibetag/widgets/popup/drawer/drawer_item.dart';

import '../../../screens/my_products.dart';
import '../../../utils/constant.dart';

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
      width: width * 0.8,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: spacing(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage('assets/images/streamer.jpg'),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          children: [
                            const Text(
                              'David Millan',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            SvgPicture.asset(
                              'assets/svg/story/star.svg',
                              width: width * 0.05,
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.001,
                        ),
                        const Text(
                          '@david_millan1',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.001,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Pakistan',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Image.asset(
                              'assets/images/flag.png',
                              width: width * 0.05,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
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
                        Container(
                          width: double.maxFinite,
                          padding: spacing(
                            horizontal: width * 0.2,
                            vertical: height * 0.02,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: HexColor('#F0F0F0'),
                            ),
                          ),
                          child: Text("Boost My Vibes"),
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
                        DrawerItems(
                          title: 'Market',
                          imgUrl:
                              'assets/images/drawer/shopping-bag_Gold-bk.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Blog',
                          imgUrl: 'assets/images/drawer/blog.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'My Articals',
                          imgUrl:
                              'assets/images/drawer/My_thoughts_Icon_Gold-bk.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Events',
                          imgUrl: 'assets/images/drawer/event_Gold-bk.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Groups',
                          imgUrl: 'assets/images/drawer/team_Gold.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Advertising',
                          imgUrl: 'assets/images/drawer/Adverting.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Album',
                          imgUrl: 'assets/images/drawer/Album.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Saved Posts',
                          imgUrl:
                              'assets/images/drawer/Save_Post icon_Gold-bk.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Nodge',
                          imgUrl: 'assets/images/drawer/Nodge.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Playlists',
                          imgUrl: 'assets/images/drawer/Playlists.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Gifts',
                          imgUrl: 'assets/images/drawer/team_Gold.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'My Activity',
                          imgUrl: 'assets/images/drawer/history-icon.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Explore',
                          imgUrl: 'assets/images/drawer/Explore_Gold-bk.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Popular Posts',
                          imgUrl: 'assets/images/drawer/popular.png',
                          notifications: 1,
                          isNewNotification: false,
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
                            imgUrl: 'assets/images/drawer/Friends near by.png',
                            notifications: 1,
                            isNewNotification: false,
                          ),
                        ),
                        DrawerItems(
                          title: 'Jobs',
                          imgUrl: 'assets/images/drawer/jobs.png',
                          notifications: 1,
                          isNewNotification: false,
                        ),
                        DrawerItems(
                          title: 'Funding',
                          imgUrl: 'assets/images/drawer/funding-icon.png',
                          notifications: 1,
                          isNewNotification: false,
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
    );
  }
}
