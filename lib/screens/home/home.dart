import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:vibetag/methods/firebase_helper.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/auth/add_photo.dart';
import 'package:vibetag/screens/buzz/buzz.dart';
import 'package:vibetag/screens/chat_screens/constants.dart';
import 'package:vibetag/screens/home/create_post/home_search.dart';
import 'package:vibetag/screens/home/stories/home_story.dart';
import 'package:vibetag/screens/home/widgets/home_tab_bar.dart';

import 'package:vibetag/screens/shop/shop.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
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
  List<Widget> posts = [];

  ScrollController scrollController = ScrollController();
  int filterIndex = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String? title = message.notification!.title;
      String? body = message.notification!.body;

      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 123,
        channelKey: "vibetag",
        color: Colors.white,
        title: title,
        body: body,
        wakeUpScreen: true,
        fullScreenIntent: true,
        category: NotificationCategory.Message,
        autoDismissible: true,
        backgroundColor: Colors.orange,
      ));
    });
    // scrollController.addListener(() {
    //   if (scrollController.position.userScrollDirection ==
    //       ScrollDirection.reverse) {
    //     if (!isScrollDown) {
    //       setState(() {
    //         isScrollDown = true;
    //       });
    //     }
    //   }
    //   if (scrollController.position.userScrollDirection ==
    //       ScrollDirection.forward) {
    //     if (isScrollDown) {
    //       setState(() {
    //         isScrollDown = false;
    //       });
    //     }
    //   }
    // });
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
    // if (preferences.getString('posts') != null) {
    //   List<dynamic> preferencesPosts =
    //       jsonDecode(preferences.getString('posts')!);
    //   PostMethods().setSharedPreferencePosts(
    //     posts: preferencesPosts,
    //     context: context,
    //   );
    // }

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
      // await PostMethods().getPosts(context: context);
      // await AuthMethod().setUser(context: context);
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
    posts = Provider.of<PostProvider>(context, listen: false).posts;

    if (!isEnabledCallEvents) {
      callEvents(context);
      isEnabledCallEvents = true;
    }
    if (mounted) {
      posts = Provider.of<PostProvider>(context).posts;
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
                            AddStroy(modelUser),
                            createPost(modelUser),
                            Column(
                              children: posts,
                            ),
                            isNoMorePostsHome
                                ? Center(
                                    child: Text('No More Posts'),
                                  )
                                : filterIndex != 0 && posts.length == 1
                                    ? gap()
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

  Widget HomeTabBar() {
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        double width = deviceWidth(context: context);
        double height = deviceHeight(context: context);
        return Center(
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                width * 0.02,
              ),
            ),
            child: DefaultTabController(
              length: 7,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    unselectedLabelColor: Color.fromARGB(255, 110, 107, 107),
                    labelColor: Colors.orange,
                    indicatorColor: Colors.orange,
                    onTap: (i) {
                      filterIndex = i;
                    },
                    labelStyle: TextStyle(
                      fontSize: 24,
                    ),
                    tabs: [
                      Tab(
                        icon: Container(
                          width: width * 0.04,
                          child: SvgPicture.asset(
                            'assets/new/svg/category.svg',
                            color: grayMed,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Container(
                          width: width * 0.045,
                          child: SvgPicture.asset(
                            'assets/new/svg/camera.svg',
                            color: grayMed,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Container(
                          width: width * 0.045,
                          child: SvgPicture.asset(
                            'assets/new/svg/live_stream.svg',
                            color: grayMed,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Container(
                          width: width * 0.045,
                          child: SvgPicture.asset(
                            'assets/new/svg/speaker.svg',
                            color: grayMed,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Container(
                          width: width * 0.045,
                          child: SvgPicture.asset(
                            'assets/new/svg/location.svg',
                            color: grayMed,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Container(
                          width: width * 0.045,
                          child: SvgPicture.asset(
                            'assets/new/svg/doc.svg',
                            color: grayMed,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Container(
                          width: width * 0.045,
                          child: SvgPicture.asset(
                            'assets/new/svg/live.svg',
                            color: grayMed,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
