import 'package:flutter/material.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/groups/group_setting/group_widget.dart';
import 'package:vibetag/screens/page/setting/page_widget.dart';

import '../../../utils/constant.dart';
import '../../register/reusabletext.dart';

class MyGroups extends StatefulWidget {
  const MyGroups({Key? key}) : super(key: key);

  @override
  State<MyGroups> createState() => _MyGroupsState();
}

class _MyGroupsState extends State<MyGroups> {
  List<Widget> MyGroupss = [];
  bool isLoading = false;

  getMyGroupss() async {
    setState(() {
      isLoading = true;
    });
    final response = await API().newPostData({
      'type': 'groups',
      'action': 'get_my_groups',
      'user_id': '${loginUserId}'
    });
    if (response['data'].toString() != 'null') {
      for (var group in response['data']) {
        MyGroupss.add(
          GroupWidget(
            group: group,
          ),
        );
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getMyGroupss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingSpinner()
        : SingleChildScrollView(
            child: Column(
              children: MyGroupss,
            ),
          );
  }
}
