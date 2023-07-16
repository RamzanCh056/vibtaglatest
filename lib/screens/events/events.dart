import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';

import '../../widgets/input_field.dart';
import '../header/header.dart';
import 'create_event.dart';
import 'newdesign/browse_events.dart';
import 'newdesign/create_event.dart';
import 'newdesign/event_going.dart';
import 'newdesign/intersted_event.dart';
import 'newdesign/myevent.dart';
import 'newdesign/past_event.dart';

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
  TextEditingController name = TextEditingController();
  int currentIndexTab =0;
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
                        SizedBox(width: 5,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    currentIndexTab =0;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: currentIndexTab==0?  HexColor('#FF9200'):Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child:  Center(
                                    child: Text(
                                      'Browse',
                                      maxLines: 1,
                                      style: TextStyle(
                                          color:  currentIndexTab==0? Colors.white:Colors.black,

                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    currentIndexTab =1;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: currentIndexTab==1?  HexColor('#FF9200'):Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child:  Center(
                                    child: Text(
                                      'My event',
                                      style: TextStyle(
                                          color: currentIndexTab==1? Colors.white:Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    currentIndexTab=2;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: currentIndexTab==2?  HexColor('#FF9200'):Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child:  Center(
                                    child: Text(
                                      'past Event',
                                      style: TextStyle(
                                          color: currentIndexTab==2? Colors.white:Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {

                                    currentIndexTab =3;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: currentIndexTab==3?  HexColor('#FF9200'):Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child:  Center(
                                    child: Text(
                                      'event Going',
                                      style: TextStyle(
                                          color:  currentIndexTab==3? Colors.white:Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {

                                    currentIndexTab =4;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: currentIndexTab==4?  HexColor('#FF9200'):Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child:  Center(
                                    child: Text(
                                      'intersted Event',
                                      style: TextStyle(
                                          color:  currentIndexTab==4? Colors.white:Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 7,),

                              GestureDetector(
                                onTap: (){
                                  setState(() {

                                    currentIndexTab =5;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: currentIndexTab==5?  HexColor('#FF9200'):Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child:  Center(
                                    child: Text(
                                      'Create',
                                      style: TextStyle(
                                          color:  currentIndexTab==5? Colors.white:Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                            ],
                          ),
                        ),
                        gap(h: 15),
                        currentIndexTab ==0?
                        BrowseEvents():Container(),
                        currentIndexTab ==2?PastEvents():Container(),
                        currentIndexTab ==1? MyEvents():Container(),
                        currentIndexTab ==5? CreateEvetns():Container(),
                        currentIndexTab==4?InterstedEvents(): Container(),
                        currentIndexTab==3?EventsGoing(): Container(),
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
