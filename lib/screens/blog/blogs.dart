import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/blog/recent.dart';
import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/search_bar.dart';

import '../../utils/constant.dart';
import '../my_articles/most_popular.dart';
import '../my_articles/most_recent.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                    
                    )
                  ],
                ),
                Container(
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SearchBar(
                          hintText: 'Search Article',
                          controller: search,
                        ),
                        Container(
                          width: width,
                          height: height * 0.9,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: accent,
                              ),
                            ),
                          ),
                          child: DefaultTabController(
                            length: 4,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.05,
                                    child: TabBar(
                                      indicatorPadding: EdgeInsets.zero,
                                      indicatorWeight: 4,
                                      padding: spacing(
                                        horizontal: 0,
                                        vertical: 0,
                                      ),
                                      isScrollable: true,
                                      unselectedLabelColor: accent,
                                      labelColor: Colors.orange,
                                      indicatorColor: Colors.orange,
                                      labelStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                      tabs: const [

                                        Tab(
                                          text: 'Most recent',
                                        ),
                                        Tab(
                                          text: 'Most Popular',
                                        ),
                                        Tab(
                                          text: 'Most searched',
                                        ),
                                        Tab(
                                          text: 'Most',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width,
                                    height: height * 0.8,
                                    child:  const TabBarView(
                                      children: [


                                        MostRecentBlogs(),
                                        MostPopular(),
                                        MostRecent(),
                                        MostRecent(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: Text(
                    'see more articales',
                    style: TextStyle(
                      fontSize: textMed,
                      color: HexColor('#3B55FF'),
                    ),
                  ),
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
