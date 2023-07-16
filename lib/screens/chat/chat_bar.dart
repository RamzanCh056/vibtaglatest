import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';

import '../../utils/constant.dart';

ChatBar({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: HexColor('#F0F0F0'),
          insetPadding: EdgeInsets.only(
            top: height * 0.09,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.only(
            top: height * 0.01,
            right: height * 0.01,
            left: width * 0.95,
          ),
          content: Container(
            width: width,
            height: height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: spacing(
                            horizontal: width * 0.05,
                            vertical: height * 0.01,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    foregroundImage: AssetImage(
                                        'assets/images/streamer.jpg'),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  const Text(
                                    'Chat Room',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/chat/notification.svg',
                                    width: width * 0.07,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/chat/more.svg',
                                    width: width * 0.07,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        TabBar(
                          unselectedLabelColor:
                              Color.fromARGB(255, 110, 107, 107),
                          labelColor: Colors.orange,
                          indicatorColor: Colors.orange,
                          labelStyle: const TextStyle(
                            fontSize: 24,
                          ),
                          tabs: [
                            Tab(
                              icon: Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      width: width * 0.1,
                                      child: const Text(
                                        'Chat',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/chat/message.svg',
                                    width: width * 0.05,
                                  )
                                  // SvgPicture.asset(
                                  //   'assets/svg/list-text.svg',
                                  //   width: width * 0.1,
                                  // ),
                                ],
                              ),
                            ),
                            Tab(
                              icon: Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      width: width * 0.15,
                                      child: const Text(
                                        'Group Chat',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/chat/users.svg',
                                    width: width * 0.05,
                                  )
                                  // SvgPicture.asset(
                                  //   'assets/svg/writing.svg',
                                  //   width: width * 0.1,
                                  // ),
                                ],
                              ),
                            ),
                            Tab(
                              icon: Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      width: width * 0.15,
                                      child: const Text(
                                        'Page Chat',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SvgPicture.asset(
                                  //   'assets/svg/photo.svg',
                                  //   width: width * 0.1,
                                  // ),
                                  SvgPicture.asset(
                                    'assets/svg/chat/landing-page.svg',
                                    width: width * 0.05,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: height * 0.6,
                            alignment: Alignment.centerLeft,
                            padding: spacing(
                              horizontal: width * 0.03,
                              vertical: 0,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    width: width * 0.95,
                                    height: height * 0.05,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 0,
                                        ),
                                        hintText: 'Search friends',
                                        hintStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: HexColor('#F0F0F0'),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Text(
                                    'Online Friends',
                                    style: TextStyle(
                                      color: HexColor('#AFAFAF'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: true,
                                    isSeen: true,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: true,
                                    isSeen: false,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: true,
                                    isSeen: false,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: true,
                                    isSeen: false,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: true,
                                    isSeen: true,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: true,
                                    isSeen: false,
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Text(
                                    'Offline Friends',
                                    style: TextStyle(
                                      color: HexColor('#AFAFAF'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: false,
                                    isSeen: true,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: false,
                                    isSeen: true,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ChatTile(
                                    name: 'Ilizbat Baby',
                                    time: '1 day ago',
                                    profilePic: 'assets/images/streamer.jpg',
                                    seenPic: 'assets/images/streamer.jpg',
                                    isActive: false,
                                    isSeen: true,
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      ChatDetails(context: context);
                                    },
                                    child: Center(
                                      child: Text(
                                        'see more',
                                        style: TextStyle(
                                          color: HexColor('#3B55FF'),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
