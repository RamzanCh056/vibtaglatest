import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/my_sugested.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/popup/chat/chat_profile.dart';
import 'package:vibetag/screens/add_page.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
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
                      onTap: () {},
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
                                        screen: AddNewPag(),
                                      );
                                    }
                                  },
                                  tabs: [
                                    const Tab(
                                      icon: Text('My Page'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    const Tab(
                                      icon: Text('Suggested Page'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    const Tab(
                                      icon: Text('My Like'),
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

                                    //My page
                                    Container(
                                      width: width,
                                      height: height * 0.75,
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: spacing(
                                                horizontal: width * 0.05,
                                                vertical: 4,
                                              ),
                                              width: width,
                                              height: height * 0.12,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      borderRadius(10)),
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  CircleAvatar(
                                                    radius: width * 0.07,
                                                    backgroundColor:
                                                        HexColor('#E4E4E4'),
                                                  ),
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
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: height * 0.05,
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
                                                                    Icons
                                                                        .thumb_up,
                                                                    size: 16,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    '23K people',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons.label,
                                                                    size: 16,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Cars and Vehicles',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
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
                                                    width: width * 0.1,
                                                    height: width * 0.1,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          borderRadius(
                                                              width * 0.15),
                                                      color: Colors.blue,
                                                    ),
                                                    child: const Icon(
                                                      Icons.edit_note,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),

                                    //Suggested page
                                    Container(
                                      width: width,
                                      height: height * 0.75,
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Suggested(),
                                    ),
                                    Container(
                                      width: width,
                                      height: height * 0.75,
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: spacing(
                                                horizontal: width * 0.05,
                                                vertical: 4,
                                              ),
                                              width: width,
                                              height: height * 0.12,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      borderRadius(10)),
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  CircleAvatar(
                                                    radius: width * 0.07,
                                                    backgroundColor:
                                                        HexColor('#E4E4E4'),
                                                  ),
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
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: height * 0.05,
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
                                                                    Icons
                                                                        .thumb_up,
                                                                    size: 16,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    '23K people',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons.label,
                                                                    size: 16,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Cars and Vehicles',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
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
                                                    width: width * 0.1,
                                                    height: width * 0.1,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          borderRadius(
                                                              width * 0.15),
                                                      color: Colors.blue,
                                                    ),
                                                    child: const Icon(
                                                      Icons.edit_note,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    Container(
                                      width: width,
                                      height: height * 0.75,
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: spacing(
                                                horizontal: width * 0.05,
                                                vertical: 4,
                                              ),
                                              width: width,
                                              height: height * 0.12,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      borderRadius(10)),
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  CircleAvatar(
                                                    radius: width * 0.07,
                                                    backgroundColor:
                                                        HexColor('#E4E4E4'),
                                                  ),
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
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: height * 0.05,
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
                                                                    Icons
                                                                        .thumb_up,
                                                                    size: 16,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    '23K people',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons.label,
                                                                    size: 16,
                                                                    color: Colors
                                                                        .orange,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'Cars and Vehicles',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
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
                                                    width: width * 0.1,
                                                    height: width * 0.1,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          borderRadius(
                                                              width * 0.15),
                                                      color: Colors.blue,
                                                    ),
                                                    child: const Icon(
                                                      Icons.edit_note,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
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
                Container(
                  width: width,
                  height: height * 0.25,
                  padding: spacing(
                    horizontal: width * 0.05,
                    vertical: height * 0.03,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * 0.25,
                            child: const Text(
                              'Market Place Terms',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: width * 0.2,
                            child: const Text(
                              'Your Wishlist',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * 0.2,
                            child: const Text(
                              'Refund Policy',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: width * 0.2,
                            child: const Text(
                              'On Sale Items',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * 0.2,
                            child: const Text(
                              'Start Selling',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: width * 0.2,
                            child: const Text(
                              'Find Help & support',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ],
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
