import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:vibetag/screens/hast_tag/tred_screen.dart';
import 'package:vibetag/screens/page/page.dart';

import '../../../methods/api.dart';
import '../../../utils/constant.dart';
import '../../../utils/constant.dart';

class RevibeOnPage extends StatefulWidget {
  final Map<String, dynamic> post;
  const RevibeOnPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<RevibeOnPage> createState() => _RevibeOnPageState();
}

class _RevibeOnPageState extends State<RevibeOnPage> {
  List<Widget> pages = [];
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
      'type': 'get_pages',
      'sub_type': 'my_pages',
      'user_id': loginUserId,
    });
    final response = jsonDecode(result.body);
    for (var page in response['data']) {
      pages.add(RevibeOnPageWidget(
        page: page,
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
                'Select Page',
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
              : SingleChildScrollView(
                  child: Column(
                    children: pages,
                  ),
                ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class RevibeOnPageWidget extends StatefulWidget {
  final Map<String, dynamic> page;
  final Map<String, dynamic> post;
  const RevibeOnPageWidget({
    Key? key,
    required this.page,
    required this.post,
  }) : super(key: key);

  @override
  State<RevibeOnPageWidget> createState() => _RevibeOnPageWidgetState();
}

class _RevibeOnPageWidgetState extends State<RevibeOnPageWidget> {
  bool shareNowLoading = false;

  shareNow() async {
    setState(() {
      shareNowLoading = true;
    });
    final data = {
      'type': 'revibe',
      'sub_type': 'revibe_post',
      'post_on': 'page',
      'type_id': '${widget.page['page_id']}',
      'post_id': widget.post['post_id'],
      'user_id': '${loginUserId}',
      'text': revibeText.text,
    };
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
                        widget.page['avatar'].toString(),
                      ),
                    ),
                  ),
                  gap(w: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.page['page_title'] != null
                          ? Text(setName(widget.page['page_title'].toString()))
                          : gap(),
                      gap(h: 2),
                      widget.page['page_name'] != null
                          ? Text(
                              setName(widget.page['page_name'].toString()),
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
