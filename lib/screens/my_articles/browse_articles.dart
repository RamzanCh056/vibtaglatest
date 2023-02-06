import 'package:flutter/material.dart';

import 'most_popular.dart';
import 'most_recent.dart';

class BrowseArticle extends StatelessWidget {
  const BrowseArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                //textField
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search articles',
                      suffixIcon: Icon(Icons.search,color: Colors.orange,),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                const TabBar(
                  isScrollable: true,
                  labelColor: Colors.orange,
                  indicatorColor: Colors.orange,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                  Tab(text: 'liked',),
                  Tab(text: 'Most recent',),
                  Tab(text: 'Most Popular',),
                  Tab(text: 'Most searched',),
                  Tab(text: 'Most',),
                ],),
                Expanded(child: TabBarView(children: [
                  Container(),
                  MostRecentBlogs(),
                  MostPopular(),
                  Container(),
                  Container(),
                ],),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
