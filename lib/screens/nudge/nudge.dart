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

class Nudge extends StatefulWidget {
  const Nudge({super.key});

  @override
  State<Nudge> createState() => _NudgeState();
}

class _NudgeState extends State<Nudge> {
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
                  height: height * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.08,
                          width: width,
                          child: Card(
                            color: backgroundColor,
                            child: Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: spacing(
                                      horizontal: 0,
                                      vertical: 12,
                                    ),
                                    child: Row(
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                'Nodge',
                                                style: TextStyle(
                                                  fontSize: textMed,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: spacing(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          margin: spacing(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(
                                10,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  pushRoute(
                                    context: context,
                                    screen: const AllAlbums(),
                                  );
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: width * 0.1,
                                        height: width * 0.1,
                                        decoration: BoxDecoration(
                                          borderRadius: borderRadius(20),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: darkGray,
                                          radius: width * 0.05,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rphyne',
                                          style: TextStyle(
                                            fontSize: textSm,
                                            color: orange,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Nodge you',
                                          style: TextStyle(
                                            fontSize: textSm,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.keyboard_arrow_left_outlined,
                                      size: 32,
                                      color: blue,
                                    ),
                                    Text(
                                      'Go Back',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.06,
                                width: width * 0.45,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: borderRadius(10),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Nodge Back',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SecondaryFooter(),
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}