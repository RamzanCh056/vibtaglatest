import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/advertising/compaigns.dart';
import 'package:vibetag/screens/advertising/new_compaign.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';

import '../../utils/constant.dart';

class Advertising extends StatefulWidget {
  const Advertising({super.key});

  @override
  State<Advertising> createState() => _AdvertisingState();
}

class _AdvertisingState extends State<Advertising> {
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
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(onTap: () {
                      _key.currentState!.openDrawer();
                    })
                  ],
                ),
                Container(
                  height: height * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width * 0.9,
                          height: height * 0.09,
                          padding: spacing(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: borderRadius(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Balance',
                                style: TextStyle(
                                  color: white,
                                  fontSize: textXSm,
                                ),
                              ),
                              Text(
                                '\£0.00',
                                style: TextStyle(
                                  color: white,
                                  fontSize: textXl,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.08,
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
                                    fontSize: 14,
                                  ),
                                  onTap: (value) {},
                                  tabs: const [
                                    Tab(
                                      icon: Text('Compaigns'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    Tab(
                                      icon: Text('Wallet & Credits'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    Tab(
                                      icon: Text('New Compaign'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: width,
                                height: height * 0.75,
                                child: TabBarView(
                                  children: [
                                    Compaigns(),
                                    Container(),
                                    CreateNewCompaign()
                                  ],
                                ),
                              ),
                            ],
                          ),
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
