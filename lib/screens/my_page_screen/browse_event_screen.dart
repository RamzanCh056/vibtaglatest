import 'package:flutter/material.dart';
import 'package:vibetag/screens/my_page_screen/suggested_page.dart';
import '../../widgets/header.dart';
import '../../widgets/navbar.dart';
import 'create_pages.dart';
import 'my_page.dart';

class MyPageHomeScreen extends StatefulWidget {
  const MyPageHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyPageHomeScreen> createState() => _MyPageHomeScreenState();
}

class _MyPageHomeScreenState extends State<MyPageHomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Column(

            children: [
              Column(
                children: [
                  NavBar(),
                  Header(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: TabBar(
                      indicatorColor: Colors.orange,
                      labelColor: Colors.orange,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      tabs: [
                        Tab(
                          text: "My Page",
                        ),
                        Tab(
                          text: "Suggested Pages",
                        ),
                        Tab(
                          text: "My Like",
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //   return ;
                      // }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateBusinessPage()));
                        //  Get.to(CreateBusinessPage());
                        },
                        child: Row(
                          children: const [
                            Text(
                              "Create",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.add_circle_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(child: TabBarView(children: [
                const MyPage(),
                const SuggestedPage(),
                Container(),
              ],))
            ],
          ),
        ),
      ),
    );
  }
}


