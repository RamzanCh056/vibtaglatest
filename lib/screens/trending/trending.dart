import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/trending/widgets/hash_trend_widget.dart';
import 'package:vibetag/screens/trending/widgets/page_trend_widget.dart';
import 'package:vibetag/screens/trending/widgets/suggested_groups_trend_widget.dart';
import 'package:vibetag/screens/trending/widgets/tofollow_trend_widget.dart';
import 'package:vibetag/screens/trending/widgets/word_news_trend_widget.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import 'widgets/blog_trend_widget.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List<Widget> trendingWorldNews = [];
  List<Widget> trendingHashTag = [];
  List<Widget> trendingPopularBlogs = [];
  List<Widget> trendingToFollow = [];
  List<Widget> trendingPages = [];
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
    final data = {
      'type': 'trending_area_get_all',
      'user_id': loginUserId.toString(),
    };
    final result = await API().postData(data);
    getTrending = jsonDecode(result.body);

    if (getTrending['world_news'].length > 0) {
      for (var i = 0; i < getTrending['world_news'].length; i++) {
        if (getTrending['world_news'][i]['post_id'] != null) {
          trendingWorldNews.add(
            WordNewsTrend(
              context: context,
              worldnews: getTrending['world_news'][i],
            ),
          );
        }
      }
    }

    if (getTrending['trending_hashtags'].length > 0) {
      for (var i = 0; i < getTrending['trending_hashtags'].length; i++) {
        trendingHashTag.add(HashTrendWidget(
            hash: '#${getTrending['trending_hashtags'][i]['tag']}'));
      }
    }

    if (getTrending['popular_blogs_today'].length > 0) {
      for (var i = 0; i < getTrending['popular_blogs_today'].length; i++) {
        trendingPopularBlogs.add(
          blogTrendingWidget(
            context: context,
            blog: getTrending['popular_blogs_today'][i],
          ),
        );
      }
    }

    if (getTrending['people_to_follow'].length > 0) {
      for (var i = 0; i < getTrending['people_to_follow'].length; i++) {
        trendingToFollow.add(
          ToFollowTrendWidget(
            user: getTrending['people_to_follow'][i],
          ),
        );
      }
    }

    if (getTrending['pages_you_may_like'].length > 0) {
      for (var i = 0; i < getTrending['pages_you_may_like'].length; i++) {
        trendingPages.add(
          PagesTrendWidget(
            page: getTrending['pages_you_may_like'][i],
          ),
        );
      }
    }

    if (getTrending['groups_you_may_like'].length > 0) {
      for (var i = 0; i < getTrending['groups_you_may_like'].length; i++) {
        suggestedGroupsList.add(SuggestedGroupsTrend(
          group: getTrending['groups_you_may_like'][i],
        ));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
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
                      Header(
                      ),
                    ],
                  ),
                  Container(
                    height: height * 0.79,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: spacing(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.trending_up,
                                      color: orangePrimary,
                                      size: 40,
                                    ),
                                    gap(w: 5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'What is Trending on',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'World news',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: grayMed,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                gap(h: 10),
                                SingleChildScrollView(
                                  child: Column(
                                    children: trendingWorldNews,
                                  ),
                                ),
                                gap(h: 10),
                                const Text(
                                  'Trending',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                gap(h: 10),
                                Wrap(
                                  children: trendingHashTag,
                                ),
                                gap(h: 10),
                                const Text(
                                  'Popular Blogs Today',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                gap(h: 10),
                                Column(
                                  children: trendingPopularBlogs,
                                ),

                                gap(h: 15),
                                const Text(
                                  'People to follow',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                gap(h: 10),
                                //To Follow Widget
                                Column(
                                  children: trendingToFollow,
                                ),
                                gap(h: 15),
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
                                            'Page you may like',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            'See more',
                                            style: TextStyle(
                                              color: blue,
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
                                            'Suggested groups',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            'See more',
                                            style: TextStyle(
                                              color: blue,
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
                                      )
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
                                gap(h: 15),
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
                                            'Latest Products',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            'See more',
                                            style: TextStyle(
                                              color: blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                      gap(h: 10),
                                      Container(
                                        height: height * 0.52,
                                        width: double.maxFinite,
                                        child: GridView.builder(
                                            itemCount:
                                                getTrending['latest_products']
                                                    .length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 0.85,
                                            ),
                                            itemBuilder: (context, i) {
                                              return Container(
                                                margin: spacing(
                                                  horizontal: 5,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      borderRadius(12),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: height * 0.15,
                                                        width: width * 0.45,
                                                        child: Image.network(
                                                          getTrending['latest_products']
                                                                          [i]
                                                                      ['images']
                                                                  [0]['image']
                                                              .toString()
                                                              .trim(),
                                                          fit: BoxFit.cover,
                                                          width: width * 0.08,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: width * 0.45,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: white,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            gap(h: 5),
                                                            Container(
                                                              width:
                                                                  width * 0.35,
                                                              child: Text(
                                                                getTrending[
                                                                        'latest_products']
                                                                    [i]['name'],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\£${getTrending['latest_products'][i]['price_max']}',
                                                              style: TextStyle(
                                                                color:
                                                                    orangePrimary,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            gap(h: 5),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                gap(h: 15),
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
                                            Row(
                                              children: [
                                                const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                    'assets/images/streamer.jpg',
                                                  ),
                                                ),
                                                gap(w: 10),
                                                const Text(
                                                  'Sponsors',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: lightGray,
                                                borderRadius:
                                                    borderRadius(width),
                                              ),
                                              child: Icon(
                                                Icons.refresh,
                                                color: orangePrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      gap(h: 10),
                                      Container(
                                        width: double.maxFinite,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: height * 0.3,
                                                width: double.maxFinite,
                                                decoration: BoxDecoration(
                                                  color: lightGray,
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    width: width * 0.08,
                                                    height: width * 0.08,
                                                    child: SvgPicture.asset(
                                                      'assets/svg/photo.svg',
                                                      color: white,
                                                      width: width * 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.maxFinite,
                                                padding: spacing(
                                                  horizontal: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    gap(h: 10),
                                                    Container(
                                                      width: width * 0.8,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: const Text(
                                                        'Apple Watch Series',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Text(
                                                      'The most durable Apple Watch ever. Hard Knock',
                                                      style: TextStyle(
                                                        color: grayMed,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Apple.com',
                                                      style: TextStyle(
                                                        color: orangePrimary,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    gap(h: 15),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          gap(h: height * 0.02)
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
