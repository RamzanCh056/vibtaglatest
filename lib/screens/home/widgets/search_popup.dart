// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/profile/profile.dart';

import '../../../utils/constant.dart';
import '../../groups/group.dart';
import '../../hast_tag/tred_screen.dart';

class SearchBarPop extends StatefulWidget {
  final String keyword;
  const SearchBarPop({
    Key? key,
    required this.keyword,
  }) : super(key: key);

  @override
  State<SearchBarPop> createState() => _SearchBarPopState();
}

class _SearchBarPopState extends State<SearchBarPop> {
  Map<String, dynamic> search = {};
  String savedSearchId = '';
  bool historySearch = false;
  bool isLoading = false;
  String clearHistoryType = 'post';
  @override
  void initState() {
    super.initState();
    searchData();
  }

  searchData() async {
    setState(() {
      isLoading = true;
    });
    if (widget.keyword.isNotEmpty) {
      final data = {
        'type': 'search_area',
        'sub_type': 'normal',
        'user_id': loginUserId,
        'keyword': widget.keyword,
      };
      final result = await API().postData(data);
      search = jsonDecode(result.body);
      historySearch = false;
      setState(() {});
    } else {
      final data = {
        'type': 'search_history',
        'sub_type': 'get_search_history',
        'user_id': loginUserId,
      };
      final result = await API().postData(data);
      search = jsonDecode(result.body);
      historySearch = true;

      setState(() {});
    }
    setState(() {
      isLoading = false;
    });
  }

  clearHistory() async {
    print(clearHistoryType);
    final data = {
      'type': 'search_history',
      'sub_type': 'clear_search_history',
      'history_type': clearHistoryType,
      'user_id': loginUserId,
    };
    print(data);
    print(clearHistoryType);
    final result = await API().postData(data);
    if (result.body.isNotEmpty) {
      print(jsonDecode(result.body));
    }
    searchData();
    setState(() {});
  }

  saveSearch() async {
    final data = {
      'type': 'search_history',
      'sub_type': 'save_search_history',
      'history_type': clearHistoryType,
      'id': savedSearchId,
      'user_id': loginUserId,
    };
    print(data);
    await API().postData(data);
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return AlertDialog(
      backgroundColor: HexColor('#F0F0F0'),
      insetPadding: EdgeInsets.only(
        top: 0,
      ),
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      content: Container(
        width: width,
        height: height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultTabController(
                length: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: accent,
                      ),
                      child: TabBar(
                        unselectedLabelColor:
                            Color.fromARGB(255, 110, 107, 107),
                        labelColor: Colors.orange,
                        indicatorColor: Colors.orange,
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        onTap: (i) {
                          if (i == 0) {
                            clearHistoryType = 'post';
                          }
                          if (i == 1) {
                            clearHistoryType = 'user';
                          }
                          if (i == 2) {
                            clearHistoryType = 'page';
                          }
                          if (i == 3) {
                            clearHistoryType = 'group';
                          }
                          if (i == 4) {
                            clearHistoryType = 'hashtag';
                          }
                        },
                        tabs: [
                          Tab(
                            text: 'Posts',
                          ),
                          Tab(
                            text: 'Users',
                          ),
                          Tab(
                            text: 'Pages',
                          ),
                          Tab(
                            text: 'Groups',
                          ),
                          Tab(
                            text: 'Hashtag',
                          ),
                        ],
                      ),
                    ),
                    isLoading
                        ? loadingSpinner()
                        : Column(
                            children: [
                              Container(
                                height: height * 0.7,
                                width: double.maxFinite,
                                child: TabBarView(
                                  children: [
                                    search.length == 0
                                        ? gap()
                                        : Stack(
                                            children: [
                                              Container(
                                                width: double.maxFinite,
                                                height: height * 0.6,
                                                child: ListView.builder(
                                                    itemCount:
                                                        search['posts'].length,
                                                    itemBuilder: (context, i) {
                                                      return Container(
                                                        margin: spacing(
                                                          horizontal: 7,
                                                          vertical: 7,
                                                        ),
                                                        child: Html(
                                                          data: search['posts']
                                                              [i]['postText'],
                                                          style: {
                                                            "body": Style(
                                                              fontSize:
                                                                  FontSize(
                                                                      12.0),
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color: Colors
                                                                  .black54,
                                                              maxLines: 2,
                                                            ),
                                                          },
                                                        ),
                                                      );
                                                    }),
                                              ),
                                              Positioned(
                                                right: 15,
                                                child: historySearch &&
                                                        search['posts'].length >
                                                            0
                                                    ? InkWell(
                                                        onTap: () {
                                                          clearHistory();
                                                        },
                                                        child:
                                                            Text('Clear All'),
                                                      )
                                                    : gap(),
                                              ),
                                            ],
                                          ),
                                    search.length == 0
                                        ? gap()
                                        : Stack(
                                            children: [
                                              Container(
                                                width: double.maxFinite,
                                                height: height * 0.6,
                                                child: ListView.builder(
                                                    itemCount:
                                                        search['users'].length,
                                                    itemBuilder: (context, i) {
                                                      return Container(
                                                        margin: spacing(
                                                          horizontal: 15,
                                                          vertical: 7,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                savedSearchId =
                                                                    '${search['users'][i]['id']}';
                                                                saveSearch();
                                                                pushRoute(
                                                                  context:
                                                                      context,
                                                                  screen:
                                                                      Profile(
                                                                    user_id: search['users'][i]
                                                                            [
                                                                            'user_id']
                                                                        .toString(),
                                                                  ),
                                                                );
                                                              },
                                                              child:
                                                                  CircleAvatar(
                                                                radius: width *
                                                                    0.07,
                                                                foregroundImage:
                                                                    NetworkImage(
                                                                  search['users']
                                                                          [i][
                                                                      'avatar'],
                                                                ),
                                                              ),
                                                            ),
                                                            gap(w: 10),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    savedSearchId =
                                                                        '${search['users'][i]['id']}';
                                                                    saveSearch();
                                                                    pushRoute(
                                                                      context:
                                                                          context,
                                                                      screen:
                                                                          Profile(
                                                                        user_id:
                                                                            search['users'][i]['user_id'].toString(),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        search['users'][i]
                                                                            [
                                                                            'name'],
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                      gap(w: 5),
                                                                      search['users'][i]['verified'] !=
                                                                              '0'
                                                                          ? const Icon(
                                                                              Icons.verified,
                                                                              color: Colors.cyan,
                                                                              size: 14,
                                                                            )
                                                                          : gap(),
                                                                    ],
                                                                  ),
                                                                ),
                                                                gap(h: 7),
                                                                Text(
                                                                  readTimestamp(int.parse(search['users']
                                                                              [
                                                                              i]
                                                                          [
                                                                          'lastseen']
                                                                      .toString())),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        grayMed,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                              Positioned(
                                                right: 15,
                                                child: historySearch &&
                                                        search['users'].length >
                                                            0
                                                    ? InkWell(
                                                        onTap: () {
                                                          clearHistory();
                                                        },
                                                        child:
                                                            Text('Clear All'),
                                                      )
                                                    : gap(),
                                              ),
                                            ],
                                          ),
                                    search.length == 0
                                        ? gap()
                                        : Stack(
                                            children: [
                                              Container(
                                                width: double.maxFinite,
                                                height: height * 0.6,
                                                child: ListView.builder(
                                                    itemCount:
                                                        search['pages'].length,
                                                    itemBuilder: (context, i) {
                                                      return Container(
                                                        margin: spacing(
                                                          horizontal: 15,
                                                          vertical: 7,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                savedSearchId =
                                                                    '${search['pages'][i]['id']}';
                                                                saveSearch();
                                                                pushRoute(
                                                                  context:
                                                                      context,
                                                                  screen:
                                                                      PageScreen(
                                                                    page_id: search['pages'][i]
                                                                            [
                                                                            'page_id']
                                                                        .toString(),
                                                                  ),
                                                                );
                                                              },
                                                              child:
                                                                  CircleAvatar(
                                                                radius: width *
                                                                    0.07,
                                                                foregroundImage:
                                                                    NetworkImage(
                                                                  search['pages']
                                                                          [i][
                                                                      'avatar'],
                                                                ),
                                                              ),
                                                            ),
                                                            gap(w: 10),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    savedSearchId =
                                                                        '${search['pages'][i]['id']}';
                                                                    saveSearch();
                                                                    pushRoute(
                                                                      context:
                                                                          context,
                                                                      screen:
                                                                          PageScreen(
                                                                        page_id:
                                                                            search['pages'][i]['page_id'].toString(),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        search['pages'][i]
                                                                            [
                                                                            'name'],
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                      gap(w: 5),
                                                                      search['pages'][i]['verified'] !=
                                                                              '0'
                                                                          ? const Icon(
                                                                              Icons.verified,
                                                                              color: Colors.cyan,
                                                                              size: 14,
                                                                            )
                                                                          : gap(),
                                                                      gap(w: 5),
                                                                      Container(
                                                                        padding: spacing(
                                                                            horizontal:
                                                                                12,
                                                                            vertical:
                                                                                4),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              borderRadius(5),
                                                                          color:
                                                                              grayMed,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Page',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                gap(h: 7),
                                                                Text(
                                                                  search['pages']
                                                                          [i][
                                                                      'category'],
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        grayMed,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                              Positioned(
                                                right: 15,
                                                child: historySearch &&
                                                        search['pages'].length >
                                                            0
                                                    ? InkWell(
                                                        onTap: () {
                                                          clearHistory();
                                                        },
                                                        child:
                                                            Text('Clear All'),
                                                      )
                                                    : gap(),
                                              ),
                                            ],
                                          ),
                                    search.length == 0
                                        ? gap()
                                        : Stack(
                                            children: [
                                              Container(
                                                width: double.maxFinite,
                                                height: height * 0.6,
                                                child: ListView.builder(
                                                    itemCount:
                                                        search['groups'].length,
                                                    itemBuilder: (context, i) {
                                                      return Container(
                                                        margin: spacing(
                                                          horizontal: 15,
                                                          vertical: 7,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                savedSearchId =
                                                                    '${search['groups'][i]['id']}';
                                                                saveSearch();
                                                                pushRoute(
                                                                  context:
                                                                      context,
                                                                  screen:
                                                                      GroupScreen(
                                                                    group_id: search['groups'][i]
                                                                            [
                                                                            'id']
                                                                        .toString(),
                                                                  ),
                                                                );
                                                              },
                                                              child:
                                                                  CircleAvatar(
                                                                radius: width *
                                                                    0.07,
                                                                foregroundImage:
                                                                    NetworkImage(
                                                                  search['groups']
                                                                              [
                                                                              i]
                                                                          [
                                                                          'avatar']
                                                                      .toString()
                                                                      .trim(),
                                                                ),
                                                              ),
                                                            ),
                                                            gap(w: 10),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    savedSearchId =
                                                                        '${search['groups'][i]['id']}';
                                                                    saveSearch();
                                                                    pushRoute(
                                                                      context:
                                                                          context,
                                                                      screen:
                                                                          GroupScreen(
                                                                        group_id:
                                                                            search['groups'][i]['id'].toString(),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        search['groups'][i]
                                                                            [
                                                                            'name'],
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                      gap(w: 5),
                                                                      Container(
                                                                        padding: spacing(
                                                                            horizontal:
                                                                                12,
                                                                            vertical:
                                                                                4),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              borderRadius(5),
                                                                          color:
                                                                              grayMed,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Group',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                gap(h: 7),
                                                                Text(
                                                                  search['groups']
                                                                          [i][
                                                                      'category'],
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        grayMed,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                              Positioned(
                                                right: 15,
                                                child: historySearch &&
                                                        search['groups']
                                                                .length >
                                                            0
                                                    ? InkWell(
                                                        onTap: () {
                                                          clearHistory();
                                                        },
                                                        child:
                                                            Text('Clear All'),
                                                      )
                                                    : gap(),
                                              ),
                                            ],
                                          ),
                                    search.length == 0
                                        ? gap()
                                        : Stack(
                                            children: [
                                              Container(
                                                width: double.maxFinite,
                                                height: height * 0.6,
                                                child: ListView.builder(
                                                  itemCount: search['hash'] !=
                                                          null
                                                      ? search['hash'].length
                                                      : search['hashtags']
                                                          .length,
                                                  itemBuilder: (context, i) {
                                                    return InkWell(
                                                      onTap: () {
                                                        savedSearchId = search[
                                                                    'hash'] ==
                                                                null
                                                            ? '${search['hashtags'][i]['id']}'
                                                            : '${search['hash'][i]['id']}';
                                                        saveSearch();
                                                        pushRoute(
                                                          context: context,
                                                          screen: HashTrend(
                                                            hashTag: search[
                                                                        'hash'] !=
                                                                    null
                                                                ? '${search['hash'][i]['tag']}'
                                                                : '${search['hashtags'][i]['tag']}',
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        margin: spacing(
                                                          horizontal: 7,
                                                        ),
                                                        child: Html(
                                                          data: search[
                                                                      'hash'] !=
                                                                  null
                                                              ? '#${search['hash'][i]['tag']}'
                                                              : '#${search['hashtags'][i]['tag']}',
                                                          style: {
                                                            "body": Style(
                                                              fontSize:
                                                                  FontSize(
                                                                      12.0),
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color: Colors
                                                                  .black54,
                                                              maxLines: 2,
                                                            ),
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Positioned(
                                                right: 15,
                                                child: historySearch &&
                                                        search['hashtags']
                                                                .length >
                                                            0
                                                    ? InkWell(
                                                        onTap: () {
                                                          clearHistory();
                                                        },
                                                        child:
                                                            Text('Clear All'),
                                                      )
                                                    : gap(),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
