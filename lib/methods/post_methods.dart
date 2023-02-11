import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/model/post_modal.dart';
import 'package:vibetag/provider/post_provider.dart';

import '../screens/home/post_ads.dart';
import '../screens/home/post_blog.dart';
import '../screens/home/post_colored.dart';
import '../screens/home/post_event.dart';
import '../screens/home/post_photo.dart';
import '../screens/home/post_poll.dart';
import '../screens/home/post_product.dart';
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
                comments: posts[i]['post_comments'],
                likes: posts[i]['reaction']['count'].toString(),
                shares: posts[i]['post_shares'],
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
                onTap: (){},
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
