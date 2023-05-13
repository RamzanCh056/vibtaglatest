import 'package:flutter/material.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../utils/constant.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(),
                  ],
                ),
                Column(
                  children: [
                    DefaultTabController(
                      length: 4,
                      initialIndex: 2,
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.06,
                            decoration: BoxDecoration(
                              color: white,
                            ),
                            child: TabBar(
                              labelColor: orange,
                              unselectedLabelColor: blackPrimary,
                              tabs: [
                                Tab(
                                  text: 'Posts',
                                ),
                                Tab(
                                  text: 'Users',
                                ),
                                Tab(
                                  text: 'Pages',
                                ),
                                Tab(
                                  text: 'Groups',
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: height * 0.82,
                            child: TabBarView(
                              children: [
                                Container(),
                                Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.maxFinite,
                                                margin: spacing(
                                                  horizontal: 10,
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      borderRadius(width),
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText: 'Search',
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      left: 50,
                                                      bottom: 0,
                                                    ),
                                                    hintStyle: TextStyle(
                                                      color: grayMed,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                left: 20,
                                                child: Center(
                                                  child: Container(
                                                    width: 32,
                                                    child: Image.asset(
                                                      'assets/new/icons/buzzin_search.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                right: 15,
                                                child: Container(
                                                  margin: spacing(
                                                    vertical: 15,
                                                  ),
                                                  padding: spacing(
                                                    horizontal: 25,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: orange,
                                                    borderRadius:
                                                        borderRadius(width),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 24,
                                                        child: Image.asset(
                                                          'assets/new/icons/filter_search.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      gap(w: 10),
                                                      Text(
                                                        'Filter',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: spacing(
                                            horizontal: 10,
                                          ),
                                          child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 5,
                                            ),
                                            shrinkWrap: true,
                                            itemCount: 10,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      borderRadius(10),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: width * 0.1,
                                                            foregroundImage:
                                                                AssetImage(
                                                              'assets/images/streamer.jpg',
                                                            ),
                                                          ),
                                                          gap(h: 5),
                                                          Text(
                                                            'William Karei',
                                                            style: TextStyle(
                                                              color:
                                                                  blackPrimary,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            'william_k_23',
                                                            style: TextStyle(
                                                              color: grayMed,
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                          gap(h: 10),
                                                          Container(
                                                            width: double
                                                                .maxFinite,
                                                            padding: spacing(
                                                              vertical:
                                                                  width * 0.02,
                                                            ),
                                                            margin: spacing(
                                                              horizontal: 10,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                width: 1,
                                                                color: orange,
                                                              ),
                                                              borderRadius:
                                                                  borderRadius(
                                                                      7),
                                                            ),
                                                            child: Text(
                                                              'Follow',
                                                              style: TextStyle(
                                                                color: orange,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 10,
                                                      top: 10,
                                                      child: Container(
                                                        width: 20,
                                                        child: Image.asset(
                                                          'assets/icons/clear_comment_1.png',
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
                                  ),
                                ),
                                Container(
                                  height: height * 0.82,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.maxFinite,
                                                margin: spacing(
                                                  horizontal: 10,
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      borderRadius(width),
                                                ),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    hintText: 'Search',
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                      left: 50,
                                                      bottom: 0,
                                                    ),
                                                    hintStyle: TextStyle(
                                                      color: grayMed,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                left: 20,
                                                child: Center(
                                                  child: Container(
                                                    width: 32,
                                                    child: Image.asset(
                                                      'assets/new/icons/buzzin_search.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                right: 15,
                                                child: Container(
                                                  margin: spacing(
                                                    vertical: 15,
                                                  ),
                                                  padding: spacing(
                                                    horizontal: 25,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: orange,
                                                    borderRadius:
                                                        borderRadius(width),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 24,
                                                        child: Image.asset(
                                                          'assets/new/icons/filter_search.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      gap(w: 10),
                                                      Text(
                                                        'Filter',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: width,
                                          margin: spacing(
                                            horizontal: 15,
                                            vertical: 10,
                                          ),
                                          child: ListView.builder(
                                            itemCount: 10,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            physics: ScrollPhysics(
                                              parent:
                                                  AlwaysScrollableScrollPhysics(),
                                            ),
                                            itemBuilder: (context, i) {
                                              return Container(
                                                margin: spacing(
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: white,
                                                    borderRadius:
                                                        borderRadius(15)),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: double
                                                                .maxFinite,
                                                            height:
                                                                height * 0.15,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/cover.jpg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          gap(h: height * 0.07),
                                                          Text(
                                                            'VibeTV Official',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            'VibeTV Official',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: grayMed,
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                          gap(h: 15),
                                                          Container(
                                                            margin: spacing(
                                                              horizontal: 15,
                                                            ),
                                                            padding: spacing(
                                                              horizontal: 15,
                                                              vertical: 15,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: grayLight,
                                                              borderRadius:
                                                                  borderRadius(
                                                                      10),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      spacing(
                                                                    vertical:
                                                                        10,
                                                                  ),
                                                                  margin:
                                                                      spacing(
                                                                    vertical: 5,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      bottom:
                                                                          BorderSide(
                                                                        width:
                                                                            2,
                                                                        color:
                                                                            grayMed,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'Hours'),
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                10,
                                                                            height:
                                                                                10,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: borderRadius(width),
                                                                              color: green,
                                                                            ),
                                                                          ),
                                                                          gap(w: 5),
                                                                          Text(
                                                                              'Open Now'),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      spacing(
                                                                    vertical:
                                                                        10,
                                                                  ),
                                                                  margin:
                                                                      spacing(
                                                                    vertical: 5,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      bottom:
                                                                          BorderSide(
                                                                        width:
                                                                            2,
                                                                        color:
                                                                            grayMed,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'Open Days'),
                                                                      Text(
                                                                          'Mon - Sat'),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      spacing(
                                                                    vertical:
                                                                        10,
                                                                  ),
                                                                  margin:
                                                                      spacing(
                                                                    vertical: 5,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      bottom:
                                                                          BorderSide(
                                                                        width:
                                                                            2,
                                                                        color:
                                                                            grayMed,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'Closed Day'),
                                                                      Text(
                                                                          'Sun Only'),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      spacing(
                                                                    vertical:
                                                                        10,
                                                                  ),
                                                                  margin:
                                                                      spacing(
                                                                    vertical: 5,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      bottom:
                                                                          BorderSide(
                                                                        width:
                                                                            2,
                                                                        color:
                                                                            grayMed,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'Open Hours'),
                                                                      Text(
                                                                          '12PM - 8PM'),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          gap(h: 15),
                                                          Container(
                                                            margin: spacing(
                                                                horizontal: 25),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      spacing(
                                                                    vertical:
                                                                        10,
                                                                  ),
                                                                  width: width *
                                                                      0.35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        gradient,
                                                                    borderRadius:
                                                                        borderRadius(
                                                                            10),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    'Follow',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                gap(w: 15),
                                                                Container(
                                                                  padding:
                                                                      spacing(
                                                                    vertical:
                                                                        10,
                                                                  ),
                                                                  width: width *
                                                                      0.35,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      width: 2,
                                                                      color:
                                                                          orange,
                                                                    ),
                                                                    borderRadius:
                                                                        borderRadius(
                                                                            10),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    'Message',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          orange,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          gap(h: 20),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      right: 0,
                                                      top: height * 0.1,
                                                      child: CircleAvatar(
                                                        radius: width * 0.1,
                                                        foregroundImage:
                                                            AssetImage(
                                                          'assets/images/streamer.jpg',
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
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
