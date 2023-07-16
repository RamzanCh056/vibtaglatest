// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/explore/explore.dart';
import 'package:vibetag/screens/header/const.dart';
import 'package:vibetag/screens/header/widget/group_widget.dart';
import 'package:vibetag/screens/header/widget/hash_widget.dart';
import 'package:vibetag/screens/header/widget/page_widget.dart';
import 'package:vibetag/screens/header/widget/post_search_widget.dart';
import 'package:vibetag/screens/header/widget/user_widget.dart';

import '../../../utils/constant.dart';

class NewSearchFilter extends StatefulWidget {
  final Map<String, dynamic> search;

  NewSearchFilter({
    Key? key,
    required this.search,
  }) : super(key: key);

  @override
  State<NewSearchFilter> createState() => _NewSearchFilterState();
}

class _NewSearchFilterState extends State<NewSearchFilter> {
  List<Widget> pages = [];
  List<Widget> users = [];
  List<Widget> groups = [];
  List<Widget> posts = [];
  List<Widget> hashs = [];
  @override
  void initState() {
    super.initState();
  }

  setTabs() {
    pages = [];
    users = [];
    groups = [];
    posts = [];
    hashs = [];
    for (var page in widget.search['pages']) {
      pages.add(PageSearchWidget(page: page));
    }
    for (var user in widget.search['users']) {
      users.add(UserSearchWidget(user: user));
    }
    for (var group in widget.search['groups']) {
      groups.add(GroupSearchWidget(group: group));
    }
    for (var post in widget.search['posts']) {
      posts.add(
        PostSearchWidget(
          post: post,
          postsList: widget.search['posts'],
        ),
      );
    }
    if (widget.search['hashtags'] != null) {
      for (var hash in widget.search['hashtags']) {
        hashs.add(HashSearchWidget(hash: hash));
      }
    } else {
      for (var hash in widget.search['hash']) {
        hashs.add(HashSearchWidget(hash: hash));
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setTabs();
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Container(
      width: width,
      color: white,
      padding: spacing(horizontal: 7),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.65,
              child: DefaultTabController(
                length: 5,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        padding: spacing(horizontal: 0, vertical: 0),
                        isScrollable: true,
                        labelPadding: spacing(horizontal: 8.5, vertical: 5),
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticalNeueLTStd'),
                        tabs: [
                          Tab(text: 'Posts'),
                          Tab(text: 'Users'),
                          Tab(text: 'Pages'),
                          Tab(text: 'Groups'),
                          Tab(text: 'Hashtag'),
                        ],
                      ),
                      isRecentSearch ? gap(h: 7) : gap(),
                      isRecentSearch
                          ? Text(
                              'Recent Search',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: grayMed,
                                fontSize: 12,
                              ),
                            )
                          : gap(),
                      isRecentSearch ? gap(h: 7) : gap(),
                      Container(
                        height: height * 0.7,
                        child: TabBarView(
                          children: [
                            InkWell(
                              onTap: () {
                                showSearchOption = false;
                                setState(() {});
                              },
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: posts,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showSearchOption = false;
                                setState(() {});
                              },
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: users,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showSearchOption = false;
                                setState(() {});
                              },
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: pages,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showSearchOption = false;
                                setState(() {});
                              },
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: groups,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showSearchOption = false;
                                setState(() {});
                              },
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: hashs,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            gap(h: 10),
            GestureDetector(
              onTap: () {
                showSearchOption = false;
                setState(() {});
                pushRoute(
                  context: context,
                  screen: Explore(
                    search: widget.search,
                  ),
                );
              },
              child: Container(
                width: width * 0.3,
                margin: spacing(
                  horizontal: 5,
                  vertical: 5,
                ),
                padding: spacing(
                  horizontal: 15,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: borderRadius(width),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      child: Image.asset(
                        'assets/new/icons/filter_search.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    gap(w: 10),
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            gap(h: height * 0.1)
          ],
        ),
      ),
    );
  }
}
