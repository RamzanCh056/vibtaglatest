// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/post_type.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:video_player/video_player.dart';

import 'package:vibetag/screens/home/comments.dart';
import 'package:vibetag/screens/video_player/Single_video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constant.dart';
import '../home/revibe.dart';

class VideoScreen extends StatefulWidget {
  final VideoPlayerController controller;
  final String post_id;

  const VideoScreen({
    Key? key,
    required this.controller,
    required this.post_id,
  }) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ScrollController scrollController = ScrollController();
  double decreaseWidth = 0;
  double decreaseHeight = 0;
  List<dynamic> posts = [];
  List<int> not_ids = [];
  bool isLoading = false;
  bool loadMore = false;
  bool noMorePosts = false;
  Map<String, dynamic> post = {};
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        print('Scroll Up');
        if ((decreaseHeight + widget.controller.value.size.height - 300) >
            400) {
          if (decreaseHeight > -350) {
            decreaseHeight -= 10;
            setState(() {});
          }
        }
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        print('Scroll Down');
        if (decreaseHeight < 0) {
          decreaseHeight += 10;
          setState(() {});
        }
      }
    });
    getSinglePagePosts();
  }

  getSinglePagePosts() async {
    setState(() {
      isLoading = true;
    });

    final data = {
      'type': 'single_page',
      'action': 'get_single_post',
      'user_id': loginUserId.toString(),
      'post_id': widget.post_id.toString(),
    };
    final result = await API().postData(data);
    post = jsonDecode(result.body)['data'];

    getYouMayLike();
  }

  List<String> videoBar = [
    'You may like',
    'Related video',
    'Music',
    'Entertainment'
  ];

  getYouMayLike() async {
    if (!loadMore) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
    }
    final data = {
      'type': 'single_page',
      'action': 'get_more_you_may_like_videos',
      'user_id': loginUserId.toString(),
      'not_ids': not_ids.length == 0
          ? '0'
          : not_ids.toString().substring(1, (not_ids.length - 1)),
    };

    final result = await API().postData(data);
    if (jsonDecode(result.body)['data'].length > 0) {
      noMorePosts = false;
    } else {
      noMorePosts = true;
    }
    if (loadMore) {
      final newLoadedPosts = jsonDecode(result.body)['data'];
      if (newLoadedPosts.length > 0) {
        for (var i = 0; i < newLoadedPosts.length; i++) {
          posts.add(newLoadedPosts[i]);
        }
      }
    } else {
      posts = jsonDecode(result.body)['data'];
    }
    if (posts.length > 0) {
      for (var i = 0; i < posts.length; i++) {
        not_ids.add(int.parse(posts[i]['post_id'].toString()));
      }
    }
    if (loadMore) {
      setState(() {
        loadMore = !loadMore;
      });
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  relatedVideos() async {
    if (!loadMore) {
      print('++++++++++++++++++++++++++++++');
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
    }
    final data = {
      'type': 'single_page',
      'action': 'get_related_videos',
      'post_category': post['post_category'] != null
          ? post['post_category'].toString()
          : 0.toString(),
      'user_id': loginUserId.toString(),
      'not_id': not_ids.length == 0
          ? '0'
          : not_ids.toString().substring(1, (not_ids.length - 1)),
    };

    final result = await API().postData(data);
    if (jsonDecode(result.body)['data'].length > 0) {
      noMorePosts = false;
    } else {
      noMorePosts = true;
    }
    print(jsonDecode(result.body)['data']);

    if (loadMore) {
      final newLoadedPosts = jsonDecode(result.body)['data'];
      if (newLoadedPosts.length > 0) {
        for (var i = 0; i < newLoadedPosts.length; i++) {
          posts.add(newLoadedPosts[i]);
        }
      }
    } else {
      posts = jsonDecode(result.body)['data'];
    }
    if (posts.length > 0) {
      for (var i = 0; i < posts.length; i++) {
        not_ids.add(int.parse(posts[i]['post_id'].toString()));
      }
    }
    if (loadMore) {
      setState(() {
        loadMore = false;
      });
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: backgroundColor,
          child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        widget.controller.value.size.height > 700
                            ? Container(
                                color: blackPrimary,
                                height: widget.controller.value.size.height -
                                    300 +
                                    decreaseHeight,
                                child: Center(
                                  child: SingleVideoPlayer(
                                    post_id: widget.post_id,
                                    controller: widget.controller,
                                    showFullScreen: true,
                                    showTime: true,
                                  ),
                                ),
                              )
                            : Container(
                                child: Center(
                                  child: SingleVideoPlayer(
                                    post_id: widget.post_id,
                                    controller: widget.controller,
                                    showFullScreen: true,
                                    showTime: true,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  gap(h: 5),
                  Container(
                    height: height * 0.05,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: videoBar.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          if (i == currentTab) {
                            return Container(
                              margin: spacing(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              padding: spacing(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: orangePrimary,
                                ),
                                borderRadius: borderRadius(width),
                              ),
                              child: Center(
                                child: Text(
                                  videoBar[i],
                                  style: TextStyle(
                                    color: orange,
                                  ),
                                ),
                              ),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              currentTab = i;
                              not_ids = [];
                              if (i == 0) {
                                getYouMayLike();
                              }
                              if (i == 1) {
                                relatedVideos();
                              }
                              setState(() {});
                            },
                            child: Container(
                              margin: spacing(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              padding: spacing(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: borderRadius(width),
                              ),
                              child: Center(
                                child: Text(
                                  videoBar[i],
                                  style: TextStyle(
                                    color: grayMed,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  gap(h: 5),
                  isLoading
                      ? loadingSpinner()
                      : Container(
                          height: height * 0.6,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.83,
                                  color: grayLight,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      itemCount: posts.length + 2,
                                      itemBuilder: (context, i) {
                                        if (i == (posts.length + 1)) {
                                          return Column(
                                            children: [
                                              noMorePosts
                                                  ? Center(
                                                      child:
                                                          Text('No More Post'),
                                                    )
                                                  : VisibilityDetector(
                                                      key: Key('loadingMore'),
                                                      child: loadingSpinner(),
                                                      onVisibilityChanged:
                                                          (info) {
                                                        if (info.visibleFraction >
                                                            0.4) {
                                                          loadMore = true;
                                                          if (currentTab == 0) {
                                                            getYouMayLike();
                                                          }
                                                          if (currentTab == 1) {
                                                            relatedVideos();
                                                          }
                                                        }
                                                      },
                                                    ),
                                              gap(h: height * 0.25),
                                            ],
                                          );
                                        }
                                        if (i == 0) {
                                          return Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    spacing(horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        gap(
                                                          h: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  width * 0.85,
                                                              child: Html(
                                                                data: post[
                                                                    'postText'],
                                                                style: {
                                                                  "body": Style(
                                                                    fontSize:
                                                                        FontSize(
                                                                            12.0),
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    color: Colors
                                                                        .black54,
                                                                    maxLines: 3,
                                                                  )
                                                                },
                                                              ),
                                                            ),
                                                            Image.asset(
                                                              'assets/new/icons/more_v.png',
                                                              color: grayMed,
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          4),
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    size: 16,
                                                                    color:
                                                                        grayMed,
                                                                  ),
                                                                ),
                                                                gap(w: 3),
                                                                Text(
                                                                  '${getInK(number: int.parse(post['videoViews']))} views',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        blackLight,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            gap(w: 20),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          4),
                                                                  child:
                                                                      Container(
                                                                    width: 14,
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/new/icons/heart.png',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                gap(w: 3),
                                                                Text(
                                                                  '${getInK(number: int.parse(post['reaction']['count'].toString()))} Reacts',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        blackLight,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              gap(
                                                h: 10,
                                              ),
                                              Container(
                                                margin: spacing(horizontal: 15),
                                                height: 1,
                                                width: double.maxFinite,
                                                color: grayMed,
                                              ),
                                              gap(
                                                h: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    spacing(horizontal: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: width * 0.03,
                                                            height:
                                                                width * 0.03,
                                                            child: Image.asset(
                                                              'assets/new/icons/heart.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            'React',
                                                            style: TextStyle(
                                                              color: grayMed,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Comments(
                                                            postId: '22895');
                                                      },
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: width * 0.03,
                                                            height:
                                                                width * 0.03,
                                                            child: Image.asset(
                                                              'assets/new/icons/comment.png',
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            'Comment',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: grayMed,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Revibe(
                                                            context: context);
                                                      },
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: width * 0.03,
                                                            height:
                                                                width * 0.03,
                                                            child: Image.asset(
                                                              'assets/new/icons/revibe.png',
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            'Revibe',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: grayMed,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              gap(
                                                h: 10,
                                              ),
                                              Container(
                                                margin: spacing(horizontal: 15),
                                                height: 1,
                                                width: double.maxFinite,
                                                color: grayMed,
                                              ),
                                              gap(
                                                h: 10,
                                              ),
                                              Padding(
                                                padding: spacing(
                                                  horizontal: 15,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            if (post['publisher']
                                                                    [
                                                                    'page_id'] !=
                                                                null) {
                                                              pushRoute(
                                                                context:
                                                                    context,
                                                                screen:
                                                                    PageScreen(
                                                                  page_id: post[
                                                                              'publisher']
                                                                          [
                                                                          'page_id']
                                                                      .toString(),
                                                                ),
                                                              );
                                                            } else {
                                                              pushRoute(
                                                                context:
                                                                    context,
                                                                screen: Profile(
                                                                  user_id: post[
                                                                              'publisher']
                                                                          [
                                                                          'user_id']
                                                                      .toString(),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          child: CircleAvatar(
                                                            foregroundImage:
                                                                NetworkImage(
                                                              post['publisher']
                                                                  ['avatar'],
                                                            ),
                                                            radius:
                                                                width * 0.06,
                                                          ),
                                                        ),
                                                        gap(w: 10),
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                if (post['publisher']
                                                                        [
                                                                        'page_id'] !=
                                                                    null) {
                                                                  pushRoute(
                                                                    context:
                                                                        context,
                                                                    screen:
                                                                        PageScreen(
                                                                      page_id: post['publisher']
                                                                              [
                                                                              'page_id']
                                                                          .toString(),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  pushRoute(
                                                                    context:
                                                                        context,
                                                                    screen:
                                                                        Profile(
                                                                      user_id: post['publisher']
                                                                              [
                                                                              'user_id']
                                                                          .toString(),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              child: Text(
                                                                post['publisher']
                                                                            [
                                                                            'first_name'] !=
                                                                        null
                                                                    ? '${post['publisher']['first_name']} ${post['publisher']['last_name']}'
                                                                    : '${post['publisher']['name']}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            gap(h: 5),
                                                            post['publisher'][
                                                                        'page_id'] ==
                                                                    null
                                                                ? Text(
                                                                    '${getInK(number: int.parse(post['publisher']['details']['followers_count']))} followers',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          blackLight,
                                                                    ),
                                                                  )
                                                                : gap(),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      padding: spacing(
                                                        horizontal: 20,
                                                        vertical: 10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          colors: [
                                                            HexColor('#FFC107'),
                                                            HexColor('#FE9700'),
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            borderRadius(5),
                                                      ),
                                                      child: post['publisher']
                                                                  ['page_id'] ==
                                                              null
                                                          ? Text(
                                                              post['publisher'][
                                                                          'followers_data']
                                                                      .contains(
                                                                          loginUserId)
                                                                  ? 'Following'
                                                                  : 'Follow',
                                                              style: TextStyle(
                                                                color: white,
                                                              ),
                                                            )
                                                          : Text(
                                                              post['is_liked']
                                                                  ? 'Liked'
                                                                  : 'Like',
                                                              style: TextStyle(
                                                                color: white,
                                                              ),
                                                            ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              gap(h: 15)
                                            ],
                                          );
                                        }

                                        return isLoading
                                            ? loadingSpinner()
                                            : Container(
                                                width: double.infinity,
                                                color: white,
                                                margin: spacing(
                                                  vertical: 8,
                                                ),
                                                padding: spacing(
                                                  horizontal: 10,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: double.maxFinite,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            borderRadius(7),
                                                        child: postFile(
                                                          file: posts[i - 1]
                                                              ['postFile_full'],
                                                          context: context,
                                                          thumbnail:
                                                              '${serverUrl}${posts[i - 1]['postFileThumb']}',
                                                          post_id: posts[i - 1]
                                                              ['post_id'],
                                                          autoPlay: false,
                                                          videoTimer: true,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: spacing(
                                                          horizontal: 15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              gap(
                                                                h: 10,
                                                              ),
                                                              Container(
                                                                width:
                                                                    width * 0.8,
                                                                child: Html(
                                                                  data: posts[
                                                                          i - 1]
                                                                      [
                                                                      'postText'],
                                                                  style: {
                                                                    "body":
                                                                        Style(
                                                                      fontSize:
                                                                          FontSize(
                                                                              12.0),
                                                                      textOverflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      color: Colors
                                                                          .black54,
                                                                      maxLines:
                                                                          3,
                                                                    )
                                                                  },
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(bottom: 4),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove_red_eye,
                                                                          size:
                                                                              16,
                                                                          color:
                                                                              grayMed,
                                                                        ),
                                                                      ),
                                                                      gap(w: 3),
                                                                      Text(
                                                                        '${getInK(number: int.parse(posts[i - 1]['videoViews'].toString()))} views',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              blackLight,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  gap(w: 20),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(bottom: 4),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              14,
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/new/icons/heart.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      gap(w: 3),
                                                                      Text(
                                                                        '${getInK(number: int.parse(posts[i - 1]['reaction']['count'].toString()))} Reacts',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              blackLight,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Image.asset(
                                                            'assets/new/icons/more_v.png',
                                                            color: grayMed,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    gap(
                                                      h: 10,
                                                    ),
                                                  ],
                                                ),
                                              );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                ],
              )),
        ),
      ),
    );
  }
}
