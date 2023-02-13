import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/events/create_event.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/my_sugested.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/chat/chat_profile.dart';
import 'package:vibetag/screens/page/add_page.dart';
import 'package:vibetag/screens/drawer/drawer.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<String> buttonText = [
    'Ongoing',
    'Invited',
  ];
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
                    Header(),
                  ],
                ),
                Container(
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        gap(h: 15),
                        Container(
                          width: double.infinity,
                          height: height * 0.04,
                          margin: spacing(horizontal: 5),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, i) {
                              if (i > 0) {
                                return Container(
                                  padding:
                                      spacing(horizontal: 20, vertical: 10),
                                  margin: spacing(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(width),
                                    color: white,
                                  ),
                                  child: Text(
                                    buttonText[i - 1],
                                    style: TextStyle(
                                      color: grayPrimary,
                                    ),
                                  ),
                                );
                              }
                              return Container(
                                padding: spacing(horizontal: 20, vertical: 10),
                                margin: spacing(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(width),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      HexColor('#FF9200'),
                                      HexColor('#FDBA31')
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'Browse Events',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        gap(h: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
