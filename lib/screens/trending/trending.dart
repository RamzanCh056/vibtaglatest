import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/trending/widgets/hash_trend_widget.dart';
import 'package:vibetag/screens/trending/widgets/lastest_videos_widget.dart';
import 'package:vibetag/screens/trending/widgets/page_trend_widget.dart';
import 'package:vibetag/screens/trending/widgets/suggested_groups_trend_widget.dart';
import 'package:vibetag/screens/trending/widgets/tofollow_trend_widget.dart';
import 'package:vibetag/screens/trending/widgets/trend_activities.dart';
import 'package:vibetag/screens/trending/widgets/trend_latest_products.dart';
import 'package:vibetag/screens/trending/widgets/trend_sponsor_widget.dart';
import 'package:vibetag/screens/trending/widgets/word_news_trend_widget.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import 'widgets/blog_trend_widget.dart';
import 'widgets/trending_post.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List<Widget> trendingWorldNews = [];
  List<Widget> trendingHashTag = [];
  List<Widget> trendingPopularBlogs = [];
  List<Widget> trendingPopularArticles = [];
  List<Widget> trendingToFollow = [];
  List<Widget> trendingPages = [];
  List<Widget> trendActivities = [];
  List<Widget> trendVideos = [];
  List<Widget> trendProducts = [];
  List<Widget> trendVibesToday = [];
  List<Widget> suggestedGroupsList = [];
  List<dynamic> latestProduct = [];
  Map<String, dynamic> getTrending = {};

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getTrendingData();
  }

  getTrendingData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('trending') == null) {
      final data = {
        'type': 'trending_area_get_all',
        'user_id': loginUserId.toString(),
      };
      final result = await API().postData(data);
      getTrending = jsonDecode(result.body);
      String trending = jsonEncode(getTrending);
      pref.setString('trending', trending);
    } else {
      getTrending = jsonDecode(pref.getString('trending')!);
    }
    setTrending();

    setState(() {
      isLoading = false;
    });

    if (pref.getString('trending') != null) {
      final data = {
        'type': 'trending_area_get_all',
        'user_id': loginUserId.toString(),
      };
      final result = await API().postData(data);
      getTrending = jsonDecode(result.body);
      String trending = jsonEncode(getTrending);
      pref.setString('trending', trending);
      setTrending();
      setState(() {});
    }
  }

  setTrending() {
    for (var product in getTrending['latest_products']) {
      trendProducts.add(
        TrendProductWidget(product: product),
      );
    }

    for (var post in getTrending['world_news']) {
      if (post['post_id'] != null) {
        trendingWorldNews.add(
          WordNewsTrend(
            context: context,
            worldnews: post,
          ),
        );
      }
    }

    for (var tag in getTrending['trending_hashtags']) {
      trendingHashTag.add(HashTrendWidget(hash: tag['tag']));
    }

    for (var video in getTrending['latest_videos']) {
      trendVideos.add(TrendLatestVideos(video: video));
    }
    for (var vibe in getTrending['popular_vibes_today']) {
      trendVibesToday.add(
        TrendPostWidget(
          post: vibe,
        ),
      );
    }

    for (var activity in getTrending['popular_articles']) {
      trendingPopularArticles.add(
        blogTrendingWidget(
          context: context,
          blog: activity,
        ),
      );
    }
    for (var blog in getTrending['popular_blogs_today']) {
      trendingPopularBlogs.add(
        blogTrendingWidget(
          context: context,
          blog: blog,
        ),
      );
    }

    for (var people in getTrending['people_to_follow']) {
      trendingToFollow.add(
        ToFollowTrendWidget(
          user: people,
        ),
      );
    }

    for (var page in getTrending['pages_you_may_like']) {
      trendingPages.add(
        PagesTrendWidget(
          page: page,
        ),
      );
    }

    for (var group in getTrending['groups_you_may_like']) {
      suggestedGroupsList.add(SuggestedGroupsTrend(
        group: group,
      ));
    }

    for (var activity in getTrending['activities']) {
      trendActivities.add(
        TrendActivitiesWidget(
          activity: activity,
        ),
      );
    }
    trendActivities.add(
      gap(h: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    print('++++++++++++Login User Id+++++++++++++++++++');
    print(loginUserId);
    return isLoading
        ? loadingSpinner()
        : Container(
            height: height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      NavBar(),
                      Header(),
                    ],
                  ),
                  Container(
                    height: height * 0.79,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: spacing(
                              horizontal: 7,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'World News',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                gap(h: 10),
                                SingleChildScrollView(
                                  child: Column(
                                    children: trendingWorldNews,
                                  ),
                                ),
                                gap(h: 10),
                                const Text(
                                  'Hashtags',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                gap(h: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: trendingHashTag,
                                  ),
                                ),
                                gap(h: 10),
                                const Text(
                                  'Popular Vibes Today',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                gap(h: 10),
                                LatestPostSlider(
                                  posts: trendVibesToday,
                                ),
                                gap(h: 10),
                                Container(
                                  width: double.maxFinite,
                                  height: 1,
                                  color: grayMed,
                                ),
                                gap(h: 10),
                                const Text(
                                  'Popular Blogs Today',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                gap(h: 10),
                                SingleChildScrollView(
                                  child: Column(
                                    children: trendingPopularBlogs,
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  width: double.maxFinite,
                                  height: 1,
                                  color: grayMed,
                                ),
                                gap(h: 10),
                                const Text(
                                  'Most Recent Articles',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                gap(h: 10),
                                SingleChildScrollView(
                                  child: Column(
                                    children: trendingPopularArticles,
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  width: double.maxFinite,
                                  height: 1,
                                  color: grayMed,
                                ),
                                gap(h: 10),
                                Container(
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(7),
                                    color: white,
                                  ),
                                  child: Column(
                                    children: [
                                      gap(h: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Page you may like',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Container(
                                            padding: spacing(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius(width),
                                              border: Border.all(
                                                width: 2,
                                                color: grayMed,
                                              ),
                                            ),
                                            child: Text(
                                              'See all',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      gap(h: 10),
                                      //Page you maye like
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: trendingPages,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                gap(h: 15),
                                Container(
                                  width: double.maxFinite,
                                  height: 1,
                                  color: grayMed,
                                ),
                                gap(h: 10),
                                Container(
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(7),
                                    color: white,
                                  ),
                                  child: Column(
                                    children: [
                                      gap(h: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Suggested groups',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Container(
                                            padding: spacing(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius(width),
                                              border: Border.all(
                                                width: 2,
                                                color: grayMed,
                                              ),
                                            ),
                                            child: Text(
                                              'See all',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      gap(h: 10),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: suggestedGroupsList,
                                        ),
                                      ),
                                      gap(h: 10),
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                const Text(
                                  'Invite your friends',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  width: double.maxFinite,
                                  height: height * 0.05,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.maxFinite,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Email here...',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: grayMed,
                                              ),
                                              borderRadius: borderRadius(width),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(
                                              top: 0,
                                              left: 10,
                                              bottom: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        top: 0,
                                        right: 0,
                                        child: Center(
                                          child: Container(
                                            width: width * 0.08,
                                            height: width * 0.08,
                                            padding: spacing(
                                              horizontal: width * 0.02,
                                              vertical: width * 0.02,
                                            ),
                                            margin: spacing(
                                              horizontal: width * 0.01,
                                              vertical: width * 0.01,
                                            ),
                                            decoration: BoxDecoration(
                                              color: orangePrimary,
                                              borderRadius: borderRadius(width),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/new/svg/right-arrow.svg',
                                              width: width * 0.07,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(7),
                                  ),
                                  child: Column(
                                    children: [
                                      gap(h: 25),

                                      // Container(
                                      //   margin: spacing(horizontal: 7),
                                      //   padding: spacing(
                                      //     horizontal: 7,
                                      //     vertical: 10,
                                      //   ),
                                      //   width: double.maxFinite,
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       const Text(
                                      //         'Trending Post',
                                      //         style: TextStyle(
                                      //           fontSize: 16,
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         padding: spacing(
                                      //             horizontal: 15, vertical: 5),
                                      //         decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               borderRadius(width),
                                      //           border: Border.all(
                                      //             width: 2,
                                      //             color: grayMed,
                                      //           ),
                                      //         ),
                                      //         child: Text(
                                      //           'See all',
                                      //           style: TextStyle(
                                      //             fontSize: 12,
                                      //             color: grayMed,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // gap(h: 10),
                                      // SingleChildScrollView(
                                      //   scrollDirection: Axis.horizontal,
                                      //   child: Row(
                                      //     children: trendVideos,
                                      //   ),
                                      // ),
                                      // gap(h: 25),
                                      Container(
                                        width: width * 0.9,
                                        height: height * 0.12,
                                        padding: spacing(horizontal: 15),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              HexColor('#FFE08A'),
                                              HexColor('#FFF0C8'),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius: borderRadius(7),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: spaceOnly(top: 25),
                                              height: height * 0.12,
                                              child: Text(
                                                'Get your friend to join your spark',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                            Image.asset('assets/invite.png'),
                                          ],
                                        ),
                                      ),
                                      gap(h: 25)
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(7),
                                    color: whiteGray,
                                  ),
                                  child: Column(
                                    children: [
                                      gap(h: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Trending Products',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Container(
                                            padding: spacing(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius(width),
                                              border: Border.all(
                                                width: 2,
                                                color: grayMed,
                                              ),
                                            ),
                                            child: Text(
                                              'See all',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      gap(h: 10),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: trendProducts,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  color: white,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: spacing(horizontal: 7),
                                        padding: spacing(
                                          horizontal: 7,
                                          vertical: 10,
                                        ),
                                        width: double.maxFinite,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'People to follow',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: spacing(
                                                  horizontal: 15, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    borderRadius(width),
                                                border: Border.all(
                                                  width: 2,
                                                  color: grayMed,
                                                ),
                                              ),
                                              child: Text(
                                                'See all',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: grayMed,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      gap(h: 10),
                                      //To Follow Widget
                                      SingleChildScrollView(
                                        child: Column(
                                          children: trendingToFollow,
                                        ),
                                      ),
                                      gap(h: 15),
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(7),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: spacing(horizontal: 7),
                                        padding: spacing(
                                          horizontal: 7,
                                          vertical: 10,
                                        ),
                                        width: double.maxFinite,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Based on your interest',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: spacing(
                                                  horizontal: 15, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    borderRadius(width),
                                                border: Border.all(
                                                  width: 2,
                                                  color: grayMed,
                                                ),
                                              ),
                                              child: Text(
                                                'See all',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: grayMed,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      gap(h: 10),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: trendVideos,
                                        ),
                                      ),
                                      gap(h: 25)
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(10),
                                    color: whiteGray,
                                  ),
                                  child: Column(
                                    children: [
                                      gap(h: 10),
                                      Container(
                                        padding: spacing(horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Sponsored',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: spacing(
                                                  horizontal: 15, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    borderRadius(width),
                                                border: Border.all(
                                                  width: 2,
                                                  color: grayMed,
                                                ),
                                              ),
                                              child: Text(
                                                'See all',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: grayMed,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      gap(h: 10),
                                      TrendAdsBanner(
                                        ads: getTrending['ads'],
                                      ),
                                      gap(h: 10),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: white,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: spacing(horizontal: 7),
                                        padding: spacing(
                                          horizontal: 7,
                                          vertical: 10,
                                        ),
                                        width: double.maxFinite,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Latest Activity',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: spacing(
                                                  horizontal: 15, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    borderRadius(width),
                                                border: Border.all(
                                                  width: 2,
                                                  color: grayMed,
                                                ),
                                              ),
                                              child: Text(
                                                'See all',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: grayMed,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: trendActivities,
                                      ),
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                              ],
                            ),
                          ),
                          gap(h: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
