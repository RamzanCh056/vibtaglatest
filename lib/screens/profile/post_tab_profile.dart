// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'package:vibetag/methods/api.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constant.dart';
import '../home/comment/widget/post_comment_bar.dart';
import '../home/create_post/home_search.dart';
import '../home/widgets/home_tab_bar.dart';
import '../home/post_types/post_colored.dart';
import '../home/post_methods/post_methods.dart';
import '../home/post_types/post_photo.dart';
import '../home/widgets/revibe.dart';

class PostTabProfile extends StatefulWidget {
  final String user_id;
  final Map<String,dynamic> user;
  const PostTabProfile({
    Key? key,
    required this.user_id,
    required this.user,
  }) : super(key: key);

  @override
  State<PostTabProfile> createState() => _PostTabProfileState();
}

class _PostTabProfileState extends State<PostTabProfile> {
  bool isLoading = false;
  bool loadingMore = false;
  bool isAlreadyLoading = false;
  bool isNoMore = false;
  String lastPostId = '';
  List<Widget> posts = [];
  List<dynamic> rawPosts = [];
  bool isFindId = false;
  List<String> postsId = [];
  @override
  void initState() {
    super.initState();
    getProfilePosts();
  }

  getProfilePosts() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_posts',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id,
    };

    final result = await API().postData(data);
    rawPosts = jsonDecode(result.body)['posts_data'];
    for (var i = 0; i < rawPosts.length; i++) {
      if (rawPosts[i]['post_id'] != null) {
        postsId.add(rawPosts[i]['post_id'].toString());
      }
    }
    posts = PostMethods().setPosts(posts: rawPosts);
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  loadMore() async {
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_posts',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id,
      'after_post_id': postsId[(postsId.length - 1)],
    };
    final result = await API().postData(data);
    final newPosts = jsonDecode(result.body)['posts_data'];

    if (newPosts.length > 0) {
      for (var i = 0; i < newPosts.length; i++) {
        if (newPosts[i]['post_id'] != null) {
          postsId.add(newPosts[i]['post_id'].toString());
        }
      }
      List<Widget> formatedposts = PostMethods().setPosts(posts: newPosts);
      for (var i = 0; i < formatedposts.length; i++) {
        posts.add(formatedposts[i]);
      }
    } else {
      isNoMore = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return isLoading
        ? loadingSpinner()
        : Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                width * 0.02,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap(h: 10),
                Column(
                  children: posts,
                ),
                isNoMore
                    ? Center(child: Text('No More Posts'))
                    : VisibilityDetector(
                        key: Key('Load_more_profile'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.3) {
                            loadMore();
                          }
                        },
                        child: loadingSpinner(),
                      ),
                gap(h: height * 0.1),
              ],
            ),
          );
  }
}
