import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
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
                  height: height * 0.9,
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
                        Container(
                          height: height * 0.8,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: spacing(horizontal: 15, vertical: 7),
                                child: ClipRRect(
                                  borderRadius: borderRadius(15),
                                  child: Container(
                                    color: white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            'assets/images/streamer.jpg'),
                                        gap(h: 10),
                                        Container(
                                          margin: spacing(horizontal: 10),
                                          child: Text(
                                              'Cricket Match PSL 8 this year'),
                                        ),
                                        gap(h: 10),
                                        Container(
                                          margin: spacing(horizontal: 15),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: spacing(
                                                    horizontal: 10,
                                                    vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: grayLight,
                                                  borderRadius:
                                                      borderRadius(width),
                                                ),
                                                child: Image.asset(
                                                    'assets/new/icons/Calendar.png'),
                                              ),
                                              gap(w: 15),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '14 December, 2021',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: blackPrimary,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Tuesday, 4:00PM - 9:00PM',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: grayMed,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        gap(h: 10),
                                        Container(
                                          margin: spacing(horizontal: 15),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: spacing(
                                                    horizontal: 10,
                                                    vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: grayLight,
                                                  borderRadius:
                                                      borderRadius(width),
                                                ),
                                                child: Image.asset(
                                                    'assets/new/icons/location_event.png'),
                                              ),
                                              gap(w: 15),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Gala Convention Center',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: blackPrimary,
                                                    ),
                                                  ),
                                                  Text(
                                                    '36 Rot street, Los angeles',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: grayMed,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        gap(h: 15),
                                        Container(
                                          padding: spacing(
                                              horizontal: 20, vertical: 12),
                                          margin: spacing(
                                              horizontal: 15, vertical: 5),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.centerRight,
                                              end: Alignment.centerLeft,
                                              colors: [
                                                HexColor('#FF9200'),
                                                HexColor('#FDBA31')
                                              ],
                                            ),
                                            borderRadius: borderRadius(width),
                                          ),
                                          child: Text(
                                            'Join Now',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: white,
                                            ),
                                          ),
                                        ),
                                        gap(h: 15),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
