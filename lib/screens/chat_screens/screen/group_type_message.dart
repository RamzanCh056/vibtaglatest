import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vab_tag/chat_screens/screen/profile_screen.dart';
import 'package:vab_tag/chat_screens/screen/view_media.dart';

import '../constants.dart';

class GroupTypeMessage extends StatelessWidget {
  const GroupTypeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, screenHeightSize(80, context)),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: highShadeOrangeColor,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.asset(
                            'assets/images/Group 76548.png',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: -1,
                            right: 3,
                            child: Container(
                              width: screenWidthSize(11, context),
                              height: screenHeightSize(11, context),
                              decoration: BoxDecoration(
                                  color: lightGreenColor,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mark Henry',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: screenWidthSize(15, context)),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Last Seen: Just now',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: screenWidthSize(12, context)),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  color: orangeColor.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: SvgPicture.asset(
                                'assets/images/Video-2.svg',
                              )),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: orangeColor.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: SvgPicture.asset(
                                'assets/images/Fill 6-8.svg',
                              )),
                          const SizedBox(
                            width: 7,
                          ),
                          // SvgPicture.asset('assets/images/Group 76594.svg'),
                          PopupMenuButton(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              onSelected: (value) {
                                if (value == "View Profile") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return const ProfileScreen();
                                      },
                                    ),
                                  );
                                } else if (value == "View Media") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return const ViewMedia();
                                      },
                                    ),
                                  );
                                }
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              itemBuilder: (_) {
                                final List items = [
                                  "View Profile",
                                  "View Media",
                                  "Mute Notification",
                                  "Delete Chat",
                                  "Block",
                                  "Report",
                                ];
                                return items
                                    .map((e) => PopupMenuItem(
                                          value: e.toString(),
                                          child: Text(
                                            e.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ))
                                    .toList();
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: screenHeightSize(70, context),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(-4, 0),
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Color.fromRGBO(125, 140, 172, 0.47)),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  decoration: BoxDecoration(
                    color: HexColor('#F8F9FB'),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greyColor,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: screenWidthSize(28, context),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: screenWidthSize(200, context),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message here',
                            hintStyle: TextStyle(
                                color: fontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: orangeColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/Voice-2.svg',
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children:  [
                  Text(
                    "12:37",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: greyColor),
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz,color: greyColor,)
                ],
              ),
              SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFEBEFFB)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hassan Ali",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui, facilisis a mi rutrum integer. Augue commodo convallis dictum bibendum tellus. Ipsum lobortis elit sit amet leo.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
