import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/post_models/post_modal.dart';
import 'package:vibetag/provider/post_provider.dart';

import '../post_ads.dart';
import '../post_blog.dart';
import '../post_colored.dart';
import '../post_event.dart';
import '../post_photo.dart';
import '../post_poll.dart';
import '../post_product.dart';
import '../../../utils/constant.dart';

class PostMethods {
  Future getPosts({required BuildContext context}) async {
    final result = await API().postData({
      'type': 'get_home_posts',
      'user_id': loginUserId,
    });
    List<dynamic> posts = jsonDecode(result.body)['posts_data'];

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
    print(playlistColors);
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

  Future loadMorePosts({required BuildContext context}) async {
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
      print(newPosts);
      for (var i = 0; i < newPosts.length; i++) {
        if (newPosts[i]['post_id'] != null) {
          homePostIds.add(newPosts[i]['post_id'].toString());
        } else {
          homePostAdsIds.add(newPosts[i]['id'].toString());
        }
      }
    }
    Provider.of<PostProvider>(context, listen: false).loadMorePosts(newPosts);
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
          }
          if (posts[i]['poll_id'] != '0') {
            // _posts.add(PoolPost(
            //   post: posts[i],
            //   postId: posts[i]['post_id'],
            //   avatar: posts[i]['publisher']['avatar'],
            //   name: posts[i]['publisher']['first_name'] != null
            //       ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
            //       : "${posts[i]['publisher']['page_title']}",
            //   postTime: posts[i]['post_time'],
            //   postText: posts[i]['postText'],
            //   poolOptions: posts[i]['options'],
            //   likes: posts[i]['reaction']['count'].toString(),
            //   comments: posts[i]['post_comments'],
            //   shares: posts[i]['post_shares'],
            // ));
          } else if (posts[i]['blog_id'] != '0') {
            _posts.add(BlogPost(
              post: posts[i],
            ));
          } else if (posts[i]['page_event_id'] != '0') {
            _posts.add(
              PostEvent(
                post: posts[i],
                postId: posts[i]['post_id'],
                avatar: posts[i]['publisher']['avatar'],
                name: posts[i]['publisher']['first_name'] != null
                    ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
                    : "${posts[i]['publisher']['page_title']}",
                postTime: posts[i]['post_time'],
                coverImage: posts[i]['event']['cover'],
                eventName: posts[i]['event']['name'],
                startDate: posts[i]['event']['start_date'],
                endDate: posts[i]['event']['end_date'],
                likes: posts[i]['reaction']['count'].toString(),
                comments: posts[i]['post_comments'],
                shares: posts[i]['post_shares'],
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
            // return PostAds(
            //   post: posts[i],
            // );
          } else if (posts[i]['color_id'] != '0') {
            _posts.add(
              ColoredPost(
                post: posts[i],
                postId: posts[i]['post_id'],
                avatar: posts[i]['publisher']['avatar'],
                name: posts[i]['publisher']['first_name'] != null
                    ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
                    : "${posts[i]['publisher']['page_title']}",
                first: posts[i]['publisher']['first_name'] != null
                    ? "${posts[i]['publisher']['first_name']}"
                    : "${posts[i]['publisher']['page_title']}",
                postTime: posts[i]['post_time'],
                color_post_info: posts[i]['color_post_info'],
                feelings: posts[i]['postFeeling'],
                location: posts[i]['postMap'],
                reactions: posts[i]['reaction'],
                postText: posts[i]['postText'],
                postFile: posts[i]['postFile'],
                videoViews: int.parse(posts[i]['videoViews']),
                comments: posts[i]['post_comments'].toString(),
                likes: posts[i]['reaction']['count'].toString(),
                shares: posts[i]['post_shares'].toString(),
                likeString: posts[i]['likes_string'],
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
