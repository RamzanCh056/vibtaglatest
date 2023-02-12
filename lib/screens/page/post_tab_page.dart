// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/model/user.dart';
import 'package:vibetag/provider/userProvider.dart';

import 'package:vibetag/screens/home/comments.dart';
import 'package:vibetag/screens/home/home_search.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';
import '../home/home_story.dart';
import '../home/home_tab_bar.dart';
import '../home/post_ads.dart';
import '../home/post_blog.dart';
import '../home/post_colored.dart';
import '../home/post_comment_bar.dart';
import '../home/post_event.dart';
import '../home/post_photo.dart';
import '../home/post_poll.dart';
import '../home/post_product.dart';
import '../home/revibe.dart';

class PostTabPage extends StatefulWidget {
  final String page_id;
  const PostTabPage({
    Key? key,
    required this.page_id,
  }) : super(key: key);

  @override
  State<PostTabPage> createState() => _PostTabPageState();
}

class _PostTabPageState extends State<PostTabPage> {
  bool loadPosts = false;
  String lastPostId = '';
  bool isNoMorePosts = false;
  List<Widget> posts = [];
  late List<dynamic> loadedPosts;

  loadMore() async {
    bool isFindId = false;
    for (var i = 0; i < loadedPosts.length; i++) {
      if (!isFindId) {
        if (loadedPosts[(loadedPosts.length - (1 + i))]['post_id'] != null) {
          lastPostId =
              loadedPosts[(loadedPosts.length - (1 + i))]['post_id'].toString();
          isFindId = true;
        }
      }
    }
    final data = {
      'type': 'get_page_data',
      'sub_type': 'get_page_posts',
      'page_id': widget.page_id.toString(),
      'user_id': loginUserId.toString(),
      'after_post_id': lastPostId,
    };
    final result = await API().postData(data);
    List<dynamic> newPosts = jsonDecode(result.body)['posts_data'];
    if (newPosts.length > 0) {
      for (var i = 0; i < newPosts.length; i++) {
        loadedPosts.add(newPosts[i]);
      }
      posts = PostMethods().setPosts(posts: loadedPosts);

      setState(() {});
    } else {
      setState(() {
        isNoMorePosts = true;
      });
    }
  }

  getPagePosts() async {
    setState(() {
      loadPosts = true;
    });
    final data = {
      'type': 'get_page_data',
      'sub_type': 'get_page_posts',
      'page_id': widget.page_id.toString(),
      'user_id': loginUserId.toString(),
      'after_post_id': '0',
    };
    final result = await API().postData(data);
    loadedPosts = jsonDecode(result.body)['posts_data'];
    posts = PostMethods().setPosts(posts: loadedPosts);
    setState(() {
      loadPosts = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPagePosts();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    ModelUser user = Provider.of<UserProvider>(context, listen: false).user;
    return loadPosts
        ? loadingSpinner()
        : Container(
            alignment: Alignment.topCenter,
            width: width,
            height: height * 0.9,
            decoration: BoxDecoration(
              color: whiteSecondary,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  createPost(user),
                  Column(
                    children: posts,
                  ),
                  isNoMorePosts
                      ? Text('No More Posts')
                      : VisibilityDetector(
                          key: Key('loadMore'),
                          child: loadingSpinner(),
                          onVisibilityChanged: (info) {
                            if (info.visibleFraction > 0.3) {
                              loadMore();
                            }
                          },
                        )
                ],
              ),
            ),
          );
  }
}
