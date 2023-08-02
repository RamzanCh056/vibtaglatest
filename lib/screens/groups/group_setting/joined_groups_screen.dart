import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/groups/group_setting/Joined_group_widget.dart';
import 'package:vibetag/screens/groups/group_setting/suggested_group_widget.dart';
import 'package:vibetag/utils/constant.dart';

class JoinedGroups extends StatefulWidget {
  const JoinedGroups({super.key});

  @override
  State<JoinedGroups> createState() => _JoinedGroupsState();
}

class _JoinedGroupsState extends State<JoinedGroups> {
  List<Widget> userjoinedGroups = [];
  bool isLoading = false;
  String categoryId = '';

  getjoinedGroups() async {
    isLoading = true;
    setState(() {});

    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_groups',
      'user_profile_id': '${loginUserId}',
      'after_post_id': '0',
      'user_id': '${loginUserId}',
    };

    final result = await API().postData(data);
    final response = jsonDecode(result.body)['posts_data'];
    for (var group in response) {
      userjoinedGroups.add(
        JoinGroupWidget(
          group: group,
        ),
      );
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getjoinedGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingSpinner()
        : Column(
            children: userjoinedGroups,
          );
  }
}
