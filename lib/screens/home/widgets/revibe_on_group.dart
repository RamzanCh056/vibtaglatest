import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:vibetag/screens/hast_tag/tred_screen.dart';
import 'package:vibetag/screens/page/page.dart';

import '../../../methods/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/constant.dart';

class RevibeOnGroup extends StatefulWidget {
  final Map<String, dynamic> post;
  const RevibeOnGroup({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<RevibeOnGroup> createState() => _RevibeOnGroupState();
}

class _RevibeOnGroupState extends State<RevibeOnGroup> {
  List<Widget> groups = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getPages();
  }

  getPages() async {
    setState(() {
      isLoading = true;
    });
    final result = await API().postData({
      'type': 'get_user_data',
      'sub_type': 'get_user_groups',
      'user_id': loginUserId,
      'user_profile_id': loginUserId,
      'after_post_id': '0',
    });
    final response = jsonDecode(result.body);
    for (var group in response['posts_data']) {
      groups.add(RevibeOnGroupWidget(
        group: group,
        post: widget.post,
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.8,
      margin: spacing(horizontal: 5),
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius(7),
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.075,
            child: Center(
              child: Text(
                'Select Group',
                style: TextStyle(
                  fontSize: 18,
                  color: blackPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: grayMed,
          ),
          isLoading
              ? loadingSpinner()
              : Container(
                height: height*0.72,
                child: SingleChildScrollView(
                    child: Column(
                      children: groups,
                    ),
                  ),
              ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class RevibeOnGroupWidget extends StatefulWidget {
  final Map<String, dynamic> group;
  final Map<String, dynamic> post;
  const RevibeOnGroupWidget({
    Key? key,
    required this.group,
    required this.post,
  }) : super(key: key);

  @override
  State<RevibeOnGroupWidget> createState() => _RevibeOnGroupWidgetState();
}

class _RevibeOnGroupWidgetState extends State<RevibeOnGroupWidget> {
  bool shareNowLoading = false;

  shareNow() async {
    setState(() {
      shareNowLoading = true;
    });
    final data = {
      'type': 'revibe',
      'sub_type': 'revibe_post',
      'post_on': 'group',
      'type_id': '${widget.group['id']}',
      'post_id': widget.post['post_id'],
      'user_id': '${loginUserId}',
      'text': revibeText.text,
    };
    print(data);
    final result = await API().postData(data);
    final response = jsonDecode(result.body);
    print(response);
    setState(() {
      shareNowLoading = false;
    });
    if (response['status'].toString() == '200') {
      pop(context);
      ToastMessage(message: 'Revibed Successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.group['id']);
    return shareNowLoading
        ? loadingSpinner()
        : InkWell(
            onTap: () {
              shareNow();
            },
            child: Container(
              width: width,
              margin: spacing(vertical: 5, horizontal: 8),
              padding: spacing(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: grayLight,
                boxShadow: lightShadow,
                borderRadius: borderRadius(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    child: ClipRRect(
                      borderRadius: borderRadius(50),
                      child: netImage(
                        widget.group['avatar'].toString(),
                      ),
                    ),
                  ),
                  gap(w: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.group['group_title'] != null
                          ? Text(
                              setName(widget.group['group_title'].toString()))
                          : gap(),
                      gap(h: 2),
                      widget.group['group_name'] != null
                          ? Text(
                              setName(widget.group['group_name'].toString()),
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 12,
                              ),
                            )
                          : gap(),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
