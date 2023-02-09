import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/profile/profile.dart';

import '../../utils/constant.dart';
import '../groups/group.dart';

class SearchBarPop extends StatefulWidget {
  const SearchBarPop({super.key});

  @override
  State<SearchBarPop> createState() => _SearchBarPopState();
}

class _SearchBarPopState extends State<SearchBarPop> {
  TextEditingController searchText = TextEditingController();
  Map<String, dynamic> search = {};
  searchData() async {
    if (searchText.text.isNotEmpty) {
      final data = {
        'type': 'search_area',
        'sub_type': 'normal',
        'user_id': loginUserId,
        'keyword': searchText.text,
      };
      final result = await API().postData(data);
      search = jsonDecode(result.body);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return AlertDialog(
      backgroundColor: HexColor('#F0F0F0'),
      insetPadding: EdgeInsets.only(
        top: height * 0.06,
      ),
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      iconPadding: EdgeInsets.only(
        top: height * 0.01,
        right: height * 0.01,
        left: width * 0.95,
      ),
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
                      child: const TabBar(
                        unselectedLabelColor:
                            Color.fromARGB(255, 110, 107, 107),
                        labelColor: Colors.orange,
                        indicatorColor: Colors.orange,
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
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
                    Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 56,
                                width: width * 0.85,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: height * 0.04,
                                      child: TextFormField(
                                        onChanged: (change) {
                                          searchData();
                                        },
                                        controller: searchText,
                                        decoration: InputDecoration(
                                          hintText: 'Type here.........',
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: lightblue,
                                          ),
                                          contentPadding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: grayMed,
                                              ),
                                              borderRadius:
                                                  borderRadius(width)),
                                          prefix: Container(
                                            width: 40,
                                            height: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 15,
                                      child: Container(
                                        child: const Icon(
                                          Icons.search,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.6,
                          width: double.maxFinite,
                          child: TabBarView(
                            children: [
                              search.length == 0
                                  ? gap()
                                  : Container(
                                      width: double.maxFinite,
                                      height: height * 0.6,
                                      child: ListView.builder(
                                          itemCount: search['posts'].length,
                                          itemBuilder: (context, i) {
                                            return Container(
                                              margin: spacing(
                                                horizontal: 7,
                                                vertical: 7,
                                              ),
                                              child: Html(
                                                data: search['posts'][i]
                                                    ['postText'],
                                                style: {
                                                  "body": Style(
                                                    fontSize: FontSize(12.0),
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.black54,
                                                    maxLines: 2,
                                                  ),
                                                },
                                              ),
                                            );
                                          }),
                                    ),
                              search.length == 0
                                  ? gap()
                                  : Container(
                                      width: double.maxFinite,
                                      height: height * 0.6,
                                      child: ListView.builder(
                                          itemCount: search['users'].length,
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
                                                      pushRoute(
                                                        context: context,
                                                        screen: Profile(
                                                          user_id: search[
                                                                      'users']
                                                                  [i]['user_id']
                                                              .toString(),
                                                        ),
                                                      );
                                                    },
                                                    child: CircleAvatar(
                                                      radius: width * 0.07,
                                                      foregroundImage:
                                                          NetworkImage(
                                                        search['users'][i]
                                                            ['avatar'],
                                                      ),
                                                    ),
                                                  ),
                                                  gap(w: 10),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          pushRoute(
                                                            context: context,
                                                            screen: Profile(
                                                              user_id: search[
                                                                          'users'][i]
                                                                      [
                                                                      'user_id']
                                                                  .toString(),
                                                            ),
                                                          );
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              search['users'][i]
                                                                  ['name'],
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            gap(w: 5),
                                                            search['users'][i][
                                                                        'verified'] !=
                                                                    '0'
                                                                ? const Icon(
                                                                    Icons
                                                                        .verified,
                                                                    color: Colors
                                                                        .cyan,
                                                                    size: 14,
                                                                  )
                                                                : gap(),
                                                          ],
                                                        ),
                                                      ),
                                                      gap(h: 7),
                                                      Text(
                                                        readTimestamp(int.parse(
                                                            search['users'][i]
                                                                    ['lastseen']
                                                                .toString())),
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: grayMed,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                              search.length == 0
                                  ? gap()
                                  : Container(
                                      width: double.maxFinite,
                                      height: height * 0.6,
                                      child: ListView.builder(
                                          itemCount: search['pages'].length,
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
                                                      pushRoute(
                                                        context: context,
                                                        screen: PageScreen(
                                                          page_id: search[
                                                                      'pages']
                                                                  [i]['page_id']
                                                              .toString(),
                                                        ),
                                                      );
                                                    },
                                                    child: CircleAvatar(
                                                      radius: width * 0.07,
                                                      foregroundImage:
                                                          NetworkImage(
                                                        search['pages'][i]
                                                            ['avatar'],
                                                      ),
                                                    ),
                                                  ),
                                                  gap(w: 10),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          pushRoute(
                                                            context: context,
                                                            screen: PageScreen(
                                                              page_id: search[
                                                                          'pages'][i]
                                                                      [
                                                                      'page_id']
                                                                  .toString(),
                                                            ),
                                                          );
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              search['pages'][i]
                                                                  ['name'],
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            gap(w: 5),
                                                            search['pages'][i][
                                                                        'verified'] !=
                                                                    '0'
                                                                ? const Icon(
                                                                    Icons
                                                                        .verified,
                                                                    color: Colors
                                                                        .cyan,
                                                                    size: 14,
                                                                  )
                                                                : gap(),
                                                            gap(w: 5),
                                                            Container(
                                                              padding: spacing(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    borderRadius(
                                                                        5),
                                                                color: grayMed,
                                                              ),
                                                              child: Text(
                                                                'Page',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color: white,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      gap(h: 7),
                                                      Text(
                                                        search['pages'][i]
                                                            ['category'],
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: grayMed,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                              search.length == 0
                                  ? gap()
                                  : Container(
                                      width: double.maxFinite,
                                      height: height * 0.6,
                                      child: ListView.builder(
                                          itemCount: search['groups'].length,
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
                                                      pushRoute(
                                                        context: context,
                                                        screen: GroupScreen(
                                                          group_id:
                                                              search['groups']
                                                                      [i]['id']
                                                                  .toString(),
                                                        ),
                                                      );
                                                    },
                                                    child: CircleAvatar(
                                                      radius: width * 0.07,
                                                      foregroundImage:
                                                          NetworkImage(
                                                        search['groups'][i]
                                                                ['avatar']
                                                            .toString()
                                                            .trim(),
                                                      ),
                                                    ),
                                                  ),
                                                  gap(w: 10),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          pushRoute(
                                                            context: context,
                                                            screen: GroupScreen(
                                                              group_id: search[
                                                                          'groups']
                                                                      [i]['id']
                                                                  .toString(),
                                                            ),
                                                          );
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              search['groups']
                                                                  [i]['name'],
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            gap(w: 5),
                                                            Container(
                                                              padding: spacing(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 4),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    borderRadius(
                                                                        5),
                                                                color: grayMed,
                                                              ),
                                                              child: Text(
                                                                'Group',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  color: white,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      gap(h: 7),
                                                      Text(
                                                        search['groups'][i]
                                                            ['category'],
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: grayMed,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                              search.length == 0
                                  ? gap()
                                  : Container(
                                      width: double.maxFinite,
                                      height: height * 0.6,
                                      child: ListView.builder(
                                          itemCount: search['hash'].length,
                                          itemBuilder: (context, i) {
                                            return Container(
                                              margin: spacing(
                                                horizontal: 7,
                                              ),
                                              child: Html(
                                                data:
                                                    '#${search['hash'][i]['tag']}',
                                                style: {
                                                  "body": Style(
                                                    fontSize: FontSize(12.0),
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.black54,
                                                    maxLines: 2,
                                                  ),
                                                },
                                              ),
                                            );
                                          }),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    )
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
