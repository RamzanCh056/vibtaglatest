import 'dart:convert';

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
import 'package:vibetag/screens/home/create_post/home_search.dart';
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
import 'package:visibility_detector/visibility_detector.dart';
import '../../methods/api.dart';
import 'post_methods/post_methods.dart';
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
  bool isNoMorePosts = false;
  int postsLength = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isLoading = false;
  late ModelUser user;
  late UserDetails userDetails;
  List<dynamic> posts = [];
  ScrollController scrollController = ScrollController();
  List<Widget> postWidgets = [];

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
    getBuzzin();
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

  getBuzzin() async {
    final data = {
      'type': 'buzzin',
      'sub_type': 'get_buzzin',
      'user_id': loginUserId,
    };
    final result = await API().postData(data);
    loadedBuzzin = jsonDecode(result.body)['data'];
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
  loadMore() async {
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
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    posts = Provider.of<PostProvider>(context, listen: false).posts;
    postWidgets = PostMethods().setPosts(posts: posts);
    if (postWidgets.length > postsLength) {
      postsLength = postWidgets.length;
    } else {
      isNoMorePosts = true;
    }

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
                        physics: ScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        controller: scrollController,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeTabBar(),
                            HomeStory(user: user),
                            createPost(user),
                            Column(
                              children: postWidgets,
                            ),
                            VisibilityDetector(
                              key: Key('loadMore'),
                              child: loadingSpinner(),
                              onVisibilityChanged: (info) {
                                if (info.visibleFraction > 0.3) {
                                  loadMore();
                                }
                              },
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
