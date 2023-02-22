// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/model/user.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/home/create_post/home_search.dart';

import 'package:vibetag/screens/home/post_methods/post_methods.dart';

import '../../utils/constant.dart';

class PostTabGroup extends StatefulWidget {
  final String group_id;
  const PostTabGroup({
    Key? key,
    required this.group_id,
  }) : super(key: key);

  @override
  State<PostTabGroup> createState() => _PostTabGroupState();
}

class _PostTabGroupState extends State<PostTabGroup> {
  bool isLoading = false;
  late List<dynamic> LoadedPosts;
  bool loadPosts = false;
  String lastPostId = '';
  bool loadingMore = false;
  int postsLength = 0;
  List<Widget> posts = [];

  @override
  void initState() {
    super.initState();
    getGroupPosts();
  }

  getGroupPosts() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_group_posts',
      'group_profile_id': '20',
      'user_id': loginUserId,
    };
    final result = await API().postData(data);
    LoadedPosts = jsonDecode(result.body)['posts_data'];
    posts = PostMethods().setPosts(posts: LoadedPosts);

    print(LoadedPosts);
    setState(() {
      isLoading = false;
    });
  }

  loadMore() async {
    if (loadingMore) {
      return;
    }
    setState(() {
      loadingMore = true;
    });
    bool isFindId = false;

    for (var i = 0; i < LoadedPosts.length; i++) {
      if (!isFindId) {
        if (LoadedPosts[(LoadedPosts.length - (1 + i))]['post_id'] != null) {
          lastPostId =
              LoadedPosts[(LoadedPosts.length - (1 + i))]['post_id'].toString();
          isFindId = true;
        }
      }
    }
    final data = {
      'type': 'load_more_home_posts',
      'after_post_id': lastPostId,
      'user_id': loginUserId,
    };
    final result = await API().postData(data);
    final newPosts = jsonDecode(result.body)['posts_data'];
    if (newPosts.length > 0) {
      for (var i = 0; i < newPosts.length; i++) {
        LoadedPosts.add(newPosts[i]);
      }
      postsLength = LoadedPosts.length + 2;
      setState(() {
        loadingMore = false;
      });
    }
    posts = PostMethods().setPosts(posts: LoadedPosts);
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    ModelUser user = Provider.of<UserProvider>(context, listen: false).user;
    return isLoading
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createPost(user),
                  Column(
                    children: posts,
                  ),
                ],
              ),
            ),
          );
  }
}
