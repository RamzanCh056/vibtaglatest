import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/chat/chat_profile.dart';
import 'package:vibetag/screens/drawer/drawer.dart';

import '../../utils/constant.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: _key,
      drawer: const DrawerMenu(),
      backgroundColor: HexColor('#F0F0F0'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  NavBar(),
                  Header(
                   
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.87,
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width,
                            color: Colors.white,
                            padding: spacing(
                              horizontal: width * 0.02,
                              vertical: height * 0.005,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.1,
                                  height: height * 0.1,
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    size: 32,
                                    color: Colors.orange,
                                  ),
                                ),
                                Container(
                                  width: width * 0.85,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      foregroundImage: AssetImage(
                                          'assets/images/streamer.jpg'),
                                    ),
                                    title: Text('Ilizbat Baby'),
                                    subtitle: Text('1 day ago'),
                                    trailing: Container(
                                      width: width * 0.2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              ChatProfile(context: context);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/chat/notification.svg',
                                              width: width * 0.07,
                                              color: Colors.orange,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            'assets/svg/chat/more.svg',
                                            width: width * 0.07,
                                            color: Colors.orange,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width,
                            height: height * 0.67,
                            child: SingleChildScrollView(
                              reverse: true,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: spacing(
                                      horizontal: width * 0.02,
                                      vertical: height * 0.005,
                                    ),
                                    padding: EdgeInsets.only(
                                      right: width * 0.2,
                                    ),
                                    width: width,
                                    child: Container(
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          )),
                                      child: Text(
                                          'Hi, How are you...............?'),
                                    ),
                                  ),
                                  Container(
                                    width: width,
                                    margin: spacing(
                                      horizontal: width * 0.02,
                                      vertical: height * 0.005,
                                    ),
                                    padding: EdgeInsets.only(
                                      left: width * 0.2,
                                      right: 10,
                                    ),
                                    child: Container(
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      alignment: Alignment.bottomLeft,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: const Text(
                                        'Hi, I am really good!!!..............:)\n what about you Ilizbat Bab?',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: width,
                            height: height * 0.1,
                            padding: spacing(
                              horizontal: width * 0.02,
                              vertical: height * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: HexColor('#F0F0F0'),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 0.5,
                                  offset: Offset.zero,
                                  blurRadius: 7,
                                  color: Color.fromARGB(55, 0, 0, 0),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  color: Colors.orange,
                                  size: 32,
                                ),
                                Container(
                                  width: width * 0.63,
                                  height: height * 0.06,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      width * 0005,
                                    ),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Write your message here...',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: HexColor('#F0F0F0'),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                        left: 10,
                                        bottom: 3,
                                      ),
                                      suffix: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                          top: 20,
                                        ),
                                        child: SvgIcon(
                                          'assets/svg/chat/smile.svg',
                                          width: width * 0.01,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width * 0.1,
                                  height: width * 0.1,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: width * 0.1,
                                  height: width * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.mic,
                                    size: 32,
                                    color: Colors.black45,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
