import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

class FindVibes extends StatefulWidget {
  const FindVibes({super.key});

  @override
  State<FindVibes> createState() => _FindVibesState();
}

class _FindVibesState extends State<FindVibes> {
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
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.87,
                  margin: spacing(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Trending Vibes',
                            style: TextStyle(
                              color: HexColor('#BEBEBE'),
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          margin: spacing(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: width * 0.25,
                                height: height * 0.25,
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
                                        'Ilizabat Bab',
                                        style: TextStyle(
                                          color: HexColor('#BEBEBE'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Beauty',
                                style: TextStyle(
                                  color: HexColor('#A1A1A1'),
                                ),
                              ),
                              Text(
                                'Show all',
                                style: TextStyle(
                                  color: HexColor('#0000FF'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: height * 0.15,
                              margin: spacing(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#333333'),
                                borderRadius: borderRadius(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: HexColor('#151515'),
                                            borderRadius: borderRadius(20),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Lucille Mcmalan',
                                          style: TextStyle(
                                            color: HexColor('#A1A1A1'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.thumb_up,
                                  color: Colors.orange,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Must Watch',
                                  style: TextStyle(
                                    color: HexColor('#A1A1A1'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.thumb_up,
                                  color: Colors.orange,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: height * 0.15,
                              margin: spacing(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#333333'),
                                borderRadius: borderRadius(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: HexColor('#151515'),
                                            borderRadius: borderRadius(20),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Lucille Mcmalan',
                                          style: TextStyle(
                                            color: HexColor('#A1A1A1'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'British Revert G...',
                                  style: TextStyle(
                                    color: HexColor('#A1A1A1'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: height * 0.15,
                              margin: spacing(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#333333'),
                                borderRadius: borderRadius(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: HexColor('#151515'),
                                            borderRadius: borderRadius(20),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Lucille Mcmalan',
                                          style: TextStyle(
                                            color: HexColor('#A1A1A1'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              'Why I converted to ',
                              style: TextStyle(
                                color: HexColor('#A1A1A1'),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          padding: spacing(
                            horizontal: width * 0.05,
                            vertical: height * 0.03,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: width * 0.25,
                                    child: const Text(
                                      'Market Place Terms',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.2,
                                    child: const Text(
                                      'Your Wishlist',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: width * 0.2,
                                    child: const Text(
                                      'Refund Policy',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.2,
                                    child: const Text(
                                      'On Sale Items',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: width * 0.2,
                                    child: const Text(
                                      'Start Selling',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.2,
                                    child: const Text(
                                      'Find Help & support',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        AppFooter()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
