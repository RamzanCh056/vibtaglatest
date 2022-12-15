import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class PlayLists extends StatefulWidget {
  const PlayLists({super.key});

  @override
  State<PlayLists> createState() => _PlayListsState();
}

class _PlayListsState extends State<PlayLists> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: _key,
      backgroundColor: HexColor('#323232'),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NavBar(),
                    Header(onTap: () {
                      _key.currentState!.openDrawer();
                    })
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: width,
                  height: height * 0.8,
                  margin: spacing(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: spacing(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Trendy',
                                style: TextStyle(
                                  color: darkGray,
                                  fontSize: textSm,
                                ),
                              ),
                            ),
                            Container(
                              margin: spacing(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'See more',
                                style: TextStyle(
                                  color: blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: width,
                          height: height * 0.27,
                          margin: spacing(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: width * 0.27,
                                height: height * 0.27,
                                margin: spacing(horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(
                                    10,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.2,
                                      child: ClipRRect(
                                        borderRadius: borderRadius(
                                          10,
                                        ),
                                        child: Image.asset(
                                          'assets/images/streamer.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.maxFinite,
                                      child: Text(
                                        'Lorem Ipsum Dolor Dash',
                                        style: TextStyle(
                                          color: darkGray,
                                          overflow: TextOverflow.clip,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: spacing(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Most Viewed',
                                style: TextStyle(
                                  color: darkGray,
                                  fontSize: textSm,
                                ),
                              ),
                            ),
                            Container(
                              margin: spacing(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'See more',
                                style: TextStyle(
                                  color: blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: width,
                          height: height * 0.27,
                          margin: spacing(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: width * 0.27,
                                height: height * 0.27,
                                margin: spacing(horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(
                                    10,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.2,
                                      child: ClipRRect(
                                        borderRadius: borderRadius(
                                          10,
                                        ),
                                        child: Image.asset(
                                          'assets/images/streamer.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.maxFinite,
                                      child: Text(
                                        'Lorem Ipsum Dolor Dash',
                                        style: TextStyle(
                                          color: darkGray,
                                          overflow: TextOverflow.clip,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: spacing(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Lorem Ipsum',
                                style: TextStyle(
                                  color: darkGray,
                                  fontSize: textSm,
                                ),
                              ),
                            ),
                            Container(
                              margin: spacing(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'See more',
                                style: TextStyle(
                                  color: blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: width,
                          height: height * 0.27,
                          margin: spacing(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: width * 0.55,
                                height: height * 0.2,
                                margin: spacing(horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(
                                    10,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius(10),
                                        color: darkGray,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: double.maxFinite,
                                      child: Text(
                                        'Lorem Ipsum Dolor Dash',
                                        style: TextStyle(
                                          color: darkGray,
                                          overflow: TextOverflow.clip,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SecondaryFooter(),
                const AppFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
