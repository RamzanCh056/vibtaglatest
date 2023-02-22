// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'package:vibetag/methods/api.dart';

import '../../model/user.dart';
import '../../utils/constant.dart';
import '../home/post_comment_bar.dart';
import '../home/create_post/home_search.dart';
import '../home/home_tab_bar.dart';
import '../home/post_blog.dart';
import '../home/post_colored.dart';
import '../home/post_event.dart';
import '../home/post_photo.dart';
import '../home/post_poll.dart';
import '../home/post_product.dart';
import '../home/revibe.dart';

class PostTabProfile extends StatefulWidget {
  final String user_id;
  final ModelUser user;
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
  String lastPostId = '';
  late List<dynamic> posts;
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

    posts = jsonDecode(result.body)['posts_data'];
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  loadMore() async {
    if (loadingMore) {
      return;
    }
    setState(() {
      loadingMore = true;
    });
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_posts',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id,
      'after_post_id': lastPostId,
    };
    final result = await API().postData(data);
    final newPosts = jsonDecode(result.body)['posts_data'];

    if (newPosts.length > 0 && mounted) {
      for (var i = 0; i < newPosts.length; i++) {
        posts.add(newPosts[i]);
      }
      setState(() {
        loadingMore = false;
      });
      setState(() {
        isAlreadyLoading = false;
      });
    }
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
              color: white,
              borderRadius: BorderRadius.circular(
                width * 0.02,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    color: grayLight,
                    height: height * 0.9,
                    child: ListView.builder(
                      itemCount: posts.length + 2,
                      itemBuilder: (constext, i) {
                        if (i == 0) {
                          return Column(
                            children: [
                              HomeTabBar(),
                              gap(h: 10),
                              widget.user_id == loginUserId
                                  ?  createPost( widget.user)
                              //HomeSearchBar(user: widget.user)
                                  : gap(),
                              gap(h: 10),
                            ],
                          );
                        } else if (i > 0 && i < (posts.length - 1)) {
                          if (posts[i - 1]['poll_id'] != '0') {
                            return Container();

                            return PoolPost(
                              post: posts[i - 1],
                              postId: posts[i - 1]['post_id'],
                              avatar: posts[i - 1]['publisher']['avatar'],
                              name: posts[i - 1]['publisher']['first_name'] !=
                                      null
                                  ? "${posts[i - 1]['publisher']['first_name']} ${posts[i - 1]['publisher']['last_name']}"
                                  : "${posts[i - 1]['publisher']['page_title']}",
                              postTime: posts[i - 1]['post_time'],
                              postText: posts[i - 1]['postText'],
                              poolOptions: posts[i - 1]['options'],
                              likes:
                                  posts[i - 1]['reaction']['count'].toString(),
                              comments: posts[i - 1]['post_comments'],
                              shares: posts[i - 1]['post_shares'],
                            );
                          } else if (posts[i - 1]['blog_id'] != '0') {
                            return BlogPost(
                              post: posts[i - 1],
                            );
                          } else if (posts[i - 1]['page_event_id'] != '0') {
                            return PostEvent(
                              post: posts[i - 1],
                              postId: posts[i - 1]['post_id'],
                              avatar: posts[i - 1]['publisher']['avatar'],
                              name: posts[i - 1]['publisher']['first_name'] !=
                                      null
                                  ? "${posts[i - 1]['publisher']['first_name']} ${posts[i - 1]['publisher']['last_name']}"
                                  : "${posts[i - 1]['publisher']['page_title']}",
                              postTime: posts[i - 1]['post_time'],
                              coverImage: posts[i - 1]['event']['cover'],
                              eventName: posts[i - 1]['event']['name'],
                              startDate: posts[i - 1]['event']['start_date'],
                              endDate: posts[i - 1]['event']['end_date'],
                              likes:
                                  posts[i - 1]['reaction']['count'].toString(),
                              comments: posts[i - 1]['post_comments'],
                              shares: posts[i - 1]['post_shares'],
                            );
                          } else if (posts[i - 1]['user_id'] != '0' &&
                              posts[i - 1]['color_id'] == '0' &&
                              posts[i - 1]['product_id'] == '0') {
                            return Post(
                              post: posts[i - 1],
                            );
                          } else if (posts[i - 1]['color_id'] != '0') {
                            return ColoredPost(
                              post: posts[i - 1],
                              postId: posts[i - 1]['post_id'],
                              avatar: posts[i - 1]['publisher']['avatar'],
                              name: posts[i - 1]['publisher']['first_name'] !=
                                      null
                                  ? "${posts[i - 1]['publisher']['first_name']} ${posts[i - 1]['publisher']['last_name']}"
                                  : "${posts[i - 1]['publisher']['page_title']}",
                              first: posts[i - 1]['publisher']['first_name'] !=
                                      null
                                  ? "${posts[i - 1]['publisher']['first_name']}"
                                  : "${posts[i - 1]['publisher']['page_title']}",
                              postTime: posts[i - 1]['post_time'],
                              color_post_info: posts[i - 1]['color_post_info'],
                              feelings: posts[i - 1]['postFeeling'],
                              location: posts[i - 1]['postMap'],
                              reactions: posts[i - 1]['reaction'],
                              postText: posts[i - 1]['postText'],
                              postFile: posts[i - 1]['postFile'],
                              videoViews: int.parse(posts[i - 1]['videoViews']),
                              comments: posts[i - 1]['post_comments'],
                              likes:
                                  posts[i - 1]['reaction']['count'].toString(),
                              shares: posts[i - 1]['post_shares'],
                              likeString: posts[i - 1]['likes_string'],
                            );
                          } else if (posts[i - 1]['page_id'] != '0' &&
                              posts[i - 1]['product_id'] == '0' &&
                              posts[i - 1]['color_id'] == '0') {
                            return Post(
                              post: posts[i - 1],
                            );
                          } else {
                            return PostProduct(
                              post: posts[i - 1],
                            );
                          }
                        }

                        lastPostId =
                            posts[posts.length - 1]['post_id'].toString();
                        if (i > posts.length) {
                          Future.delayed(
                              const Duration(
                                milliseconds: 1,
                              ), () {
                            loadMore();
                          });
                        }
                        return loadingMore ? loadingSpinner() : Container();
                      },
                    ),
                  ),
                  gap(h: 10),
                ],
              ),
            ),
          );
  }
}
