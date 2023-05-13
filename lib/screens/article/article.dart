import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/article/add_new_article.dart';
import 'package:vibetag/screens/article/widgets.dart';
import 'package:vibetag/screens/blog/blogs.dart';
import 'package:vibetag/screens/groups/add_new_group.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/my_sugested.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/page/add_page.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      key: _key,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                     
                    )
                  ],
                ),
                Container(
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.07,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: HexColor('#7B7B7B'),
                                    ),
                                  ),
                                ),
                                child: TabBar(
                                  indicatorPadding: EdgeInsets.zero,
                                  indicatorWeight: 4,
                                  padding: spacing(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                  isScrollable: true,
                                  unselectedLabelColor: HexColor('#7B7B7B'),
                                  labelColor: Colors.orange,
                                  indicatorColor: Colors.orange,
                                  labelStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  onTap: (value) {
                                    if (value == 1) {
                                      pushRoute(
                                        context: context,
                                        screen: const Blogs(),
                                      );
                                    }
                                    if (value == 2) {
                                      pushRoute(
                                        context: context,
                                        screen: const CreateNewArticle(),
                                      );
                                    }
                                  },
                                  tabs: [
                                    const Tab(
                                      icon: Text('My Articles'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    const Tab(
                                      icon: Text('Browse Articles'),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    Tab(
                                      iconMargin: const EdgeInsets.all(0),
                                      icon: Container(
                                        width: width * 0.18,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: borderRadius(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Create',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Container(
                                              width: 15,
                                              child: const SvgIcon(
                                                'assets/svg/chat/plus.svg',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      text: '',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: width,
                                height: height * 0.75,
                                child: TabBarView(
                                  children: [
                                    MyArticles(context: context),
                                    Container(),
                                    Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SecondaryFooter(),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
