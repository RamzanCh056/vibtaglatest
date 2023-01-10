import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:vibetag/model/post_modal.dart';
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
import 'package:vibetag/screens/home/post_blog.dart';
import 'package:vibetag/screens/home/comment.dart';
import 'package:vibetag/screens/home/post_colored.dart';
import 'package:vibetag/screens/home/post_poll.dart';
import 'package:vibetag/screens/home/post_photo.dart';
import 'package:vibetag/screens/home/post_event.dart';
import 'package:vibetag/screens/home/post_product.dart';
import 'package:vibetag/screens/home/post_type.dart';
import 'package:vibetag/screens/home/revibe.dart';
import 'package:vibetag/screens/shop/shop.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/story/add_story.dart';
import '../../methods/api.dart';
import '../../utils/constant.dart';
import '../compaign/boost.dart';
import '../livestream/create stream/live.dart';
import '../../widgets/post_option.dart';
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
  late List<dynamic> posts;
  int postsLength = 0;
  bool isAlreadyLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isScrollDown = true;
        });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          isScrollDown = false;
        });
      }
    });
    setUser();
  }

  void setUser() async {
    setState(() {
      isLoading = true;
    });
    await AuthMethod().setUser(
      context: context,
      userId: loginUserId,
    );

    final result = await API().postData({
      'type': 'get_home_posts',
      'user_id': loginUserId,
    });
    posts = jsonDecode(result.body)['posts_data'];
    // for (var i = 0; i < posts.length; i++) {
    //   Map<String, dynamic> post = posts[i];
    //   Provider.of<PostProvider>(context,listen: false).setPosts(PostModel.fromMap(post));
    // }

    postsLength = posts.length + 2;

    setState(() {
      isLoading = false;
    });
    user = Provider.of<UserProvider>(
      context,
      listen: false,
    ).user;

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
      setState(() {
        isAlreadyLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return Scaffold(
      key: _key,
      drawer: DrawerMenu(),
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
                          Header(
                            onTap: () {
                              _key.currentState!.openDrawer();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: width,
                      height: height * 0.8,
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
                              color: grayLight,
                              height: height * 0.82,
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
                                        HomeSearchBar(user: user),
                                      ],
                                    );
                                  } else if (i > 0 && i < (posts.length - 1)) {
                                    if (posts[i - 1]['poll_id'] != '0') {
                                      return PoolPost(
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
                                        postId: posts[i - 1]['post_id'],
                                        avatar: posts[i - 1]['publisher']
                                            ['avatar'],
                                        name: posts[i - 1]['publisher']
                                                    ['first_name'] !=
                                                null
                                            ? "${posts[i - 1]['publisher']['first_name']} ${posts[i - 1]['publisher']['last_name']}"
                                            : "${posts[i - 1]['publisher']['page_title']}",
                                        about:
                                            "${posts[i - 1]['publisher']['about']}}",
                                        first: posts[i - 1]['publisher']
                                                    ['first_name'] !=
                                                null
                                            ? "${posts[i - 1]['publisher']['first_name']}"
                                            : "${posts[i - 1]['publisher']['page_title']}",
                                        postTime: posts[i - 1]['post_time'],
                                        reactions: posts[i - 1]['reaction'],
                                        postText: posts[i - 1]['postText'],
                                        blog: posts[i - 1]['blog'],
                                        likes: posts[i - 1]['reaction']['count']
                                            .toString(),
                                        comments: posts[i - 1]['post_comments'],
                                        shares: posts[i - 1]['post_shares'],
                                      );
                                    } else if (posts[i - 1]['page_event_id'] !=
                                        '0') {
                                      return PostEvent(
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
                                        posts[i - 1]['color_id'] == '0') {
                                      return Post(
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
                                    } else if (posts[i - 1]['color_id'] !=
                                        '0') {
                                      return ColoredPost(
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
                                            : "${posts[i - 1]['publisher']['page_name']}",
                                        postTime: posts[i - 1]['post_time'],
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
                                    } else {
                                      return PostProduct(
                                        postId: posts[i - 1]['post_id'],
                                        name: posts[i - 1]['publisher']
                                                    ['first_name'] !=
                                                null
                                            ? "${posts[i - 1]['publisher']['first_name']} ${posts[i - 1]['publisher']['last_name']}"
                                            : "${posts[i - 1]['publisher']['page_title']}",
                                        productName: posts[i - 1]['product']
                                            ['name'],
                                        description: posts[i - 1]['product']
                                            ['description'],
                                        avatar: posts[i - 1]['publisher']
                                            ['avatar'],
                                        postTime: posts[i - 1]['post_time'],
                                        productImage: posts[i - 1]['product']
                                            ['images'],
                                        price: posts[i - 1]['product']
                                            ['price_max'],
                                        likes: posts[i - 1]['reaction']['count']
                                            .toString(),
                                        comments: posts[i - 1]['post_comments'],
                                        shares: posts[i - 1]['post_shares'],
                                        stock_amount: posts[i - 1]['product']
                                            ['amount_stock'],
                                        location: posts[i - 1]['product']
                                            ['location'],
                                      );
                                    }
                                  }

                                  lastPostId = posts[posts.length - 1]
                                          ['post_id']
                                      .toString();
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
