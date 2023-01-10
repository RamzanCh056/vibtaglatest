import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.9,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                NavBar(),
                Header(
                  onTap: () {},
                ),
              ],
            ),
            Container(
              height: height * 0.75,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * 0.12,
                                height: width * 0.12,
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(5),
                                ),
                                child: SvgPicture.asset('assets/svg/photo.svg'),
                              ),
                              gap(
                                w: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    height: height * 0.045,
                                    child: const Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  gap(
                                    h: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'By',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        'World news',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        '4d',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                    ],
                                  ),
                                  gap(h: 7),
                                ],
                              )
                            ],
                          ),
                          gap(h: 10),
                          Container(
                            width: double.maxFinite,
                            color: grayMed,
                            height: 1.5,
                          ),
                          gap(h: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * 0.12,
                                height: width * 0.12,
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(5),
                                ),
                                child: SvgPicture.asset('assets/svg/photo.svg'),
                              ),
                              gap(
                                w: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    height: height * 0.045,
                                    child: const Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  gap(
                                    h: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'By',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        'World news',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        '4d',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                    ],
                                  ),
                                  gap(h: 7),
                                ],
                              )
                            ],
                          ),
                          gap(h: 10),
                          Container(
                            width: double.maxFinite,
                            color: grayMed,
                            height: 1.5,
                          ),
                          gap(h: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * 0.12,
                                height: width * 0.12,
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(5),
                                ),
                                child: SvgPicture.asset('assets/svg/photo.svg'),
                              ),
                              gap(
                                w: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    height: height * 0.045,
                                    child: const Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  gap(
                                    h: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'By',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        'World news',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        '4d',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                    ],
                                  ),
                                  gap(h: 7),
                                ],
                              )
                            ],
                          ),
                          gap(h: 10),
                          Container(
                            width: double.maxFinite,
                            color: grayMed,
                            height: 2,
                          ),
                          gap(h: 10),
                          const Text(
                            'Trending',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          gap(h: 10),
                          Container(
                            width: double.maxFinite,
                            height: height * 0.1,
                            child: GridView.builder(
                                itemCount: 5,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 2.5,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 2.5,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.trending_up,
                                              color: orangePrimary,
                                              size: 16,
                                            ),
                                            gap(w: 5),
                                            Text('#mmoexp',
                                                style: TextStyle(
                                                  color: orangePrimary,
                                                  fontSize: 10,
                                                )),
                                          ],
                                        ),
                                        Text(
                                          '44 posts',
                                          style: TextStyle(
                                            color: grayMed,
                                            fontSize: 8,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          gap(h: 10),
                          const Text(
                            'Popular Blogs Today',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          gap(h: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * 0.12,
                                height: width * 0.12,
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(5),
                                ),
                                child: SvgPicture.asset('assets/svg/photo.svg'),
                              ),
                              gap(
                                w: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    height: height * 0.045,
                                    child: const Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  gap(
                                    h: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'By',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        'World news',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        '4d',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                    ],
                                  ),
                                  gap(h: 7),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: orangePrimary,
                                      borderRadius: borderRadius(5),
                                    ),
                                    child: Text(
                                      '15k+views',
                                      style: TextStyle(
                                        color: whitePrimary,
                                        fontSize: 8,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          gap(h: 10),
                          Container(
                            width: double.maxFinite,
                            color: grayMed,
                            height: 1.5,
                          ),
                          gap(h: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * 0.12,
                                height: width * 0.12,
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(5),
                                ),
                                child: SvgPicture.asset('assets/svg/photo.svg'),
                              ),
                              gap(
                                w: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    height: height * 0.045,
                                    child: const Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  gap(
                                    h: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'By',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        'World news',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        '4d',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                    ],
                                  ),
                                  gap(h: 7),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: orangePrimary,
                                      borderRadius: borderRadius(5),
                                    ),
                                    child: Text(
                                      '15k+views',
                                      style: TextStyle(
                                        color: whitePrimary,
                                        fontSize: 8,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          gap(h: 10),
                          Container(
                            width: double.maxFinite,
                            color: grayMed,
                            height: 2,
                          ),
                          gap(h: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * 0.12,
                                height: width * 0.12,
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(5),
                                ),
                                child: SvgPicture.asset('assets/svg/photo.svg'),
                              ),
                              gap(w: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width * 0.7,
                                    height: height * 0.045,
                                    child: const Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  gap(h: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'By',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        'World news',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                      ),
                                      gap(w: 7),
                                      Text(
                                        '4d',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: grayMed,
                                        ),
                                      ),
                                    ],
                                  ),
                                  gap(h: 7),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: orangePrimary,
                                      borderRadius: borderRadius(5),
                                    ),
                                    child: Text(
                                      '15k+views',
                                      style: TextStyle(
                                        color: whitePrimary,
                                        fontSize: 8,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          gap(h: 10),
                          Container(
                            width: double.maxFinite,
                            color: grayMed,
                            height: 1.5,
                          ),
                          gap(h: 15),
                          const Text(
                            'People to follow',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          gap(h: 10),
                          Container(
                            width: double.maxFinite,
                            height: height * 0.4,
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: width * 0.12,
                                          height: width * 0.12,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: SvgPicture.asset(
                                              'assets/svg/photo.svg'),
                                        ),
                                        gap(
                                          w: 10,
                                        ),
                                        Container(
                                          width: width * 0.7,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: const Text(
                                                      'Madilyn Schiller',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '@abins_204',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: grayMed,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding: spacing(
                                                  horizontal: 15,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: orangePrimary,
                                                  borderRadius: borderRadius(5),
                                                ),
                                                child: Text(
                                                  'Follow',
                                                  style: TextStyle(
                                                    color: whitePrimary,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    gap(h: 10),
                                    Container(
                                      width: double.maxFinite,
                                      color: grayMed,
                                      height: 1.5,
                                    ),
                                    gap(h: 10),
                                  ],
                                );
                              }),
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
                                Container(
                                  height: height * 0.25,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: spacing(
                                            horizontal: 5,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height * 0.15,
                                                width: width * 0.7,
                                                decoration: BoxDecoration(
                                                  color: lightGray,
                                                  borderRadius:
                                                      borderRadius(10),
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    height: width * 0.07,
                                                    width: width * 0.07,
                                                    child: SvgPicture.asset(
                                                      'assets/svg/photo.svg',
                                                      color: white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              gap(h: 7),
                                              Container(
                                                width: width * 0.7,
                                                padding: spacing(
                                                  horizontal: 5,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child:
                                                              const CircleAvatar(
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'assets/images/streamer.jpg'),
                                                          ),
                                                        ),
                                                        gap(w: 10),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Car love..',
                                                              style: TextStyle(
                                                                color:
                                                                    blackPrimary,
                                                                fontSize: 12,
                                                                overflow:
                                                                    TextOverflow
                                                                        .clip,
                                                              ),
                                                            ),
                                                            Text(
                                                              '4563 people like this',
                                                              style: TextStyle(
                                                                color: blue,
                                                                fontSize: 8,
                                                              ),
                                                            ),
                                                            gap(h: 3),
                                                            Text(
                                                              'Live Style',
                                                              style: TextStyle(
                                                                color: grayMed,
                                                                fontSize: 8,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      padding: spacing(
                                                        horizontal: 15,
                                                        vertical: 5,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: orangePrimary,
                                                        borderRadius:
                                                            borderRadius(5),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Like page',
                                                            style: TextStyle(
                                                              color:
                                                                  whitePrimary,
                                                              fontSize: 8,
                                                            ),
                                                          ),
                                                          gap(w: 5),
                                                          Icon(
                                                            Icons.thumb_up,
                                                            color: white,
                                                            size: 12,
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
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
                                Container(
                                  height: height * 0.3,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: spacing(
                                            horizontal: 5,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height * 0.2,
                                                width: width * 0.3,
                                                decoration: BoxDecoration(
                                                  color: lightGray,
                                                  borderRadius:
                                                      borderRadius(15),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      borderRadius(15),
                                                  child: Image.asset(
                                                    'assets/images/cover.jpg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              gap(h: 7),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  gap(h: 5),
                                                  const Text(
                                                    'Fitness goals',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  gap(h: 5),
                                                  Container(
                                                    width: width * 0.3,
                                                    child: Container(
                                                      padding: spacing(
                                                        horizontal: 15,
                                                        vertical: 5,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: orangePrimary,
                                                        borderRadius:
                                                            borderRadius(5),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Join',
                                                            style: TextStyle(
                                                              color:
                                                                  whitePrimary,
                                                              fontSize: 8,
                                                            ),
                                                          ),
                                                          gap(w: 2.5),
                                                          Icon(
                                                            Icons.add,
                                                            color: white,
                                                            size: 16,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
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
                                      contentPadding: const EdgeInsets.only(
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
                                Container(
                                  height: height * 0.52,
                                  width: double.maxFinite,
                                  child: GridView.builder(
                                      itemCount: 4,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.85,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: spacing(
                                            horizontal: 5,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: borderRadius(12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: height * 0.15,
                                                  width: width * 0.45,
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
                                                  width: width * 0.45,
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
                                                    children: [
                                                      gap(h: 5),
                                                      Container(
                                                        width: width * 0.35,
                                                        child: const Text(
                                                          'Volve Break Hose - Rear Left Or',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      Text(
                                                        '£9.70',
                                                        style: TextStyle(
                                                          color: orangePrimary,
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
                                          borderRadius: borderRadius(width),
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
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              gap(h: 10),
                                              Container(
                                                width: width * 0.8,
                                                alignment: Alignment.centerLeft,
                                                child: const Text(
                                                  'Apple Watch Series',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
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
                    AppFooter(),
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
