import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/model/post_modal.dart';
import 'package:vibetag/provider/post_provider.dart';

import '../utils/constant.dart';

class PostMethods {
  Future getPosts({required BuildContext context}) async {
    final result = await API().postData({
      'type': 'get_home_posts',
      'user_id': loginUserId,
    });
    List<dynamic> posts = jsonDecode(result.body)['posts_data'];
    Provider.of<PostProvider>(context, listen: false).setPosts(posts);
  }

  Future loadMorePosts(
      {required BuildContext context, required String lastPostId}) async {
    final data = {
      'type': 'load_more_home_posts',
      'after_post_id': lastPostId,
      'user_id': loginUserId,
    };
    final result = await API().postData(data);
    List<dynamic> newPosts = jsonDecode(result.body)['posts_data'];
    print(newPosts);
    Provider.of<PostProvider>(context, listen: false).loadMorePosts(newPosts);
  }
  
}
