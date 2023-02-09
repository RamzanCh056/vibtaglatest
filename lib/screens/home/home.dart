
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:vibetag/model/user.dart';
import 'package:vibetag/model/user_details.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:vibetag/provider/userProvider.dart';

import 'package:vibetag/provider/user_detailsProvider.dart';
import 'package:vibetag/screens/auth/add_photo.dart';
import 'package:vibetag/screens/buzz/buzz.dart';
import 'package:vibetag/screens/home/home_search.dart';
import 'package:vibetag/screens/home/home_story.dart';
import 'package:vibetag/screens/home/home_tab_bar.dart';
import 'package:vibetag/screens/home/post_ads.dart';
import 'package:vibetag/screens/home/post_blog.dart';
import 'package:vibetag/screens/home/post_colored.dart';
import 'package:vibetag/screens/home/post_poll.dart';
import 'package:vibetag/screens/home/post_photo.dart';
import 'package:vibetag/screens/home/post_event.dart';
import 'package:vibetag/screens/home/post_product.dart';
import 'package:vibetag/screens/shop/shop.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import '../../methods/post_methods.dart';
import '../../utils/constant.dart';
import '../compaign/boost.dart';
import '../shop/market/market.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool yourFeeds = true;
  bool activeTheme = true;
  bool isScrollDown = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isLoading = false;
  late ModelUser user;
  late UserDetails userDetails;
  List<dynamic> posts = [];
  int postsLength = 0;
  bool isAlreadyLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollDown) {
          setState(() {
            isScrollDown = true;
          });
        }
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollDown) {
          setState(() {
            isScrollDown = false;
          });
        }
      }
    });
    setUser();
  }

  void setUser() async {
    setState(() {
      isLoading = true;
    });
    user = Provider.of<UserProvider>(
      context,
      listen: false,
    ).user;

    if (user.user_id == '') {
      await AuthMethod().setUser(
        context: context,
        userId: loginUserId,
      );
      user = Provider.of<UserProvider>(
        context,
        listen: false,
      ).user;
    }

    posts = Provider.of<PostProvider>(context, listen: false).posts;
    if (posts.length == 0) {
      await PostMethods().getPosts(context: context);
    }
    setState(() {
      isLoading = false;
    });

    userDetails = Provider.of<UsersDetailsProvider>(
      context,
      listen: false,
    ).userDetails;
    if (user.following_number == '0') {
      pushReplacement(
        context: context,
        screen: const AddPhoto(),
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  List<Widget> page = [
    Home(),
    Boost(),
    Buzzin(),
    Shop(),
    Market(),
  ];
  String lastPostId = '';
  bool loadingMore = false;
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

    await PostMethods().loadMorePosts(
      context: context,
      lastPostId: lastPostId.toString(),
    );
    if (mounted) {
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

    posts = Provider.of<PostProvider>(context).posts;

    return Scaffold(
      key: _key,
      backgroundColor: blackPrimary,
      body: SafeArea(
        child: isLoading
            ? loadingSpinner()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      child: Column(
                        children: [
                          isScrollDown ? Container() : NavBar(),
                          Header(),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: width,
                      height: height * 0.85,
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
                              height: height,
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: posts.length + 2,
                                itemBuilder: (constext, i) {
                                  postsLength = postsLength;

                                  if (i == 0) {
                                    return Column(
                                      children: [
                                        HomeTabBar(),
                                        HomeStory(user: user),
                                        createPost(user)
                                      ],
                                    );
                                  } else if (i > 0 && i < (posts.length - 1)) {
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
                                        avatar: posts[i - 1]['publisher']
                                            ['avatar'],
                                        name: posts[i - 1]['publisher']
                                                    ['first_name'] !=
                                                null
                                            ? "${posts[i - 1]['publisher']['first_name']} ${posts[i - 1]['publisher']['last_name']}"
                                            : "${posts[i - 1]['publisher']['page_title']}",
                                        postTime: posts[i - 1]['post_time'],
                                        postText: posts[i - 1]['postText'],
                                        poolOptions: posts[i - 1]['options'],
                                        likes: posts[i - 1]['reaction']['count']
                                            .toString(),
                                        comments: posts[i - 1]['post_comments'],
                                        shares: posts[i - 1]['post_shares'],
                                      );
                                    } else if (posts[i - 1]['blog_id'] != '0') {
                                      return BlogPost(
                                        post: posts[i - 1],
                                      );
                                    } else if (posts[i - 1]['page_event_id'] !=
                                        '0') {
                                      return PostEvent(
                                        post: posts[i - 1],
                                        postId: posts[i - 1]['post_id'],
                                        avatar: posts[i - 1]['publisher']
                                            ['avatar'],
                                        name: posts[i - 1]['publisher']
                                                    ['first_name'] !=
                                                null
                                            ? "${posts[i - 1]['publisher']['first_name']} ${posts[i - 1]['publisher']['last_name']}"
                                            : "${posts[i - 1]['publisher']['page_title']}",
                                        postTime: posts[i - 1]['post_time'],
                                        coverImage: posts[i - 1]['event']
                                            ['cover'],
                                        eventName: posts[i - 1]['event']
                                            ['name'],
                                        startDate: posts[i - 1]['event']
                                            ['start_date'],
                                        endDate: posts[i - 1]['event']
                                            ['end_date'],
                                        likes: posts[i - 1]['reaction']['count']
                                            .toString(),
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
                                    } else if (posts[i - 1]['color_id'] !=
                                        '0') {
                                      return ColoredPost(
                                        post: posts[i - 1],
                                        postId: posts[i - 1]['post_id'],
                                        avatar: posts[i - 1]['publisher']
                                            ['avatar'],
                                        name: posts[i - 1]['publisher']
                                                    ['first_name'] !=
                                                null
                                            ? "${posts[i - 1]['publisher']['first_name']} ${posts[i - 1]['publisher']['last_name']}"
                                            : "${posts[i - 1]['publisher']['page_title']}",
                                        first: posts[i - 1]['publisher']
                                                    ['first_name'] !=
                                                null
                                            ? "${posts[i - 1]['publisher']['first_name']}"
                                            : "${posts[i - 1]['publisher']['page_title']}",
                                        postTime: posts[i - 1]['post_time'],
                                        color_post_info: posts[i - 1]
                                            ['color_post_info'],
                                        feelings: posts[i - 1]['postFeeling'],
                                        location: posts[i - 1]['postMap'],
                                        reactions: posts[i - 1]['reaction'],
                                        postText: posts[i - 1]['postText'],
                                        postFile: posts[i - 1]['postFile'],
                                        videoViews: int.parse(
                                            posts[i - 1]['videoViews']),
                                        comments: posts[i - 1]['post_comments'],
                                        likes: posts[i - 1]['reaction']['count']
                                            .toString(),
                                        shares: posts[i - 1]['post_shares'],
                                        likeString: posts[i - 1]
                                            ['likes_string'],
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
                                  return loadingMore
                                      ? loadingSpinner()
                                      : Container();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
