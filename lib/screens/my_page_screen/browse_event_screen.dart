import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vab_tag/screens/extra-screens/create_business_page.dart';
import 'package:vab_tag/screens/my_page_screen/suggested_page.dart';
import 'my_page.dart';

class MyPageHomeScreen extends StatelessWidget {
  const MyPageHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
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
                          Get.to(CreateBusinessPage());
                        },
                        child: Row(
                          children: [
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
                MyPage(),
                SuggestedPage(),
                Container(),
              ],))
            ],
          ),
        ),
      ),
    );
  }
}


