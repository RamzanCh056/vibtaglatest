import 'package:flutter/material.dart';
import 'package:vibetag/screens/page/my_page_screen/suggested_page.dart';
import 'package:vibetag/screens/page/setting/my_page.dart';
import '../../../utils/constant.dart';
import '../../../widgets/navbar.dart';
import '../../header/header.dart';
import 'create_pages.dart';

class MyPageHomeScreen extends StatefulWidget {
  const MyPageHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyPageHomeScreen> createState() => _MyPageHomeScreenState();
}

class _MyPageHomeScreenState extends State<MyPageHomeScreen> {
  int pageIndex = 0;
  List<Widget> screens = [MyPage(), SuggestedPage(), CreateBusinessPage()];
  List<String> buttonText = [
    'My Pages',
    'Suggested Pages',
    'Create Page',
  ];
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(),
              Header(),
              Column(
                children: [
                  Container(
                    height: height * 0.06,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: buttonText.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              pageIndex = i;
                            });
                          },
                          child: Container(
                            padding: spacing(horizontal: 20, vertical: 10),
                            margin: spacing(horizontal: 7, vertical: 5),
                            decoration: i == pageIndex
                                ? BoxDecoration(
                                    gradient: gradient,
                                    borderRadius: borderRadius(width),
                                  )
                                : BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(width),
                                  ),
                            alignment: Alignment.center,
                            child: Text(
                              buttonText[i],
                              style: TextStyle(
                                color: i == pageIndex ? white : blackPrimary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                height: height * 0.82,
                child: screens[pageIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
