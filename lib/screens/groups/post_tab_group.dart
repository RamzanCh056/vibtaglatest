// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/home/create_post/home_search.dart';

import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  bool loadPosts = false;
  bool isNoMore = false;
  String lastPostId = '0';
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
      'group_profile_id': '${widget.group_id}',
      'user_id': loginUserId,
      'after_post_id': lastPostId,
    };
    final result = await API().postData(data);
    final newPosts = jsonDecode(result.body)['posts_data'];
    bool isFindId = false;
    if (newPosts.length > 0) {
      for (var i = 0; i < newPosts.length; i++) {
        if (!isFindId) {
          if (newPosts[(newPosts.length - (1 + i))]['post_id'] != null) {
            lastPostId =
                newPosts[(newPosts.length - (1 + i))]['post_id'].toString();
            isFindId = true;
          }
        }
      }
    }
    if (newPosts.length == 0) {
      isNoMore = true;
    }
    List<Widget> loadNewPosts = PostMethods().setPosts(posts: newPosts);
    if (newPosts.length > 0) {
      for (var i = 0; i < loadNewPosts.length; i++) {
        posts.add(loadNewPosts[i]);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> user =
        Provider.of<UserProvider>(context, listen: false).user;
    return isLoading
        ? loadingSpinner()
        : Container(
            alignment: Alignment.topCenter,
            width: width,
            decoration: BoxDecoration(
              color: whiteSecondary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // createPost(user),
                Column(
                  children: posts,
                ),
                gap(h: 15),
                isNoMore
                    ? Center(
                        child: Text('No More Posts'),
                      )
                    : VisibilityDetector(
                        key: Key('group_load_more'),
                        child: loadingSpinner(),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.3) {
                            getGroupPosts();
                          }
                        },
                      )
              ],
            ),
          );
  }
}
