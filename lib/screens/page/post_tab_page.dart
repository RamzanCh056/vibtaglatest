// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/screens/home/comments.dart';

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
  bool loadingMore = false;
  bool isLoading = false;
  int postsLength = 0;
  late List<dynamic> posts;

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
    posts = jsonDecode(result.body)['posts_data'];
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    color: HexColor('#dee5f6'),
                    height: height * 0.82,
                    child: ListView.builder(
                      itemCount: posts.length + 2,
                      itemBuilder: (constext, i) {
                        if (i > 0 && i < (posts.length - 1)) {
                          if (posts[i - 1]['ad_media'] != '' &&
                              posts[i - 1]['headline'] != null) {
                            print(posts[i - 1]['ad_media']);
                            return PostAds(
                              post: posts[i - 1],
                            );
                          }
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
                                  posts[i - 1]['product_id'] == '0' ||
                              posts[i - 1]['group_id'] != '0') {
                            return Post(
                              post: posts[i - 1],
                            );
                          } else if (posts[i - 1]['ad_media'] != '' &&
                              posts[i - 1]['headline'] != null) {
                            return PostAds(
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
                            if (posts[i - 1]['product_id'] != '0') {
                              return PostProduct(
                                post: posts[i - 1],
                              );
                            }
                            return Container();
                          }
                        }
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
                ],
              ),
            ),
          );
  }
}
