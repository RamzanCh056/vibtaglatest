// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';

import 'package:vibetag/screens/home/comments.dart';

import '../../utils/constant.dart';
import '../home/post_ads.dart';
import '../home/post_blog.dart';
import '../home/post_colored.dart';
import '../home/post_comment_bar.dart';
import '../home/post_event.dart';
import '../home/post_photo.dart';
import '../home/post_poll.dart';
import '../home/post_product.dart';
import '../home/revibe.dart';

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
  late List<dynamic> posts;
  bool loadPosts = false;
  String lastPostId = '';
  bool loadingMore = false;
  int postsLength = 0;

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
    posts = jsonDecode(result.body)['posts_data'];
    print(posts);
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

    for (var i = 0; i < posts.length; i++) {
      if (!isFindId) {
        if (posts[(posts.length - (1 + i))]['post_id'] != null) {
          lastPostId = posts[(posts.length - (1 + i))]['post_id'].toString();
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
        posts.add(newPosts[i]);
      }
      postsLength = posts.length + 2;
      setState(() {
        loadingMore = false;
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
                  Container(
                    width: double.maxFinite,
                    color: HexColor('#dee5f6'),
                    height: height * 0.82,
                    child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (constext, i) {
                        postsLength = postsLength;

                       
                          if (posts[i]['ad_media'] != '' &&
                              posts[i]['headline'] != null) {
                            print(posts[i]['ad_media']);
                            return PostAds(
                              post: posts[i],
                            );
                          }
                          if (posts[i]['poll_id'] != '0') {
                            return Container();
                            return PoolPost(
                              post: posts[i],
                              postId: posts[i]['post_id'],
                              avatar: posts[i]['publisher']['avatar'],
                              name: posts[i]['publisher']['first_name'] != null
                                  ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
                                  : "${posts[i]['publisher']['page_title']}",
                              postTime: posts[i]['post_time'],
                              postText: posts[i]['postText'],
                              poolOptions: posts[i]['options'],
                              likes: posts[i]['reaction']['count'].toString(),
                              comments: posts[i]['post_comments'],
                              shares: posts[i]['post_shares'],
                            );
                          } else if (posts[i]['blog_id'] != '0') {
                            return BlogPost(
                              post: posts[i],
                            );
                          } else if (posts[i]['page_event_id'] != '0') {
                            return PostEvent(
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
                            );
                          } else if (posts[i]['user_id'] != '0' &&
                                  posts[i]['color_id'] == '0' &&
                                  posts[i]['product_id'] == '0' ||
                              posts[i]['group_id'] != '0') {
                            return Post(
                              post: posts[i],
                            );
                          } else if (posts[i]['ad_media'] != '' &&
                              posts[i]['headline'] != null) {
                            return PostAds(
                              post: posts[i],
                            );
                          } else if (posts[i]['color_id'] != '0') {
                            return ColoredPost(
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
                            );
                          } else if (posts[i]['page_id'] != '0' &&
                              posts[i]['product_id'] == '0' &&
                              posts[i]['color_id'] == '0') {
                            return Post(
                              post: posts[i],
                            );
                          } else {
                            if (posts[i]['product_id'] != '0') {
                              return PostProduct(
                                post: posts[i],
                              );
                            }
                            return Container();
                          }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
