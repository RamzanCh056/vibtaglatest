import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/album/all_albums.dart';
import 'package:vibetag/screens/album/create_album.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../drawer/shop_drawer.dart';
import '../shop/shop_header.dart';

class Album extends StatefulWidget {
  const Album({super.key});

  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const NavBar(),
                    Header(
                      onTap: () {
                        key.currentState!.openDrawer();
                      },
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.08,
                          width: width,
                          child: Card(
                            child: Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          pushRoute(
                                            context: context,
                                            screen: const AllAlbums(),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Center(
                                              child: Container(
                                                width: width * 0.07,
                                                height: width * 0.07,
                                                padding: spacing(
                                                  horizontal: 5,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: orange,
                                                  borderRadius:
                                                      borderRadius(20),
                                                ),
                                                child: SvgIcon(
                                                  'assets/svg/post/image1.svg',
                                                  width: width * 0.04,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'My Album',
                                              style: TextStyle(
                                                fontSize: textMed,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pushRoute(
                                            context: context,
                                            screen: const CreateAlbum(),
                                          );
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          margin: spacing(
                                            horizontal: 0,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Create',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Container(
                                                width: 15,
                                                child: const SvgIcon(
                                                  'assets/svg/chat/plus.svg',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.95,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(15),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: spacing(
                                    horizontal: width * 0.05,
                                    vertical: 10,
                                  ),
                                  padding: spacing(
                                    horizontal: width * 0.05,
                                    vertical: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Latest Albums',
                                        style: TextStyle(
                                          fontSize: textSm,
                                        ),
                                      ),
                                      Text(
                                        'See more',
                                        style: TextStyle(
                                          fontSize: textXSm,
                                          color: blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height: width * 0.42,
                                  child: ListView.builder(
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        width: width * 0.42,
                                        height: width * 0.42,
                                        margin: spacing(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: lightGray,
                                          borderRadius: borderRadius(15),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: Center(
                                                child: Icon(
                                                  Icons.photo,
                                                  size: 48,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              bottom: 10,
                                              left: 0,
                                              right: 0,
                                              child: Center(
                                                child: Text(
                                                  'Album Name',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  margin: spacing(
                                    horizontal: width * 0.05,
                                    vertical: 10,
                                  ),
                                  padding: spacing(
                                    horizontal: width * 0.05,
                                    vertical: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Trendy Albums',
                                        style: TextStyle(
                                          fontSize: textSm,
                                        ),
                                      ),
                                      Text(
                                        'See more',
                                        style: TextStyle(
                                          fontSize: textXSm,
                                          color: blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height: height * 0.25,
                                  child: ListView.builder(
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        width: width * 0.42,
                                        height: width * 0.42,
                                        margin: spacing(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: lightGray,
                                          borderRadius: borderRadius(15),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: Center(
                                                child: Icon(
                                                  Icons.photo,
                                                  size: 48,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              bottom: 10,
                                              left: 0,
                                              right: 0,
                                              child: Center(
                                                child: Text(
                                                  'Album Name',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SecondaryFooter(),
                        const AppFooter(),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
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
