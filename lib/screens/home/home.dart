import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:vibetag/screens/home/stories/home_story.dart';
import 'package:vibetag/screens/shop/shop.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../methods/api.dart';
import '../story/add_story.dart';
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
  late ModelUser user;
  late UserDetails userDetails;
  List<dynamic> posts = [];
  ScrollController scrollController = ScrollController();
  List<Widget> postWidgets = [];
  late NavigatorState _navigator;

  @override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

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

      Map<String, dynamic> userDetails =
          jsonDecode(preferences.getString('userData')!)['details'];

      Provider.of<UserProvider>(context, listen: false).setUser(
        ModelUser.fromMap(userData),
      );
      Provider.of<UsersDetailsProvider>(context, listen: false).setUserDetails(
        UserDetails.fromMap(userDetails),
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
    feeds = user.order_posts_by == '1' ? true : false;

    posts = Provider.of<PostProvider>(context, listen: false).posts;

    if (posts.length == 0) {
      await PostMethods().getPosts(context: context);
    }

    userDetails = Provider.of<UsersDetailsProvider>(
      context,
      listen: false,
    ).userDetails;
    setState(() {
      isLoading = false;
    });
    if (user.following_number == '0') {
      pushReplacement(
        context: context,
        screen: const AddPhoto(),
      );
    }
    if (preferences.getString('posts') != null) {
      await PostMethods().getPosts(context: context);
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
                            AddStroy(user),
                            createPost(user),
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
