import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/events/create_event.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';

class Events_Old extends StatefulWidget {
  const Events_Old({super.key});

  @override
  State<Events_Old> createState() => _Events_OldState();
}

class _Events_OldState extends State<Events_Old> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
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
                     
                    ),
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
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(10),
                                ),
                                margin: spacing(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                padding: spacing(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: height * 0.07,
                                      width: width * 0.7,
                                      alignment: Alignment.center,
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
                                        unselectedLabelColor:
                                            HexColor('#7B7B7B'),
                                        labelColor: Colors.orange,
                                        indicatorColor: Colors.orange,
                                        labelStyle: const TextStyle(
                                          fontSize: 12,
                                        ),
                                        tabs: const [
                                          Tab(
                                            icon: Text('Browse Events'),
                                            iconMargin: EdgeInsets.all(0),
                                          ),
                                          Tab(
                                            icon: Text('Events Going'),
                                            iconMargin: EdgeInsets.all(0),
                                          ),
                                          Tab(
                                            icon: Text('Invited'),
                                            iconMargin: EdgeInsets.all(0),
                                          ),
                                          Tab(
                                            icon: Text('Events Internation'),
                                            iconMargin: EdgeInsets.all(0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        pushRoute(
                                          context: context,
                                          screen: const CreateEvent(),
                                        );
                                      },
                                      child: Container(
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
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: spacing(
                                              horizontal: 15,
                                              vertical: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: borderRadius(50),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/svg/price-tag.svg',
                                              width: width * 0.2,
                                              color: darkGray,
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.8,
                                            padding: spacing(
                                              horizontal: 15,
                                              vertical: 15,
                                            ),
                                            child: Text(
                                              'It seems like no one created an event yet!',
                                              style: TextStyle(
                                                color: darkGray,
                                                fontSize: textMed,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(),
                                    Container(),
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
