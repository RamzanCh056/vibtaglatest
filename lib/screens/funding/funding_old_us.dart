import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/funding/create_new_funding.dart';
import 'package:vibetag/screens/groups/add_new_group.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/bottom_navigation_bar_widget.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/my_sugested.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/page/add_page.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class Funding_Old extends StatefulWidget {
  const Funding_Old({super.key});

  @override
  State<Funding_Old> createState() => _Funding_OldState();
}

class _Funding_OldState extends State<Funding_Old> {
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
                                          onTap: () {},
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
                                                'Funding',
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
                        const SizedBox(
                          height: 5,
                        ),
                        DefaultTabController(
                          length: 3,
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
                                    if (value == 2) {
                                      createBottomModalSheet(
                                        context: context,
                                        screen: CreateFundingRequest(),
                                      );
                                    }
                                  },
                                  tabs: [
                                    const Tab(
                                      icon: Text('Browse Funding'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    const Tab(
                                      icon: Text('My Funding'),
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
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: width * 0.5,
                                            child: Text(
                                              'YOUR HELPING HANDS.',
                                              style: TextStyle(
                                                color: darkGray,
                                                fontSize: textXXl,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: width * 0.95,
                                                  height: height * 0.2,
                                                  color: medGray,
                                                ),
                                                Container(
                                                  width: double.maxFinite,
                                                  height: height * 0.15,
                                                  decoration: BoxDecoration(
                                                    color: white,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        leading: Container(
                                                          width: width * 0.08,
                                                          alignment:
                                                              Alignment.center,
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                darkGray,
                                                            radius:
                                                                width * 0.05,
                                                          ),
                                                        ),
                                                        title: Text(
                                                          'Design Web UIUX',
                                                          style: TextStyle(
                                                            color: accent,
                                                          ),
                                                        ),
                                                        subtitle: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                              'Ali Aslam',
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              width: 5,
                                                              height: 5,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: darkGray,
                                                                borderRadius:
                                                                    borderRadius(
                                                                        5),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            const Text(
                                                              '26 Aug 2022',
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: width * 0.15,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Text(
                                                                  '\$0 Raised of 200\$',
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                width: width *
                                                                    0.75,
                                                                height: 5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      darkGray,
                                                                  borderRadius:
                                                                      borderRadius(
                                                                          5),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Positioned(
                                                                      child:
                                                                          Container(
                                                                        width: width *
                                                                            0.3,
                                                                        height:
                                                                            5,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              blue,
                                                                          borderRadius:
                                                                              borderRadius(5),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: width * 0.95,
                                            height: height * 0.2,
                                            color: medGray,
                                          ),
                                          Container(
                                            width: double.maxFinite,
                                            height: height * 0.16,
                                            decoration: BoxDecoration(
                                              color: white,
                                            ),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: Container(
                                                    width: width * 0.08,
                                                    alignment: Alignment.center,
                                                    child: CircleAvatar(
                                                      backgroundColor: darkGray,
                                                      radius: width * 0.05,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    'Design Web UIUX',
                                                    style: TextStyle(
                                                      color: accent,
                                                    ),
                                                  ),
                                                  subtitle: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                        'Ali Aslam',
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 5,
                                                        height: 5,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: darkGray,
                                                          borderRadius:
                                                              borderRadius(5),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const Text(
                                                        '26 Aug 2022',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: spacing(
                                                        horizontal: 25,
                                                        vertical: 5,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: orange,
                                                          borderRadius:
                                                              borderRadius(5)),
                                                      child: Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                          color: white,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      padding: spacing(
                                                        horizontal: 25,
                                                        vertical: 5,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            borderRadius(5),
                                                        border: Border.all(
                                                          width: 2,
                                                          color: orange,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                          color: orange,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
