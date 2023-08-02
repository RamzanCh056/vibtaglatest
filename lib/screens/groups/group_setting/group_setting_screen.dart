import 'package:flutter/material.dart';
import 'package:vibetag/screens/groups/group_setting/general_setting.dart';
import 'package:vibetag/screens/groups/group_setting/joined_groups_screen.dart';
import 'package:vibetag/screens/groups/group_setting/my_groups.dart';
import 'package:vibetag/screens/groups/group_setting/privacy_setting.dart';
import 'package:vibetag/screens/groups/group_setting/suggested_groups_screen.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/screens/page/setting/page%20general%20setting.dart';
import 'package:vibetag/screens/page/setting/my_page.dart';
import 'package:vibetag/screens/page/setting/page_privacy_setting.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../register/reusabletext.dart';

class MyGroupScreen extends StatefulWidget {
  const MyGroupScreen({Key? key}) : super(key: key);

  @override
  State<MyGroupScreen> createState() => _MyGroupScreenState();
}

class _MyGroupScreenState extends State<MyGroupScreen> {
  int _currentIndex = 0;
  List<String> buttons = ['My Groups', 'Suggested Groups', 'Joined', 'Create'];

  List<Widget> screens = [
    MyGroups(),
    SuggestedGroupScreen(),
    JoinedGroups(),
    GroupPrivacySetting(),
  ];

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);

    return Scaffold(
      backgroundColor: Color(0xffF1F4FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              screens[_currentIndex],
            ],
          ),
        ),
      ),
    );
  }
}
