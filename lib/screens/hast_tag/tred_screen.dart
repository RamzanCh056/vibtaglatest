// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constant.dart';

class HashTrend extends StatefulWidget {
  final String hashTag;
  const HashTrend({
    Key? key,
    required this.hashTag,
  }) : super(key: key);

  @override
  State<HashTrend> createState() => _HashTrendState();
}

class _HashTrendState extends State<HashTrend> {
  List<Widget> tredProfilesPic = [];
  List<Widget> tredPosts = [];
  List<dynamic> posts = [];
  int totalPosts = 0;
  bool isloadingMore = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getTredsPost();
  }

  getTredsPost() async {
    if (isLoading) {
      setState(() {
        isLoading = true;
      });
    }
    final data = {
      'type': 'get_hashtag_posts',
      'user_id': loginUserId,
      'hash': '${widget.hashTag}',
      'after_post_id':
          posts.length == 0 ? '0' : posts[posts.length - 1]['id'].toString(),
    };
    final result = await API().postData(data);
    posts = jsonDecode(result.body)['posts_data'];
    totalPosts = jsonDecode(result.body)['total_posts'];
    tredProfiles();

    if (tredPosts.length == 0) {
      tredPosts = PostMethods().setPosts(posts: posts);
    } else {
      List<Widget> postsLoads = PostMethods().setPosts(posts: posts);
      if (postsLoads.length > 0) {
        for (var i = 0; i < posts.length; i++) {
          tredPosts.add(postsLoads[i]);
        }
      }
      isloadingMore = false;
    }
    setState(() {
      isLoading = false;
    });
  }

  tredProfiles() {
    for (var i = 0; i < posts.length; i++) {
      if (tredPosts.length < 5) {
        int rad = Random().nextInt(posts.length);
        tredProfilesPic.add(
          Positioned(
            left: i * 15,
            child: Container(
              width: 30,
              child: ClipRRect(
                borderRadius: borderRadius(30),
                child: Image.network(
                  posts[rad]['publisher']['avatar'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      } else {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: isLoading
          ? loadingSpinner()
          : SafeArea(
              child: Container(
                height: height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          NavBar(),
                          Header(),
                        ],
                      ),
                      Container(
                        height: height * 0.88,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              gap(h: 15),
                              Container(
                                margin: spacing(
                                  vertical: 5,
                                ),
                                padding: spacing(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: width * 0.1,
                                          child: Image.asset(
                                            'assets/images/Hashtag.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        gap(w: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '#${widget.hashTag}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${totalPosts} posts',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: grayMed,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: width * 0.3,
                                          height: width * 0.1,
                                          child: Stack(
                                            children: tredProfilesPic,
                                          ),
                                        ),
                                        totalPosts > 5
                                            ? Container(
                                                width: width * 0.1,
                                                height: width * 0.1,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      borderRadius(width),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: orange,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '+${totalPosts - 5}',
                                                    style: TextStyle(
                                                      color: orange,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : gap(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                color: HexColor('#dee5f6'),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: tredPosts,
                                  ),
                                ),
                              ),
                              VisibilityDetector(
                                onVisibilityChanged: (info) {
                                  if (info.visibleFraction > 0.7) {
                                    isloadingMore = true;
                                    getTredsPost();
                                  }
                                },
                                key: Key('loading'),
                                child: loadingSpinner(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
