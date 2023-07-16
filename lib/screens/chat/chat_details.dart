import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';

import '../../utils/constant.dart';

ChatDetails({required BuildContext context}) {
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
                    length: 5,
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
                        const TabBar(
                          isScrollable: true,
                          unselectedLabelColor:
                              Color.fromARGB(255, 110, 107, 107),
                          labelColor: Colors.orange,
                          indicatorColor: Colors.orange,
                          labelStyle: TextStyle(
                            fontSize: 10,
                          ),
                          tabs: [
                            Tab(
                              text: 'Chat',
                            ),
                            Tab(
                              text: 'Group Chat',
                            ),
                            Tab(
                              text: 'Stories',
                            ),
                            Tab(
                              text: 'Call log',
                            ),
                            Tab(
                              text: 'Page Chat',
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.8,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                top: 10,
                                                left: 10,
                                                bottom: 0,
                                              ),
                                              hintText: 'Search friends',
                                              hintStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                              suffix: const Icon(
                                                Icons.search,
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    width: 2,
                                                    color: HexColor('#F0F0F0'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/svg/chat/plus.svg',
                                          width: width * 0.08,
                                        )
                                      ],
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
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(),
                        Container(),
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
