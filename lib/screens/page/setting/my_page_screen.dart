import 'package:flutter/material.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/screens/page/setting/my_likes_screen.dart';
import 'package:vibetag/screens/page/setting/page%20general%20setting.dart';
import 'package:vibetag/screens/page/setting/my_page.dart';
import 'package:vibetag/screens/page/setting/page_privacy_setting.dart';
import 'package:vibetag/screens/page/setting/suggested_page_screen.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../register/reusabletext.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  int _currentIndex = 0;
  List<String> buttons = ['My Page', 'Suggested Pages', 'My Likes', 'Create'];
  List<Widget> screens = [
    MyPage(),
    SuggestedPageScreen(),
    MyLikesScreen(),
    PagePrivacySetting(),
  ];

  @override
  Widget build(BuildContext context) {
    width=deviceWidth(context: context);
    height=deviceHeight(context: context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF1F4FB),
      body: ListView(
        children: [
          NavBar(),
          Header(),
          Container(
            width: width,
            height: height * 0.06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: buttons.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    if (i != _currentIndex) {
                      _currentIndex = i;
                      setState(() {});
                    }
                  },
                  child: Container(
                    margin: spacing(horizontal: 5, vertical: 5),
                    padding: spacing(
                      horizontal: 20,
                    ),
                    alignment: Alignment.center,
                    decoration: _currentIndex == i
                        ? BoxDecoration(
                            gradient: gradient,
                            borderRadius: borderRadius(width),
                            boxShadow: lightShadow,
                          )
                        : BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(width),
                            boxShadow: lightShadow,
                          ),
                    child: Text(
                      buttons[i],
                      style: TextStyle(
                        color: _currentIndex == i ? white : blackPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          screens[_currentIndex]
        ],
      ),
    ));
  }
}
