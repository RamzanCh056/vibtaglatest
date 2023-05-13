import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:svg_icon/svg_icon.dart';

import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../header/header.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  int currentActive = 0;
  List<String> buttonText = [
    'Activities',
    'History',
  ];

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
                    NavBar(),
                    Header(),
                  ],
                ),
                gap(h: 10),
                Container(
                  width: double.infinity,
                  height: height * 0.05,
                  child: ListView.builder(
                    itemCount: buttonText.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: spacing(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            currentActive = i;
                            setState(() {});
                          },
                          child: Container(
                            padding: spacing(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            alignment: Alignment.center,
                            decoration: i == currentActive
                                ? BoxDecoration(
                                    gradient: gradient,
                                    borderRadius: borderRadius(width),
                                  )
                                : BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(width),
                                  ),
                            child: Text(
                              buttonText[i],
                              style: TextStyle(
                                color:
                                    i == currentActive ? white : blackPrimary,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                gap(h: 15),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: spacing(vertical: 5),
                      padding: spacing(vertical: 7),
                      decoration: BoxDecoration(
                        color: white,
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: width * 0.07,
                                foregroundImage:
                                    AssetImage('assets/images/streamer.jpg'),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(width),
                                    color: HexColor('#FFA6A6'),
                                  ),
                                ),
                              )
                            ],
                          ),
                          gap(
                            w: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Ramzan Ali',
                                    style: TextStyle(
                                      color: blackPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    ' reacted to Neha Singh post.',
                                    style: TextStyle(
                                      color: blackPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              gap(h: 5),
                              Text(
                                '6 days ago',
                                style: TextStyle(
                                  color: blackPrimary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
