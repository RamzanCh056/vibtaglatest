import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/utils/constant.dart';
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
              height: height * 0.712,
              margin: spacing(
                horizontal: 15,
                vertical: 15,
              ),
              child: SingleChildScrollView(
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'World news',
                              style: TextStyle(
                                fontSize: 14,
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
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
                    gap(h: 15),
                    Text('People to follow'),
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
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '@abins_204',
                                              style: TextStyle(
                                                fontSize: 14,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Page you may like'),
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
                      decoration: BoxDecoration(
                        color: grayLight,
                      ),
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
                                    decoration: BoxDecoration(
                                      color: grayMed,
                                      borderRadius: borderRadius(10),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
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
