// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/front.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:vibetag/screens/video_player/suggested_videos_link.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/comment/comments.dart';
import 'package:vibetag/screens/home/post_types/post_file.dart';
import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/screens/video_player/Single_video_player.dart';
import 'package:vibetag/screens/video_player/suggested_videos.dart';

import '../../utils/constant.dart';
import '../../widgets/bottom_modal_sheet_widget.dart';
import '../home/post_methods/post_methods.dart';
import '../home/widgets/revibe.dart';

class VideoScreenLinkVideo extends StatefulWidget {
  final String post_id;
  final String videoUrl;

  const VideoScreenLinkVideo({
    Key? key,
    required this.post_id,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<VideoScreenLinkVideo> createState() => _VideoScreenLinkVideoState();
}

class _VideoScreenLinkVideoState extends State<VideoScreenLinkVideo> {
  ScrollController scrollController = ScrollController();
  late VideoPlayerController controller;
  double decreaseWidth = 0;
  double decreaseHeight = 0;
  List<dynamic> posts = [];
  List<dynamic> post_category = [];
  List<int> not_ids = [];
  bool isLoading = false;
  bool loadMore = false;
  bool noMorePosts = false;
  Map<String, dynamic> post = {};
  int currentTab = 0;
  String active_category = '';
  bool showReactions = false;
  int reactionValue = 0;
  bool isLiked = false;
  List<int> reactionOnPost = [];

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
      widget.videoUrl.toString(),
    )..initialize().then(
        (_) {
          setState(() {});
        },
      );

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if ((decreaseHeight + controller.value.size.height - 300) > 400) {
          if (decreaseHeight > -350) {
            decreaseHeight -= 10;
            setState(() {});
          }
        }
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
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
    relatedVideos();
    getPostsCategories();
  }

  getPostsCategories() async {
    final result = await API().postData({
      'type': 'get_post_categories',
      'user_id': loginUserId.toString(),
    });
    final response = jsonDecode(result.body)['data'];
    post_category.add(
      {"id": "4345", "name": "Related Videos"},
    );
    post_category.add(
      {"id": "4345", "name": "You may like"},
    );

    List<dynamic> categories_list = [];

    for (var category in response['Explore']) {
      categories_list.add(category);
    }
    for (var category in response['Leisure']) {
      categories_list.add(category);
    }
    for (var category in response['Lifestyle']) {
      categories_list.add(category);
    }
    for (var category in response['MusicAudio']) {
      categories_list.add(category);
    }
    for (var category in response['TVProgrammes']) {
      categories_list.add(category);
    }
    for (var category in response['SocietyEnvironment']) {
      categories_list.add(category);
    }
    categories_list.shuffle();
    for (var category in categories_list) {
      post_category.add(
        category,
      );
    }
  }

  relatedVideos() async {
    if (!loadMore) {
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

  youMayLike() async {
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
      'not_ids': '1,2',
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
        loadMore = false;
      });
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  getCategoryVideos() async {
    if (!loadMore) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
    }
    final data = {
      'type': 'category_posts',
      'action': 'category_posts',
      'post_id': widget.post_id.toString(),
      'post_category': active_category,
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
        loadMore = false;
      });
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  reactOnPost() async {
    await PostMethods().reactOnPost(
      post_id: widget.post_id,
      reactionValue: reactionValue.toString(),
    );
  }

  postReactionsList() {
    isLiked = followLikeORJoin(post: post)['isLiked'];
    for (var i = 0; i < 8; i++) {
      if (post['reaction']['${i + 1}'] != null) {
        reactionOnPost.add(i);
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return WillPopScope(
      onWillPop: () async {
        await controller.pause();
        await controller.dispose();
        Provider.of<PostProvider>(context, listen: false).clear();
        pushReplacement(
          context: context,
          screen: FrontPage(),
        );
        return true;
      },
      child: Scaffold(
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
                          controller.value.size.height > 700
                              ? Container(
                                  color: blackPrimary,
                                  height: controller.value.size.height -
                                      300 +
                                      decreaseHeight,
                                  child: Center(
                                    child: SingleVideoPlayer(
                                      post_id: widget.post_id,
                                      controller: controller,
                                      showFullScreen: true,
                                      showTime: true,
                                    ),
                                  ),
                                )
                              : Container(
                                  child: Center(
                                    child: SingleVideoPlayer(
                                      post_id: widget.post_id,
                                      controller: controller,
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
                          itemCount: post_category.length,
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
                                    post_category[i]['name'],
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
                                if (i > 1) {
                                  active_category = '${post_category[i]['id']}';
                                  getCategoryVideos();
                                } else if (i == 0) {
                                  relatedVideos();
                                } else {
                                  youMayLike();
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
                                    post_category[i]['name'],
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
                                                        child: Text(
                                                            'No More Post'),
                                                      )
                                                    : gap(),
                                                VisibilityDetector(
                                                  key: Key('loadingMore'),
                                                  child: loadingSpinner(),
                                                  onVisibilityChanged: (info) {
                                                    if (info.visibleFraction >
                                                        0.4) {
                                                      loadMore = true;
                                                      if (currentTab == 0) {}
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
                                            return Stack(
                                              children: [
                                                Column(
                                                  children: [
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
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        width *
                                                                            0.85,
                                                                    child: Html(
                                                                      data: post[
                                                                          'postText'],
                                                                      style: {
                                                                        "body":
                                                                            Style(
                                                                          fontSize:
                                                                              FontSize(12.0),
                                                                          textOverflow:
                                                                              TextOverflow.ellipsis,
                                                                          color:
                                                                              Colors.black54,
                                                                          maxLines:
                                                                              3,
                                                                        )
                                                                      },
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      createBottomModalSheet(
                                                                        context:
                                                                            context,
                                                                        screen:
                                                                            PostBottomBar(
                                                                          post:
                                                                              post,
                                                                          is_publisher: post['publisher']['user_id'].toString() == loginUserId
                                                                              ? true
                                                                              : false,
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/new/icons/more_v.png',
                                                                      color:
                                                                          grayMed,
                                                                    ),
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
                                                                            'assets/new/icons/comment.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      gap(w: 3),
                                                                      Text(
                                                                        '${getInK(number: int.parse(post['total_comments'].toString()))} Comments',
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
                                                      margin: spacing(
                                                          horizontal: 15),
                                                      height: 1,
                                                      width: double.maxFinite,
                                                      color: grayMed,
                                                    ),
                                                    gap(
                                                      h: 10,
                                                    ),
                                                    Padding(
                                                      padding: spacing(
                                                          horizontal: 15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              showReactions =
                                                                  !showReactions;
                                                              setState(() {});
                                                            },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: width *
                                                                      0.04,
                                                                  height:
                                                                      width *
                                                                          0.04,
                                                                  child: reactionValue !=
                                                                          0
                                                                      ? Image.asset(reactions[
                                                                          reactionValue -
                                                                              1])
                                                                      : post['reaction']
                                                                              [
                                                                              'is_reacted']
                                                                          ? Image.asset(reactions[int.parse(post['reaction']['type']) -
                                                                              1])
                                                                          : Image
                                                                              .asset(
                                                                              'assets/new/icons/heart.png',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Text(
                                                                  reactionValue !=
                                                                          0
                                                                      ? reactionsText[
                                                                          reactionValue -
                                                                              1]
                                                                      : post['reaction']
                                                                              [
                                                                              'is_reacted']
                                                                          ? reactionsText[int.parse(post['reaction']['type']) -
                                                                              1]
                                                                          : 'React',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        grayMed,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              createBottomModalSheet(
                                                                context:
                                                                    context,
                                                                screen:
                                                                    Comments(
                                                                  postId: widget
                                                                      .post_id,
                                                                ),
                                                              );
                                                            },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: width *
                                                                      0.03,
                                                                  height:
                                                                      width *
                                                                          0.03,
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/new/icons/comment.png',
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Text(
                                                                  'Comment',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        grayMed,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              createBottomModalSheet(
                                                                context:
                                                                    context,
                                                                screen: Revibe(
                                                                  post: post,
                                                                ),
                                                              );
                                                            },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: width *
                                                                      0.03,
                                                                  height:
                                                                      width *
                                                                          0.03,
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/new/icons/revibe.png',
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Text(
                                                                  'Revibe',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        grayMed,
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
                                                      margin: spacing(
                                                          horizontal: 15),
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
                                                                  controller
                                                                      .pause();
                                                                  if (post['publisher']
                                                                          [
                                                                          'page_id'] !=
                                                                      null) {
                                                                    pushRoute(
                                                                      context:
                                                                          context,
                                                                      screen:
                                                                          PageScreen(
                                                                        page_id:
                                                                            post['publisher']['page_id'].toString(),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    pushRoute(
                                                                      context:
                                                                          context,
                                                                      screen:
                                                                          Profile(
                                                                        user_id:
                                                                            post['publisher']['user_id'].toString(),
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                                child:
                                                                    CircleAvatar(
                                                                  foregroundImage:
                                                                      NetworkImage(
                                                                    post['publisher']
                                                                        [
                                                                        'avatar'],
                                                                  ),
                                                                  radius:
                                                                      width *
                                                                          0.06,
                                                                ),
                                                              ),
                                                              gap(w: 10),
                                                              Column(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      controller
                                                                          .pause();
                                                                      if (post['publisher']
                                                                              [
                                                                              'page_id'] !=
                                                                          null) {
                                                                        pushRoute(
                                                                          context:
                                                                              context,
                                                                          screen:
                                                                              PageScreen(
                                                                            page_id:
                                                                                post['publisher']['page_id'].toString(),
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        pushRoute(
                                                                          context:
                                                                              context,
                                                                          screen:
                                                                              Profile(
                                                                            user_id:
                                                                                post['publisher']['user_id'].toString(),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      post['publisher']['first_name'] !=
                                                                              null
                                                                          ? '${post['publisher']['first_name']} ${post['publisher']['last_name']}'
                                                                          : '${post['publisher']['name']}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  gap(h: 5),
                                                                  post['publisher']
                                                                              [
                                                                              'page_id'] ==
                                                                          null
                                                                      ? Text(
                                                                          '${getInK(number: int.parse(post['publisher']['details']['followers_count']))} followers',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.bold,
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
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                colors: [
                                                                  HexColor(
                                                                      '#FFC107'),
                                                                  HexColor(
                                                                      '#FE9700'),
                                                                ],
                                                              ),
                                                              borderRadius:
                                                                  borderRadius(
                                                                      5),
                                                            ),
                                                            child: post['publisher']
                                                                        [
                                                                        'page_id'] ==
                                                                    null
                                                                ? Text(
                                                                    post['publisher']['followers_data']
                                                                            .contains(loginUserId)
                                                                        ? 'Following'
                                                                        : 'Follow',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          white,
                                                                    ),
                                                                  )
                                                                : Text(
                                                                    post['is_liked']
                                                                        ? 'Liked'
                                                                        : 'Like',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          white,
                                                                    ),
                                                                  ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    gap(h: 15)
                                                  ],
                                                ),
                                                showReactions
                                                    ? Positioned(
                                                        child: Container(
                                                          width: width * 0.74,
                                                          height: width * 0.11,
                                                          padding: spacing(
                                                            horizontal: 10,
                                                            vertical: 5,
                                                          ),
                                                          margin: spacing(
                                                            horizontal: 10,
                                                            vertical: 5,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: white,
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              56,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      offset: Offset
                                                                          .zero,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          3,
                                                                    ),
                                                                  ],
                                                                  borderRadius:
                                                                      borderRadius(
                                                                          5)),
                                                          child:
                                                              ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount: reactions
                                                                .length,
                                                            itemBuilder:
                                                                (context, i) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  showReactions =
                                                                      !showReactions;
                                                                  setState(
                                                                      () {});
                                                                  reactionValue =
                                                                      i + 1;
                                                                  reactOnPost();
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: width *
                                                                      0.08,
                                                                  height:
                                                                      width *
                                                                          0.08,
                                                                  child: Image.asset(
                                                                      reactions[
                                                                          i]),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            );
                                          }

                                          return isLoading
                                              ? loadingSpinner()
                                              : posts[i - 1]['postFile']
                                                      .toString()
                                                      .contains('.mp4')
                                                  ? posts[i - 1]
                                                              ['postFileThumb']
                                                          .toString()
                                                          .isEmpty
                                                      ? gap()
                                                      : InkWell(
                                                          onTap: () async {
                                                            await controller
                                                                .pause();
                                                            await controller
                                                                .dispose();
                                                            pushRoute(
                                                              context: context,
                                                              screen:
                                                                  VideoScreenLinkVideo(
                                                                videoUrl: getFullLink(
                                                                    posts[i - 1]
                                                                        [
                                                                        'postFile']),
                                                                post_id: posts[
                                                                        i - 1]
                                                                    ['post_id'],
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            margin: spacing(
                                                              vertical: 5,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: white,
                                                              boxShadow:
                                                                  boxShadow,
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Center(
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.maxFinite,
                                                                            child:
                                                                                FadeInImage.assetNetwork(
                                                                              placeholder: 'assets/new/gif/image_loading1.gif',
                                                                              image: getFullLink(posts[i - 1]['postFileThumb']),
                                                                              fit: BoxFit.cover,
                                                                              placeholderFit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                        top: 0,
                                                                        left: 0,
                                                                        bottom:
                                                                            0,
                                                                        right:
                                                                            0,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                70,
                                                                            height:
                                                                                70,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: borderRadius(50),
                                                                              color: Color.fromARGB(54, 0, 0, 0),
                                                                            ),
                                                                            child:
                                                                                Icon(
                                                                              Icons.play_arrow,
                                                                              size: 48,
                                                                              color: white,
                                                                            ),
                                                                          ),
                                                                        ))
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  color: white,
                                                                  margin:
                                                                      spacing(
                                                                    vertical: 8,
                                                                  ),
                                                                  padding:
                                                                      spacing(
                                                                    horizontal:
                                                                        10,
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            spacing(horizontal: 15),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                gap(
                                                                                  h: 10,
                                                                                ),
                                                                                Container(
                                                                                  width: width * 0.8,
                                                                                  child: Html(
                                                                                    data: posts[i - 1]['postText'],
                                                                                    style: {
                                                                                      "body": Style(
                                                                                        fontSize: FontSize(12.0),
                                                                                        textOverflow: TextOverflow.ellipsis,
                                                                                        color: Colors.black54,
                                                                                        maxLines: 3,
                                                                                      )
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  children: [
                                                                                    Row(
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.only(bottom: 4),
                                                                                          child: Icon(
                                                                                            Icons.remove_red_eye,
                                                                                            size: 16,
                                                                                            color: grayMed,
                                                                                          ),
                                                                                        ),
                                                                                        gap(w: 3),
                                                                                        Text(
                                                                                          '${getInK(number: int.parse(posts[i - 1]['videoViews'].toString()))} views',
                                                                                          style: TextStyle(
                                                                                            fontSize: 10,
                                                                                            color: blackLight,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    gap(w: 20),
                                                                                    Row(
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.only(bottom: 4),
                                                                                          child: Container(
                                                                                            width: 14,
                                                                                            child: Image.asset(
                                                                                              'assets/new/icons/heart.png',
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        gap(w: 3),
                                                                                        Text(
                                                                                          '${getInK(number: int.parse(posts[i - 1]['reaction']['count'].toString()))} Reacts',
                                                                                          style: TextStyle(
                                                                                            fontSize: 10,
                                                                                            color: blackLight,
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
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                  : gap();
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
      ),
    );
  }
}
