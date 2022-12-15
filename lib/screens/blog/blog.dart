import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/blog/recent.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/search_bar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      drawer: DrawerMenu(),
      key: _key,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                    )
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.79,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(12),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: width,
                                height: height * 0.3,
                                color: accent,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                height: height * 0.16,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.2,
                                      child: CircleAvatar(
                                        backgroundColor: darkGray,
                                        radius: width * 0.07,
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.65,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Breaking News',
                                                        style: TextStyle(
                                                          fontSize: textSm,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        width: 5,
                                                        height: 5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: accent,
                                                          borderRadius:
                                                              borderRadius(5),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Follow',
                                                          style: TextStyle(
                                                            color: blue,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    '1 min',
                                                    style: TextStyle(
                                                      fontSize: textXSm,
                                                      color: darkGray,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ],
                                              ),
                                              const Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: double.maxFinite,
                                            child: const Text(
                                              'UFO hearing: Number of \"Unidentified Aerial Phenomenon\" sighting rising, US says',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: double.maxFinite,
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: spacing(
                                                    horizontal: 3,
                                                    vertical: 3,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: medGray,
                                                    borderRadius:
                                                        borderRadius(30),
                                                  ),
                                                  child: const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                    size: 16,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  'Celestino, Aurelle and 3k+ others (s)',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: width,
                                height: 1,
                                color: darkGray,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: spacing(
                                  horizontal: width * 0.01,
                                  vertical: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          child: Image.asset(
                                            'assets/icons/like1.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Column(
                                          children: const [
                                            Text(
                                              'Likes',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '465',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          child: Image.asset(
                                            'assets/icons/comment1.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Column(
                                          children: const [
                                            Text(
                                              'Comments',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '321',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          child: Image.asset(
                                            'assets/icons/revibe1.png',
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Column(
                                          children: const [
                                            Text(
                                              'Revibed',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '212',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: spacing(horizontal: width * 0.05),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'You may like',
                            style: TextStyle(
                              color: darkGray,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: height * 0.7,
                          padding: spacing(horizontal: width * 0.05),
                          alignment: Alignment.centerLeft,
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: width * 0.95,
                                  height: height * 0.3,
                                  margin: spacing(
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: medGray,
                                    borderRadius: borderRadius(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            width: double.maxFinite,
                                            height: height * 0.09,
                                            decoration: BoxDecoration(
                                              color: white,
                                            ),
                                            padding: spacing(
                                              horizontal: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: width * 0.12,
                                                  height: width * 0.12,
                                                  decoration: BoxDecoration(
                                                    color: darkGray,
                                                    borderRadius:
                                                        borderRadius(width),
                                                  ),
                                                ),
                                                Container(
                                                  width: width * 0.7,
                                                  height: width * 0.14,
                                                  padding: spacing(
                                                    horizontal: 10,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: const Text(
                                                          'They Told Carlton he...',
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'By Wills Larkin 2 yrs',
                                                          style: TextStyle(
                                                            color: darkGray,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: width * 0.25,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: orange,
                                                          borderRadius:
                                                              borderRadius(5),
                                                        ),
                                                        padding: spacing(
                                                          vertical: 3,
                                                        ),
                                                        child: Text(
                                                          '4M+ views',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                SecondaryFooter(),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
