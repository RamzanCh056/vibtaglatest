// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
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
      posts.add(PostSearchWidget(post: post));
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
      padding: spacing(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.8,
              child: DefaultTabController(
                length: 5,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: 'Posts'),
                          Tab(text: 'Users'),
                          Tab(text: 'Pages'),
                          Tab(text: 'Groups'),
                          Tab(text: 'Hashtag'),
                        ],
                      ),
                     isRecentSearch? gap(h: 7):gap(),
                    isRecentSearch?  Text(
                        'Recent Search',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: grayMed,
                          fontSize: 12,
                        ),
                      ):gap(),
                   isRecentSearch? gap(h: 7):gap(),
                      Container(
                        height: height * 0.7,
                        child: TabBarView(
                          children: [
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: posts,
                                ),
                              ),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: users,
                                ),
                              ),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: pages,
                                ),
                              ),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: groups,
                                ),
                              ),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: hashs,
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
          ],
        ),
      ),
    );
  }
}
