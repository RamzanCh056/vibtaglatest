// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';

import 'package:vibetag/screens/buzz/widget/bar_items.dart';
import 'package:vibetag/screens/home/edit_post/edit_post.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/home/widgets/reports_options.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

import '../../../../provider/post_provider.dart';
import '../../../../utils/constant.dart';

class PostBottomBar extends StatefulWidget {
  bool is_publisher;
  Map<String, dynamic> post;
  PostBottomBar({
    Key? key,
    required this.is_publisher,
    required this.post,
  }) : super(key: key);

  @override
  State<PostBottomBar> createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  deletePost() async {
    final response = await API().postData({
      'type': 'posts_operations',
      'sub_type': 'delete_post',
      'user_id': '${loginUserId}',
      'post_id': widget.post['id'],
      'post_type': widget.post['parent_id'].toString() == '0' ? '' : 'shared',
    });
    ToastMessage(message: jsonDecode(response.body)['message']);
    if (jsonDecode(response.body)['status'].toString() == '200') {
      deletedPostIds.add('${widget.post['id']}');
      Provider.of<PostProvider>(context, listen: false)
          .filterPosts(rawPostData);
    }
    pop(context);
  }

  hidePost() async {
    hidePostIds.add('${widget.post['id']}');
    final response = await API().postData({
      'type': 'posts_operations',
      'sub_type': 'hide_post',
      'user_id': '${loginUserId}',
      'post_id': widget.post['id'].toString(),
    });
    ToastMessage(message: jsonDecode(response.body)['message']);
    if (jsonDecode(response.body)['status'].toString() == '200') {
      hidePostIds.add('${widget.post['id']}');
      Provider.of<PostProvider>(context, listen: false)
          .filterPosts(rawPostData);
    }
    pop(context);
  }

  savePost(String postId) async {
    pop(context);
    await PostMethods().savePost(postId);
  }

  pinPost() async {
    hidePostIds.add('${widget.post['id']}');
    final response = await API().postData({
      'type': 'posts_operations',
      'sub_type': 'pin_post',
      'post_type': 'profile',
      'item_id': '${loginUserId}',
      'user_id': '${loginUserId}',
      'post_id': widget.post['id'].toString(),
    });
    ToastMessage(message: jsonDecode(response.body)['text']);
    pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.is_publisher ? height * 0.75 : height * 0.5,
      decoration: BoxDecoration(
        color: white,
        borderRadius: radiusOnly(topLeft: 15, topRight: 15),
        boxShadow: boxShadow,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            gap(h: 25),
            widget.is_publisher
                ? InkWell(
                    onTap: () {
                      pop(context);
                      createBottomModalSheet(
                        context: context,
                        screen: EditPost(
                          post: widget.post,
                        ),
                      );
                    },
                    child: BarItems(
                      icon: 'assets/new/images/copy.png',
                      text: 'Edit Post',
                    ),
                  )
                : gap(),
            widget.is_publisher
                ? InkWell(
                    onTap: () {
                      deletePost();
                    },
                    child: BarItems(
                      icon: 'assets/new/images/copy.png',
                      text: 'Delete',
                    ),
                  )
                : gap(),
            InkWell(
              onTap: () async {
                await FlutterClipboard.copy(widget.post['url']);
                pop(context);
                ToastMessage(message: 'Post link copied successfully');
              },
              child: BarItems(
                icon: 'assets/new/images/copy.png',
                text: 'Copy Link',
              ),
            ),
            widget.is_publisher
                ? BarItems(
                    icon: 'assets/new/images/copy.png',
                    text: 'Disable Comments',
                  )
                : gap(),
            widget.is_publisher
                ? gap()
                : InkWell(
                    onTap: () {
                      savePost(widget.post['id'].toString());
                    },
                    child: BarItems(
                      icon: 'assets/new/icons/buzzin/saved.png',
                      text: 'Saved Post',
                    ),
                  ),
            widget.is_publisher
                ? BarItems(
                    icon: 'assets/new/icons/buzzin/new_tab.png',
                    text: 'Edit Audience',
                  )
                : gap(),
            widget.is_publisher
                ? InkWell(
                    onTap: () {
                      pinPost();
                    },
                    child: BarItems(
                      icon: 'assets/new/icons/buzzin/new_tab.png',
                      text: 'Pin Post',
                    ),
                  )
                : gap(),
            widget.is_publisher
                ? InkWell(
                    onTap: () {},
                    child: BarItems(
                      icon: 'assets/new/icons/buzzin/new_tab.png',
                      text: 'Boast Post',
                    ),
                  )
                : gap(),
            widget.is_publisher
                ? gap()
                : InkWell(
                    onTap: () {
                      pop(context);
                      createBottomModalSheet(
                        context: context,
                        screen: ReportOptions(
                          post: widget.post,
                        ),
                      );
                    },
                    child: BarItems(
                      icon: 'assets/new/icons/buzzin/report.png',
                      text: 'Report Post',
                    ),
                  ),
            widget.is_publisher
                ? gap()
                : InkWell(
                    onTap: () {
                      hidePost();
                    },
                    child: BarItems(
                      icon: 'assets/new/icons/buzzin/Hide.png',
                      text: 'Hide Post',
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
