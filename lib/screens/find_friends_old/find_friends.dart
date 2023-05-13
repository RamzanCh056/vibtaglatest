import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';

class FindFriends extends StatefulWidget {
  const FindFriends({super.key});

  @override
  State<FindFriends> createState() => _FindFriendsState();
}

class _FindFriendsState extends State<FindFriends> {
  @override
  final GlobalKey<ScaffoldState> key = GlobalKey();
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: key,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NavBar(),
                    Header(),
                  ],
                ),
                Container(
                  height: height * 0.78,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(
                              width * 0.1,
                            ),
                            color: HexColor('#F9F9F9'),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Find friends',
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              hintStyle: TextStyle(
                                color: HexColor('#D6D6D6'),
                              ),
                              border: InputBorder.none,
                              suffix: Icon(
                                Icons.search,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        DefaultTabController(
                          length: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1.5,
                                      color: HexColor('#707070'),
                                    ),
                                  ),
                                ),
                                child: const TabBar(
                                  unselectedLabelColor:
                                      Color.fromARGB(255, 110, 107, 107),
                                  labelColor: Colors.orange,
                                  indicatorColor: Colors.orange,
                                  indicatorWeight: 4,
                                  labelStyle: TextStyle(
                                    fontSize: 24,
                                  ),
                                  tabs: [
                                    Tab(
                                      icon: SvgIcon('assets/svg/chat/sex.svg'),
                                    ),
                                    Tab(
                                      icon: SvgIcon(
                                          'assets/svg/chat/notification.svg'),
                                    ),
                                    Tab(
                                      icon: SvgIcon(
                                          'assets/svg/chat/location.svg'),
                                    ),
                                    Tab(
                                      icon:
                                          SvgIcon('assets/svg/chat/flower.svg'),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * 0.25,
                                          padding: spacing(
                                            horizontal: width * 0.07,
                                            vertical: height * 0.01,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                borderRadius(width * 0.1),
                                            color: Colors.orange,
                                          ),
                                          child: const FittedBox(
                                            child: Text(
                                              'All',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Container(
                                          width: width * 0.25,
                                          padding: spacing(
                                            horizontal: width * 0.07,
                                            vertical: height * 0.01,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                borderRadius(width * 0.1),
                                            color: HexColor('#D6D6D6'),
                                          ),
                                          child: const FittedBox(
                                            child: Text(
                                              'Female',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Container(
                                          width: width * 0.25,
                                          padding: spacing(
                                            horizontal: width * 0.07,
                                            vertical: height * 0.01,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                borderRadius(width * 0.1),
                                            color: HexColor('#D6D6D6'),
                                          ),
                                          child: const FittedBox(
                                            child: Text(
                                              'Male',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    width: width,
                                    color: HexColor('#707070'),
                                    height: height * 0.0007,
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Container(
                                    width: width * 0.9,
                                    height: height * 0.4,
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        width * 0.03,
                                      ),
                                    ),
                                    child: ListView.builder(
                                      itemCount: 5,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, i) {
                                        return Container(
                                          width: width * 0.6,
                                          alignment: Alignment.topCenter,
                                          color: HexColor('#F9F9F9'),
                                          margin: EdgeInsets.symmetric(
                                            horizontal: width * 0.02,
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                child: Container(
                                                  width: width * 0.6,
                                                  height: height * 0.4,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      width * 0.01,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  width: width * 0.6,
                                                  height: height * 0.1,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        width * 0.03,
                                                      ),
                                                      topRight: Radius.circular(
                                                        width * 0.03,
                                                      ),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/cover.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: height * 0.01,
                                                right: width * 0.02,
                                                child: Container(
                                                  width: width * 0.05,
                                                  height: width * 0.05,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      width * 0.01,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/flag.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: height * 0.045,
                                                right: 0,
                                                left: 0,
                                                child: Container(
                                                  width: width * 0.2,
                                                  height: width * 0.2,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      width * 0.01,
                                                    ),
                                                    child: const CircleAvatar(
                                                      foregroundImage:
                                                          AssetImage(
                                                        'assets/images/streamer.jpg',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: height * 0.16,
                                                right: 0,
                                                left: 0,
                                                child: Container(
                                                  width: width * 0.25,
                                                  child: Column(
                                                    children: const [
                                                      Text(
                                                        'Justin Wilson',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '@justinwilson',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Pakistan',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              128,
                                                              126,
                                                              126),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 80,
                                                child: Container(
                                                  width: width * 0.6,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            width * 0.01,
                                                          ),
                                                          color: HexColor(
                                                              '#F0F0F0'),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    width *
                                                                        0.01,
                                                                vertical:
                                                                    height *
                                                                        0.005),
                                                        child: Column(
                                                          children: [
                                                            const FittedBox(
                                                              child: Text(
                                                                'Likes',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          128,
                                                                          126,
                                                                          126),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: height *
                                                                  0.002,
                                                            ),
                                                            Container(
                                                              width:
                                                                  width * 0.15,
                                                              height: height *
                                                                  0.002,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      173,
                                                                      170,
                                                                      170),
                                                            ),
                                                            SizedBox(
                                                              height: height *
                                                                  0.002,
                                                            ),
                                                            const Text(
                                                              '13K',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .orange,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            width * 0.01,
                                                          ),
                                                          color: HexColor(
                                                              '#F0F0F0'),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    width *
                                                                        0.01,
                                                                vertical:
                                                                    height *
                                                                        0.005),
                                                        child: Column(
                                                          children: [
                                                            const FittedBox(
                                                              child: Text(
                                                                'Following',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          128,
                                                                          126,
                                                                          126),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: height *
                                                                  0.002,
                                                            ),
                                                            Container(
                                                              width:
                                                                  width * 0.15,
                                                              height: height *
                                                                  0.002,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      173,
                                                                      170,
                                                                      170),
                                                            ),
                                                            SizedBox(
                                                              height: height *
                                                                  0.002,
                                                            ),
                                                            const Text(
                                                              '28',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .orange,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: width * 0.17,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            width * 0.01,
                                                          ),
                                                          color: HexColor(
                                                              '#F0F0F0'),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    width *
                                                                        0.01,
                                                                vertical:
                                                                    height *
                                                                        0.005),
                                                        child: Column(
                                                          children: [
                                                            const FittedBox(
                                                              child: Text(
                                                                'Followers',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          128,
                                                                          126,
                                                                          126),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: height *
                                                                  0.002,
                                                            ),
                                                            Container(
                                                              width:
                                                                  width * 0.15,
                                                              height: height *
                                                                  0.002,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      173,
                                                                      170,
                                                                      170),
                                                            ),
                                                            SizedBox(
                                                              height: height *
                                                                  0.002,
                                                            ),
                                                            const Text(
                                                              '8K',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .orange,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                left: 30,
                                                right: 30,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: width * 0.3,
                                                  height: height * 0.05,
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      width * 0.03,
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'Follow',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
