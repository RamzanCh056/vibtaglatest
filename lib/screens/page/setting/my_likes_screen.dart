import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/groups/group_setting/suggested_group_widget.dart';
import 'package:vibetag/screens/page/setting/my_likes_widget.dart';
import 'package:vibetag/screens/page/setting/suggested_page_widget.dart';
import 'package:vibetag/utils/constant.dart';

class MyLikesScreen extends StatefulWidget {
  const MyLikesScreen({super.key});

  @override
  State<MyLikesScreen> createState() => _MyLikesScreenState();
}

class _MyLikesScreenState extends State<MyLikesScreen> {
  List<Widget> suggestedGroups = [];
  bool isLoading = false;

  getSuggestedPages() async {
    isLoading = true;
    setState(() {});
    final result = await API().postData({
      'type': 'get_user_data',
      'sub_type': 'get_user_likes',
      'after_post_id': '0',
      'user_id': '${loginUserId}',
      'user_profile_id': '${loginUserId}',
    });
    final response = jsonDecode(result.body)['posts_data'];
    for (var page in response) {
      suggestedGroups.add(
        MyLikesWidget(
          page: page,
        ),
      );
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getSuggestedPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? loadingSpinner() : Column(children: suggestedGroups);
  }
}
