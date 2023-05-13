import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/provider/post_provider.dart';

import '../post_types/post_ads.dart';
import '../post_types/post_blog.dart';
import '../post_types/post_colored.dart';
import '../post_types/post_event.dart';
import '../post_types/post_photo.dart';
import '../../../utils/constant.dart';
import '../post_types/post_poll.dart';
import '../post_types/post_product.dart';

class PostMethods {
  Future getPosts({required BuildContext context}) async {
    final result = await API().postData({
      'type': 'get_home_posts',
      'user_id': loginUserId,
    });
    List<dynamic> posts = jsonDecode(result.body)['posts_data'];
    SharedPreferences pref = await SharedPreferences.getInstance();
    String homePosts = jsonEncode(posts);
    await pref.setString('posts', homePosts);
    for (var i = 0; i < posts.length; i++) {
      if (posts[i]['post_id'] != null) {
        homePostIds.add(posts[i]['post_id'].toString());
      } else {
        homePostAdsIds.add(posts[i]['id'].toString());
      }
    }
    if (homePostIds.length == 0) {
      isNoMorePostsHome = true;
    }
    Provider.of<PostProvider>(context, listen: false).setPosts(posts);
    getCategories();
  }

  Future setSharedPreferencePosts({
    required List<dynamic> posts,
    required BuildContext context,
  }) async {
    for (var i = 0; i < posts.length; i++) {
      if (posts[i]['post_id'] != null) {
        homePostIds.add(posts[i]['post_id'].toString());
      } else {
        homePostAdsIds.add(posts[i]['id'].toString());
      }
    }
    if (homePostIds.length == 0) {
      isNoMorePostsHome = true;
    }
    Provider.of<PostProvider>(context, listen: false).setPosts(posts);
    getCategories();
  }

  getCategories() async {
    getBuzzin();
    playlistCategories = ['Select'];
    final data = {
      'type': 'playlist_api',
      'action': 'get_playlist_categories',
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body)['data'];
    for (var i = 0; i < response.length; i++) {
      playlistCategories.add(response[i]['name']);
    }

    playlistColors = [];
    final colors = {
      'type': 'playlist_api',
      'action': 'get_playlist_bg_colors',
    };
    final resultColors = await API().postData(colors);
    final responseColors = jsonDecode(resultColors.body)['data'];
    for (var colors in responseColors) {
      playlistColors.add(colors);
    }
  }

  getBuzzin() async {
    final data = {
      'type': 'buzzin',
      'sub_type': 'get_buzzin',
      'user_id': loginUserId,
    };
    final result = await API().postData(data);
    loadedBuzzin = jsonDecode(result.body)['data'];
  }

  Future<void> reactOnPost({
    required String post_id,
    required String reactionValue,
  }) async {
    final data = {
      'type': 'react_story',
      'post_id': post_id,
      'user_id': loginUserId.toString(),
      'reaction': reactionValue,
    };
    await API().postData(data);
  }

  Future<void> removeReact({
    required String post_id,
  }) async {
    final data = {
      'type': 'remove_story_react',
      'post_id': post_id,
      'user_id': loginUserId.toString(),
    };
    final result = await API().postData(data);
  }

  followOrLike({required Map<String, dynamic> post}) async {
    var data = {};
    if (post['type'] == 'page') {
      data = {
        'type': 'follow_like_join',
        'action': 'like_page',
        'user_id': loginUserId.toString(),
        'page_id': post['id'].toString(),
      };
    } else if (post['type'] == 'user') {
      data = {
        'type': 'follow_like_join',
        'action': 'follow_user',
        'user_id': post['id'].toString(),
        'loggedin_user_id': loginUserId,
      };
    } else {
      data = {
        'type': 'follow_like_join',
        'action': 'join_group',
        'group_id': post['id'].toString(),
        'loggedin_user_id': loginUserId,
      };
    }
    await API().postData(data);
  }

  Future loadMorePosts({required BuildContext context}) async {
    if (homePostIds.length > 0) {
      final data = {
        'type': 'load_more_home_posts',
        'after_post_id': homePostIds[(homePostIds.length - 1)],
        'not_ids': homePostIds
            .toString()
            .substring(1, (homePostIds.toString().length - 1)),
        'ad_id': homePostAdsIds
            .toString()
            .substring(1, (homePostAdsIds.toString().length - 1)),
        'user_id': loginUserId,
      };
      final result = await API().postData(data);

      List<dynamic> newPosts = jsonDecode(result.body)['posts_data'];
      if (newPosts.length == 0) {
        isNoMorePostsHome = true;
      } else {
        for (var i = 0; i < newPosts.length; i++) {
          if (newPosts[i]['post_id'] != null) {
            homePostIds.add(newPosts[i]['post_id'].toString());
          } else {
            homePostAdsIds.add(newPosts[i]['id'].toString());
          }
        }
      }
      Provider.of<PostProvider>(context, listen: false).loadMorePosts(newPosts);
    } else {
      getPosts(context: context);
    }
  }

  List<Widget> setPosts({required List<dynamic> posts}) {
    List<Widget> _posts = [];
    if (posts.length > 0) {
      for (var i = 0; i < posts.length; i++) {
        if (i < posts.length) {
          if (posts[i]['ad_media'] != '' && posts[i]['headline'] != null) {
            _posts.add(PostAds(
              post: posts[i],
            ));
          } else if (posts[i]['poll_id'].toString() != '0') {
            _posts.add(PoolPost(
              post: posts[i],
            ));
          } else if (posts[i]['blog_id'] != '0') {
            _posts.add(BlogPost(
              post: posts[i],
            ));
          } else if (posts[i]['page_event_id'] != '0') {
            _posts.add(
              PostEvent(
                post: posts[i],
              ),
            );
          } else if (posts[i]['user_id'] != '0' &&
                  posts[i]['color_id'] == '0' &&
                  posts[i]['product_id'] == '0' ||
              posts[i]['group_id'] != '0') {
            _posts.add(
              Post(
                post: posts[i],
              ),
            );
          } else if (posts[i]['ad_media'] != '' &&
              posts[i]['headline'] != null) {
            _posts.add(
              PostAds(
                post: posts[i],
              ),
            );
          } else if (posts[i]['color_id'] != '0') {
            _posts.add(
              ColoredPost(
                post: posts[i],
              ),
            );
          } else if (posts[i]['page_id'] != '0' &&
              posts[i]['product_id'] == '0' &&
              posts[i]['color_id'] == '0') {
            _posts.add(
              Post(
                post: posts[i],
              ),
            );
          } else {
            if (posts[i]['product_id'] != '0') {
              _posts.add(
                InkWell(
                  onTap: () {},
                  child: PostProduct(
                    post: posts[i],
                  ),
                ),
              );
            }
          }
        }
      }
    }

    return _posts;
  }
}
