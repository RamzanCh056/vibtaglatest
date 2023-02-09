// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vibetag/model/user.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';
import '../home/home_search.dart';
import '../home/home_tab_bar.dart';

class LikeTab extends StatefulWidget {
  final String user_id;
  const LikeTab({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<LikeTab> createState() => _LikeTabState();
}

class _LikeTabState extends State<LikeTab> {
  late List<dynamic> pages;
  bool isLoading = false;
  @override
  void initState() {
    getLikedPages();
    super.initState();
  }

  void getLikedPages() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_likes',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id,
      'after_post_id': '0',
    };
    final result = await API().postData(data);
    pages = jsonDecode(result.body)['posts_data'];
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return isLoading
        ? loadingSpinner()
        : Center(
            child: pages.length == 0
                ? Text('No liked pages')
                : Container(
                    height: height * 0.7,
                    width: width * 0.95,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: pages.length,
                        itemBuilder: (context, i) {
                          return Container(
                            height: width * 0.25,
                            width: width * 0.95,
                            margin: spacing(
                              vertical: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  child: Container(
                                    height: width * 0.25,
                                    width: width * 0.25,
                                    child: Image.network(
                                      pages[i]['avatar'].trim().toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: spacing(horizontal: 10),
                                  height: width * 0.25,
                                  width: width * 0.7,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      gap(h: 10),
                                      Container(
                                        width: width * 0.6,
                                        child: Text(
                                          pages[i]['page_title'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      gap(h: 5),
                                      Row(
                                        children: [
                                          Text(
                                            'Public Group',
                                            style: TextStyle(
                                              color: grayMed,
                                              fontSize: 10,
                                            ),
                                          ),
                                          gap(w: 5),
                                          Container(
                                            width: 4,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius(4),
                                              color: grayMed,
                                            ),
                                          ),
                                          gap(w: 5),
                                          Text(
                                            '${getInK(number: int.parse(pages[i]['page_likes']))} Likes',
                                            style: TextStyle(
                                              color: grayMed,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      gap(h: 5),
                                      Container(
                                        width: width * 0.5,
                                        padding: spacing(
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orangePrimary,
                                          borderRadius: borderRadius(5),
                                        ),
                                        child: Text(
                                          'Liked',
                                          style: TextStyle(
                                            color: whitePrimary,
                                            fontSize: 10,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      gap(h: 5),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
          );
  }
}
