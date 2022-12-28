import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/methods/auth_method.dart';
import 'package:vibetag/model/user.dart';
import 'package:vibetag/model/user_details.dart';
import 'package:vibetag/provider/userProvider.dart';

import 'package:vibetag/provider/user_detailsProvider.dart';
import 'package:vibetag/screens/auth/add_photo.dart';
import 'package:vibetag/screens/buzz/buzz.dart';
import 'package:vibetag/screens/home/post_blog.dart';
import 'package:vibetag/screens/home/comment.dart';
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
  final List<Widget> postOptions = [
    postOption(
      title: 'Upload Image',
      icon: 'assets/svg/post/image.svg',
      iconColor: HexColor('#5A92ED'),
    ),
    postOption(
      title: 'Upload Video',
      icon: 'assets/svg/post/video-camera.svg',
      iconColor: HexColor('#1EC722'),
    ),
    postOption(
      title: 'GIF',
      icon: 'assets/svg/post/plate.svg',
      iconColor: HexColor('#E5758F'),
    ),
    postOption(
      title: 'Upload Recording',
      icon: 'assets/svg/post/microphone.svg',
      iconColor: HexColor('#32C0D9'),
    ),
    postOption(
      title: 'Feelings',
      icon: 'assets/svg/post/smile.svg',
      iconColor: HexColor('#F5BC2B'),
    ),
    postOption(
      title: 'Upload Files',
      icon: 'assets/svg/post/folder.svg',
      iconColor: HexColor('#8D70DB'),
    ),
    postOption(
      title: 'Sell Products',
      icon: 'assets/svg/post/shopping-cart.svg',
      iconColor: HexColor('#FF9200'),
    ),
    postOption(
      title: 'Create Poll',
      icon: 'assets/svg/post/poll.svg',
      iconColor: HexColor('#868686'),
    ),
    postOption(
      title: 'Location',
      icon: 'assets/svg/post/maps-and-flags.svg',
      iconColor: HexColor('#77300A'),
    ),
    postOption(
      title: 'Audio Upload',
      icon: 'assets/svg/post/headphone.svg',
      iconColor: HexColor('#000000'),
    ),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isLoading = false;
  late ModelUser user;
  late UserDetails userDetails;
  late List<dynamic> posts;

  @override
  void initState() {
    super.initState();
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
    }
    setState(() {
      loadingMore = false;
    });
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
                          NavBar(),
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
                      height: height * 0.748,
                      decoration: BoxDecoration(
                        color: whiteSecondary,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
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
                                        unselectedLabelColor:
                                            Color.fromARGB(255, 110, 107, 107),
                                        labelColor: Colors.orange,
                                        indicatorColor: Colors.orange,
                                        labelStyle: TextStyle(
                                          fontSize: 24,
                                        ),
                                        tabs: [
                                          Tab(
                                            icon: Container(
                                              width: width * 0.04,
                                              child: SvgIcon(
                                                'assets/new/svg/category.svg',
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            icon: Container(
                                              width: width * 0.045,
                                              child: SvgIcon(
                                                'assets/new/svg/camera.svg',
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            icon: Container(
                                              width: width * 0.045,
                                              child: SvgIcon(
                                                'assets/new/svg/live_stream.svg',
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            icon: Container(
                                              width: width * 0.045,
                                              child: SvgIcon(
                                                'assets/new/svg/location.svg',
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            icon: Container(
                                              width: width * 0.045,
                                              child: SvgIcon(
                                                'assets/new/svg/speaker.svg',
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            icon: Container(
                                              width: width * 0.045,
                                              child: SvgIcon(
                                                'assets/new/svg/doc.svg',
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            icon: Container(
                                              width: width * 0.045,
                                              child: SvgIcon(
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
                            ),
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width,
                                      height: height * 0.25,
                                      padding: spacing(
                                        vertical: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: white,
                                      ),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 10,
                                        shrinkWrap: true,
                                        itemBuilder: (context, i) {
                                          if (i < 1) {
                                            return InkWell(
                                              onTap: () {
                                                addStory(context: context);
                                              },
                                              child: Container(
                                                width: width * 0.3,
                                                margin: spacing(
                                                  horizontal: width * 0.01,
                                                  vertical: height * 0.001,
                                                ),
                                                padding: spacing(
                                                  horizontal: 2,
                                                  vertical: 1,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 2,
                                                    color: orangePrimary,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    width * 0.015,
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      top: 0,
                                                      bottom: 0,
                                                      left: 0,
                                                      right: 0,
                                                      child: Container(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            width * 0.015,
                                                          ),
                                                          child: Image.network(
                                                            user.avatar!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      child: InkWell(
                                                        onTap: () {
                                                          addStory(
                                                              context: context);
                                                        },
                                                        child: Center(
                                                          child: Image.asset(
                                                            'assets/new/icons/add_story.png',
                                                            fit: BoxFit.cover,
                                                            width: width * 0.1,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                          return Stack(
                                            children: [
                                              Container(
                                                width: width * 0.3,
                                                height: height * 0.23,
                                                margin: spacing(
                                                  horizontal: width * 0.015,
                                                  vertical: height * 0.001,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    width * 0.015,
                                                  ),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      offset: Offset.zero,
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                    )
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    width * 0.015,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/cover.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                left: 5,
                                                child: Container(
                                                  width: width * 0.07,
                                                  height: width * 0.07,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        borderRadius(width),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        borderRadius(width),
                                                    child: Image.asset(
                                                      'assets/images/streamer.jpg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                right: 10,
                                                child: Container(
                                                  padding: spacing(
                                                    horizontal: 4,
                                                    vertical: 2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: red,
                                                    borderRadius:
                                                        borderRadius(5),
                                                  ),
                                                  child: Text(
                                                    'Live',
                                                    style: TextStyle(
                                                      color: white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      color: grayLight,
                                      height: height * 0.6,
                                      child: ListView.builder(
                                        itemCount: posts.length + 1,
                                        itemBuilder: (constext, i) {
                                          if (i == posts.length - 1) {
                                            lastPostId =
                                                posts[i]['post_id'].toString();
                                            Future.delayed(Duration(seconds: 2),
                                                () {
                                              loadMore();
                                            });
                                          }

                                          if (i == posts.length) {
                                            return loadingMore
                                                ? loadingSpinner()
                                                : InkWell(
                                                    child: Container(
                                                      margin: spacing(
                                                        vertical: 20,
                                                        horizontal: 10,
                                                      ),
                                                    ),
                                                  );
                                          }

                                          if (posts[i]['product_id'] == '0') {
                                            if (posts[i]['poll_id'] != '0') {
                                              return PoolPost(
                                                postId: posts[i]['post_id'],
                                                avatar: posts[i]['publisher']
                                                    ['avatar'],
                                                name: posts[i]['publisher']
                                                            ['first_name'] !=
                                                        null
                                                    ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
                                                    : "${posts[i]['publisher']['page_title']}",
                                                postTime: posts[i]['post_time'],
                                                postText: posts[i]['postText'],
                                                poolOptions: posts[i]
                                                    ['options'],
                                                likes: posts[i]['reaction']
                                                        ['count']
                                                    .toString(),
                                                comments: posts[i]
                                                    ['post_comments'],
                                                shares: posts[i]['post_shares'],
                                              );
                                            } else if (posts[i]['blog_id'] !=
                                                '0') {
                                              return BlogPost(
                                                postId: posts[i]['post_id'],
                                                avatar: posts[i]['publisher']
                                                    ['avatar'],
                                                name: posts[i]['publisher']
                                                            ['first_name'] !=
                                                        null
                                                    ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
                                                    : "${posts[i]['publisher']['page_title']}",
                                                about:
                                                    "${posts[i]['publisher']['about']}}",
                                                postTime: posts[i]['post_time'],
                                                postText: posts[i]['postText'],
                                                blog: posts[i]['blog'],
                                                likes: posts[i]['reaction']
                                                        ['count']
                                                    .toString(),
                                                comments: posts[i]
                                                    ['post_comments'],
                                                shares: posts[i]['post_shares'],
                                              );
                                            } else if (posts[i]
                                                    ['page_event_id'] !=
                                                '0') {
                                              return PostEvent(
                                                postId: posts[i]['post_id'],
                                                avatar: posts[i]['publisher']
                                                    ['avatar'],
                                                name: posts[i]['publisher']
                                                            ['first_name'] !=
                                                        null
                                                    ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
                                                    : "${posts[i]['publisher']['page_title']}",
                                                postTime: posts[i]['post_time'],
                                                coverImage: posts[i]['event']
                                                    ['cover'],
                                                eventName: posts[i]['event']
                                                    ['name'],
                                                startDate: posts[i]['event']
                                                    ['start_date'],
                                                endDate: posts[i]['event']
                                                    ['end_date'],
                                                likes: posts[i]['reaction']
                                                        ['count']
                                                    .toString(),
                                                comments: posts[i]
                                                    ['post_comments'],
                                                shares: posts[i]['post_shares'],
                                              );
                                            }
                                            return Post(
                                              postId: posts[i]['post_id'],
                                              avatar: posts[i]['publisher']
                                                  ['avatar'],
                                              name: posts[i]['publisher']
                                                          ['first_name'] !=
                                                      null
                                                  ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
                                                  : "${posts[i]['publisher']['page_title']}",
                                              postTime: posts[i]['post_time'],
                                              feelings: posts[i]['postFeeling'],
                                              location: posts[i]['postMap'],
                                              postText: posts[i]['postText'],
                                              postFile: posts[i]['postFile'],
                                              videoViews: int.parse(
                                                  posts[i]['videoViews']),
                                              comments: posts[i]
                                                  ['post_comments'],
                                              likes: posts[i]['reaction']
                                                      ['count']
                                                  .toString(),
                                              shares: posts[i]['post_shares'],
                                            );
                                          } else {
                                            return PostProduct(
                                              postId: posts[i]['post_id'],
                                              name: posts[i]['publisher']
                                                          ['first_name'] !=
                                                      null
                                                  ? "${posts[i]['publisher']['first_name']} ${posts[i]['publisher']['last_name']}"
                                                  : "${posts[i]['publisher']['page_title']}",
                                              productName: posts[i]['product']
                                                  ['name'],
                                              description: posts[i]['product']
                                                  ['description'],
                                              avatar: posts[i]['publisher']
                                                  ['avatar'],
                                              postTime: posts[i]['post_time'],
                                              productImage: posts[i]['product']
                                                  ['images'],
                                              price: posts[i]['product']
                                                  ['price_max'],
                                              likes: posts[i]['reaction']
                                                      ['count']
                                                  .toString(),
                                              comments: posts[i]
                                                  ['post_comments'],
                                              shares: posts[i]['post_shares'],
                                              stock_amount: posts[i]['product']
                                                  ['amount_stock'],
                                              location: posts[i]['product']
                                                  ['location'],
                                            );
                                          }
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
                  ],
                ),
              ),
      ),
    );
  }

  add_A_Post() {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: ((context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              backgroundColor: Colors.white,
              iconPadding: EdgeInsets.only(
                top: height * 0.01,
                right: height * 0.01,
                left: width * 0.95,
              ),
              icon: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                    padding: EdgeInsets.all(
                      width * 0.01,
                    ),
                    decoration: BoxDecoration(
                        color: HexColor('#DDDDDD'),
                        borderRadius: BorderRadius.circular(
                          width * 0.3,
                        )),
                    child: Icon(Icons.close)),
              ),
              content: Container(
                width: width * 0.95,
                height: height * 0.85,
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: spacing(
                        horizontal: width * 0.05,
                        vertical: 0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'What\'s happening',
                              style: TextStyle(
                                color: HexColor('#7C7C7C'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.15,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: spacing(
                                        horizontal: width * 0.015,
                                        vertical: 0,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/svg/post/color-circle.svg',
                                        fit: BoxFit.cover,
                                        width: width * 0.06,
                                      ),
                                    ),
                                    Container(
                                      padding: spacing(
                                        horizontal: width * 0.015,
                                        vertical: 5,
                                      ),
                                      margin: spacing(
                                        horizontal: width * 0.015,
                                        vertical: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor('#F0F0F0'),
                                        borderRadius:
                                            BorderRadius.circular(width * 0.02),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: width * 0.04,
                                            child: const SvgIcon(
                                              'assets/svg/post/world.svg',
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.015,
                                          ),
                                          const Text(
                                            'Everyone',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: spacing(
                                              horizontal: width * 0.015,
                                              vertical: 9,
                                            ),
                                            decoration: BoxDecoration(
                                              color: HexColor('#F0F0F0'),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                  width * 0.02,
                                                ),
                                                topLeft: Radius.circular(
                                                  width * 0.02,
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  'Category',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: HexColor('#F0F0F0'),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                width * 0.02,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            width: 1,
                                                            color:
                                                                Colors.black38,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                              width * 0.02,
                                                            ),
                                                          ),
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .keyboard_arrow_up_rounded,
                                                          size: 14,
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            width: 1,
                                                            color:
                                                                Colors.black38,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                              width * 0.02,
                                                            ),
                                                          ),
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          size: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/post/hashtag.svg',
                                      fit: BoxFit.cover,
                                      width: width * 0.05,
                                    ),
                                    SizedBox(
                                      width: width * 0.025,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/post/at-sign.svg',
                                      fit: BoxFit.cover,
                                      width: width * 0.05,
                                    ),
                                    SizedBox(
                                      width: width * 0.025,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/post/smile1.svg',
                                      fit: BoxFit.cover,
                                      width: width * 0.05,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: height * 0.001,
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      height: height * 0.45,
                      padding: spacing(
                        horizontal: width * 0.03,
                        vertical: 0,
                      ),
                      child: GridView.builder(
                        itemCount: 10,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 6 / 2,
                        ),
                        itemBuilder: (context, i) {
                          return postOptions[i];
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      padding: spacing(
                        horizontal: width * 0.05,
                        vertical: height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(
                          width * 0.02,
                        ),
                      ),
                      child: const Text(
                        'Publish',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
