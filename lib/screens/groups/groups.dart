import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/groups/add_new_group.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/my_sugested.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/page/add_page.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      key: _key,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                    )
                  ],
                ),
                Container(
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        DefaultTabController(
                          length: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: HexColor('#7B7B7B'),
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
                                    fontSize: 14,
                                  ),
                                  onTap: (value) {
                                    if (value == 3) {
                                      pushRoute(
                                        context: context,
                                        screen: AddNewGroup(),
                                      );
                                    }
                                  },
                                  tabs: [
                                    const Tab(
                                      icon: Text('My Groups'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    const Tab(
                                      icon: Text('Suggested Groups'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    const Tab(
                                      icon: Text('Joined Groups'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    Tab(
                                      iconMargin: const EdgeInsets.all(0),
                                      icon: Container(
                                        width: width * 0.18,
                                        alignment: Alignment.center,
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
                                                fontSize: 10,
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
                                      text: '',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: width,
                                height: height * 0.75,
                                child: TabBarView(
                                  children: [
                                    //My Groups
                                    Container(
                                      width: width,
                                      height: height * 0.75,
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: spacing(
                                                horizontal: width * 0.05,
                                                vertical: 4,
                                              ),
                                              width: width,
                                              height: height * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                              ),
                                              alignment: Alignment.center,
                                              child: ClipRRect(
                                                borderRadius: borderRadius(10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: double.maxFinite,
                                                      height: height * 0.18,
                                                      decoration: BoxDecoration(
                                                        color: medGray,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: spacing(
                                                        horizontal: 10,
                                                        vertical: 10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: white,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                              10,
                                                            ),
                                                          )),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Haritla',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        24,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height:
                                                                      height *
                                                                          0.05,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: const [
                                                                          Icon(
                                                                            Icons.thumb_up,
                                                                            size:
                                                                                16,
                                                                            color:
                                                                                Colors.orange,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            '23K people',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: const [
                                                                          Icon(
                                                                            Icons.label,
                                                                            size:
                                                                                16,
                                                                            color:
                                                                                Colors.orange,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            'Cars and Vehicles',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: spacing(
                                                              horizontal: 25,
                                                              vertical: 5,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: orange,
                                                              borderRadius:
                                                                  borderRadius(
                                                                      5),
                                                            ),
                                                            child: Text(
                                                              'Edit',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    textXSm,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),

                                    //Suggested Groups
                                    Container(
                                      width: width,
                                      height: height * 0.75,
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Suggested(),
                                    ),
                                    //Joined Groups
                                    Container(
                                      width: width,
                                      height: height * 0.75,
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: spacing(
                                                horizontal: width * 0.05,
                                                vertical: 4,
                                              ),
                                              width: width,
                                              height: height * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                              ),
                                              alignment: Alignment.center,
                                              child: ClipRRect(
                                                borderRadius: borderRadius(10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: double.maxFinite,
                                                      height: height * 0.18,
                                                      decoration: BoxDecoration(
                                                        color: medGray,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: spacing(
                                                        horizontal: 10,
                                                        vertical: 10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: white,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                              10,
                                                            ),
                                                          )),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Haritla',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        24,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height:
                                                                      height *
                                                                          0.05,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: const [
                                                                          Icon(
                                                                            Icons.thumb_up,
                                                                            size:
                                                                                16,
                                                                            color:
                                                                                Colors.orange,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            '23K people',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: const [
                                                                          Icon(
                                                                            Icons.label,
                                                                            size:
                                                                                16,
                                                                            color:
                                                                                Colors.orange,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            'Cars and Vehicles',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: spacing(
                                                              horizontal: 25,
                                                              vertical: 5,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: orange,
                                                              borderRadius:
                                                                  borderRadius(
                                                                      5),
                                                            ),
                                                            child: Text(
                                                              'Edit',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    textXSm,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    //Create Groups
                                    Container(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SecondaryFooter(),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
