import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:svg_icon/svg_icon.dart';

import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
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
                DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.08,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                              color: HexColor('#000000'),
                            ),
                          ),
                        ),
                        child: TabBar(
                          indicatorPadding: EdgeInsets.zero,
                          indicatorWeight: 4,
                          padding: spacing(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          isScrollable: true,
                          unselectedLabelColor: HexColor('#7B7B7B'),
                          labelColor: Colors.orange,
                          indicatorColor: Colors.orange,
                          labelStyle: const TextStyle(
                            fontSize: 18,
                          ),
                          onTap: (value) {},
                          tabs: [
                            Tab(
                              icon: Container(
                                width: width * 0.4,
                                alignment: Alignment.center,
                                child: Text('Activities'),
                              ),
                              iconMargin: const EdgeInsets.all(0),
                            ),
                            Tab(
                              icon: Container(
                                width: width * 0.4,
                                alignment: Alignment.center,
                                child: Text('Viewed Posts'),
                              ),
                              iconMargin: const EdgeInsets.all(0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        width: width,
                        height: height * 0.75,
                        child: TabBarView(
                          children: [
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      width: width * 0.95,
                                      height: height * 0.08,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            bottom: 0,
                                            left: 10,
                                            child: Center(
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: medGray,
                                                  borderRadius:
                                                      borderRadius(width * 0.1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            bottom: 0,
                                            left: 30,
                                            child: Center(
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: medGray,
                                                  borderRadius:
                                                      borderRadius(width * 0.1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            bottom: 0,
                                            left: 80,
                                            child: Row(
                                              children: [
                                                Text(
                                                  'You',
                                                  style: TextStyle(
                                                    color: blue,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Text(
                                                  'started following',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Davidson',
                                                  style: TextStyle(
                                                    color: blue,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Text(
                                                  '4 w',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Positioned(
                                            top: 0,
                                            bottom: 0,
                                            right: 10,
                                            child: Center(
                                                child: Text(
                                              '18-02-2022',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: width * 0.95,
                                      height: height * 0.55,
                                      child: ListView.builder(
                                        itemCount: 2,
                                        itemBuilder: (context, i) {
                                          return Container(
                                            margin: spacing(
                                                horizontal: 0, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius(15),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: borderRadius(15),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.15,
                                                    width: width * 0.3,
                                                    decoration: BoxDecoration(
                                                      color: medGray,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: width * 0.65,
                                                    height: height * 0.15,
                                                    padding: spacing(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                      color: white,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(15),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'You',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          blue,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  const Text(
                                                                    'viewed Breaking News',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'post',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          blue,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  const Text(
                                                                    '4 w',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          const Text(
                                                              'Lorem Ipsum has been the industry\'s standard dummy text'),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                    'By:',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Breaking News',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          blue,
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  const Text(
                                                                    '4 w',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              i > 0
                                                                  ? Container(
                                                                      padding:
                                                                          spacing(
                                                                        horizontal:
                                                                            7,
                                                                        vertical:
                                                                            3,
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              orange,
                                                                          borderRadius:
                                                                              borderRadius(5)),
                                                                      child:
                                                                          Text(
                                                                        '8060985 views',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              white,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Container(),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: width,
                              alignment: Alignment.topCenter,
                              margin: spacing(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Container(
                                width: width * 0.95,
                                height: height * 0.75,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      margin:
                                          spacing(horizontal: 0, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: borderRadius(15),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: height * 0.15,
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                color: medGray,
                                              ),
                                            ),
                                            Container(
                                              width: width * 0.65,
                                              height: height * 0.15,
                                              padding: spacing(
                                                  horizontal: 10, vertical: 10),
                                              decoration: BoxDecoration(
                                                color: white,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'You',
                                                              style: TextStyle(
                                                                color: blue,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            const Text(
                                                              'viewed Breaking News',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'post',
                                                              style: TextStyle(
                                                                color: blue,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            const Text(
                                                              '4 w',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                        'Lorem Ipsum has been the industry\'s standard dummy text'),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'By:',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Breaking News',
                                                              style: TextStyle(
                                                                color: blue,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            const Text(
                                                              '4 w',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        i > 0
                                                            ? Container(
                                                                padding:
                                                                    spacing(
                                                                  horizontal: 7,
                                                                  vertical: 3,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        orange,
                                                                    borderRadius:
                                                                        borderRadius(
                                                                            5)),
                                                                child: Text(
                                                                  '8060985 views',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        white,
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
