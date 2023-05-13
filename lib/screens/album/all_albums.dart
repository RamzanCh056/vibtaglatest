import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../drawer/shop_drawer.dart';
import '../header/header.dart';
import '../shop/shop_header.dart';

class AllAlbums extends StatefulWidget {
  const AllAlbums({super.key});

  @override
  State<AllAlbums> createState() => _AllAlbumsState();
}

class _AllAlbumsState extends State<AllAlbums> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  TextEditingController albumName = TextEditingController();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NavBar(),
                    Header(
                  
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width,
                          height: height * 0.2,
                          color: medGray,
                        ),
                        Container(
                          width: width * 0.9,
                          child: Column(
                            children: [
                              Container(
                                height: height * 0.21,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      height: height * 0.16,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width * 0.2,
                                            child: CircleAvatar(
                                              backgroundColor: darkGray,
                                              radius: width * 0.07,
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.65,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Album name',
                                                          style: TextStyle(
                                                            fontSize: textMed,
                                                          ),
                                                        ),
                                                        Text(
                                                          '1 min',
                                                          style: TextStyle(
                                                            fontSize: textXSm,
                                                            color: darkGray,
                                                          ),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ],
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  width: double.maxFinite,
                                                  child: const Text(
                                                    'UFO hearing: Number of \"Unidentified Aerial Phenomenon\" sighting rising, US says',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: double.maxFinite,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: spacing(
                                                          horizontal: 3,
                                                          vertical: 3,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: medGray,
                                                          borderRadius:
                                                              borderRadius(30),
                                                        ),
                                                        child: const Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                          size: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        'Celestino, Aurelle and 3k+ others (s)',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      height: 1,
                                      color: darkGray,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: spacing(
                                        horizontal: width * 0.01,
                                        vertical: 0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 30,
                                                child: Image.asset(
                                                  'assets/icons/like1.png',
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Column(
                                                children: const [
                                                  Text(
                                                    'Likes',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    '465',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 30,
                                                child: Image.asset(
                                                  'assets/icons/comment1.png',
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Column(
                                                children: const [
                                                  Text(
                                                    'Comments',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    '321',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 30,
                                                child: Image.asset(
                                                  'assets/icons/revibe1.png',
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Column(
                                                children: const [
                                                  Text(
                                                    'Revibed',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    '212',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
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
                                height: 10,
                              ),
                              Container(
                                width: double.maxFinite,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'You may like',
                                  style: TextStyle(
                                    color: darkGray,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.maxFinite,
                                height: height * 0.7,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 10,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      width: double.maxFinite,
                                      height: height * 0.3,
                                      margin: spacing(
                                        horizontal: 0,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: medGray,
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: borderRadius(10),
                                        child: Stack(children: [
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: white,
                                              ),
                                              height: height * 0.09,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: spacing(
                                                      horizontal: 5,
                                                      vertical: 5,
                                                    ),
                                                    child: CircleAvatar(
                                                      backgroundColor: darkGray,
                                                      radius: width * 0.06,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Album name',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Text(
                                                        'By Wallis Larkin 2 yrs',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: darkGray,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: width * 0.2,
                                                        padding: spacing(
                                                          horizontal: 2,
                                                          vertical: 2,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: orange,
                                                          borderRadius:
                                                              borderRadius(5),
                                                        ),
                                                        child: Text(
                                                          '4M+ views',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SecondaryFooter(),
                        const AppFooter(),
                        const SizedBox(
                          height: 20,
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
