import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/blog/recent.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/search_bar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      drawer: DrawerMenu(),
      key: _key,
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
                    Header(
                  
                    )
                  ],
                ),
                Container(
                  width: width * 0.95,
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Setting',
                          style: TextStyle(
                            fontSize: textMed,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['Credentials Setting'],
                            controller: search,
                            first: 'Credentials Setting',
                            bgColor: backgroundColor,
                            textColor: accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['General'],
                            controller: search,
                            first: 'General',
                            bgColor: backgroundColor,
                            textColor: orange,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['Vibetag Information'],
                            controller: search,
                            first: 'Vibetag Information',
                            bgColor: backgroundColor,
                            textColor: accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['Security of credentials/login'],
                            controller: search,
                            first: 'Security of credentials/login',
                            bgColor: backgroundColor,
                            textColor: accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['Account and profile setting'],
                            controller: search,
                            first: 'Account and profile setting',
                            bgColor: backgroundColor,
                            textColor: orange,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['Notification'],
                            controller: search,
                            first: 'Notification',
                            bgColor: backgroundColor,
                            textColor: accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['Mobile'],
                            controller: search,
                            first: 'Mobile',
                            bgColor: backgroundColor,
                            textColor: accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['Friends request'],
                            controller: search,
                            first: 'Friends request',
                            bgColor: backgroundColor,
                            textColor: accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['Tag'],
                            controller: search,
                            first: 'Tag',
                            bgColor: backgroundColor,
                            textColor: accent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: DropDownList(
                            items: ['More'],
                            controller: search,
                            first: 'More',
                            bgColor: backgroundColor,
                            textColor: accent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
