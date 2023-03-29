// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vibetag/screens/profile/like_page_bar.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';
import '../home/create_post/home_search.dart';
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
  List<Widget> likedPages = [];
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
    final pages = jsonDecode(result.body)['posts_data'];

    if (pages.length > 0) {
      for (var i = 0; i < pages.length; i++) {
        likedPages.add(
          LikedPageBar(
            context: context,
            pages: pages[i],
          ),
        );
      }
    }
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
    return Column(
      children: [
        gap(h: 15),
        isLoading
            ? loadingSpinner()
            : Column(
                children: likedPages,
              ),
      ],
    );
  }
}
