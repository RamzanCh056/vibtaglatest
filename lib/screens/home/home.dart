import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:vibetag/methods/firebase_helper.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/auth/add_photo.dart';
import 'package:vibetag/screens/buzz/buzz.dart';
import 'package:vibetag/screens/home/create_post/home_search.dart';
import 'package:vibetag/screens/home/widgets/home_tab_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:vibetag/screens/shop/shop.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../firebase_options.dart';
import '../chat_screens/constants.dart';
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isLoading = false;
  late Map<String, dynamic> modelUser;
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

    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString('userData') != null) {
      Map<String, dynamic> userData =
          jsonDecode(preferences.getString('userData')!);
      Provider.of<UserProvider>(context, listen: false).setUser(
        userData,
      );
    }
    if (preferences.getString('posts') != null) {
      List<dynamic> preferencesPosts =
          jsonDecode(preferences.getString('posts')!);
      PostMethods().setSharedPreferencePosts(
        posts: preferencesPosts,
        context: context,
      );
    }

    modelUser = Provider.of<UserProvider>(
      context,
      listen: false,
    ).user;

    if (modelUser == '{}') {
      await AuthMethod().setUser(
        context: context,
      );
      modelUser = Provider.of<UserProvider>(
        context,
        listen: false,
      ).user;
    }
    feeds = modelUser['order_posts_by'] == '1' ? true : false;
    posts = Provider.of<PostProvider>(context, listen: false).posts;
    if (posts.length == 0) {
      await PostMethods().getPosts(context: context);
    }
    setState(() {
      isLoading = false;
    });
    if (modelUser['following_number'] == '0') {
      pushReplacement(
        context: context,
        screen: const AddPhoto(),
      );
    }
    if (preferences.getString('posts') != null) {
      await PostMethods().getPosts(context: context);
      await AuthMethod().setUser(context: context);
    }
    if (modelUser.isNotEmpty) {
      await AuthMethod().setUser(
        context: context,
      );
      modelUser = Provider.of<UserProvider>(
        context,
        listen: false,
      ).user;
    }
    await subScribeToNotificationTopic('Private_Call_${loginUserId}');
    await subScribeToNotificationTopic('Private_Voice_Call_${loginUserId}');
    await subScribeToNotificationTopic('VibeTag_Notification');
    await subScribeToNotificationTopic('${loginUserId}');
    await FirebaseHelper.init();
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
    await PostMethods().loadMorePosts(
      context: context,
    );
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    if (!isEnabledCallEvents) {
      callEvents(context);
      isEnabledCallEvents = true;
    }

    if (mounted) {
      posts = Provider.of<PostProvider>(context).posts;
    }
    postWidgets = PostMethods().setPosts(posts: posts);
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
                      height: isScrollDown ? height * 0.84 : height * 0.79,
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
                            // AddStroy(modelUser),
                            createPost(modelUser),
                            Column(
                              children: postWidgets,
                            ),
                            isNoMorePostsHome
                                ? Center(
                                    child: Text('No More Posts'),
                                  )
                                : VisibilityDetector(
                                    key: Key('loadMore'),
                                    child: loadingSpinner(),
                                    onVisibilityChanged: (info) {
                                      if (info.visibleFraction > 0.3) {
                                        loadMore();
                                      }
                                    },
                                  ),
                            gap(h: height * 0.1),
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
