import 'package:flutter/material.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/page/setting/page_widget.dart';

import '../../../utils/constant.dart';
import '../../register/reusabletext.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Widget> myPages = [];
  bool isLoading = false;

  getMyPages() async {
    setState(() {
      isLoading = true;
    });
    final response = await API().newPostData({
      'type': 'get_pages',
      'sub_type': 'my_pages',
      'user_id': '${loginUserId}'
    });
    for (var page in response['data']) {
      myPages.add(
        PageWidget(
          page: page,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getMyPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingSpinner()
        : SingleChildScrollView(
            child: Column(
              children: myPages,
            ),
          );
  }
}
