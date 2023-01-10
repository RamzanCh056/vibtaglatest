import 'package:flutter/material.dart';

import 'package:vibetag/screens/drawer/drawer.dart';

import '../../utils/constant.dart';

class Buzzin extends StatefulWidget {
  const Buzzin({super.key});

  @override
  State<Buzzin> createState() => _BuzzinState();
}

class _BuzzinState extends State<Buzzin> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: darkGray,
      drawer: DrawerMenu(),
      key: _key,
      body: Container(
        width: width,
        height: height * 0.87,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/new/images/streaming.png',
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: Container(
                width: width,
                padding: spacing(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.08,
                      height: width * 0.08,
                      child: Image.asset(
                        'assets/new/images/back.png',
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.08,
                          height: width * 0.08,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(width),
                          ),
                          child: Image.asset(
                            'assets/new/images/camera.png',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/new/images/profile.png',
                          width: width * 0.08,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Container(
                width: width * 0.95,
                padding: spacing(
                  horizontal: 2,
                  vertical: 2,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/new/images/border.png',
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                padding: spacing(
                                  horizontal: 2,
                                  vertical: 2,
                                ),
                                decoration: const BoxDecoration(),
                                child: Container(
                                  padding: spacing(
                                    horizontal: 3,
                                    vertical: 3,
                                  ),
                                  child: CircleAvatar(
                                    foregroundImage:
                                        AssetImage('assets/new/images/7.png'),
                                    radius: width * 0.07,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gwen Stacy',
                              style: TextStyle(
                                color: white,
                                fontSize: textSm,
                              ),
                            ),
                            Text(
                              'Lorem #Friends #Dance ...more',
                              style: TextStyle(
                                color: white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: width * 0.57,
                      padding: spacing(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(76, 255, 255, 255),
                        borderRadius: borderRadius(width),
                        border: Border.all(
                          width: 1,
                          color: whitePrimary,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/new/icons/music.png',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: width * 0.4,
                              child: Text(
                                'Really good stuff....Its amazing!',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 10,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.07,
                    child: Image.asset(
                      'assets/new/icons/heart.png',
                      color: whitePrimary,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '12k',
                    style: TextStyle(
                      color: whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: width * 0.07,
                    child: Image.asset(
                      'assets/new/icons/chat_t.png',
                      color: whitePrimary,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '12k',
                    style: TextStyle(
                      color: whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: width * 0.06,
                    child: Image.asset(
                      'assets/new/icons/revibe.png',
                      color: whitePrimary,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '12k',
                    style: TextStyle(
                      color: whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/new/icons/more_h.png',
                      color: whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/new/images/roller.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
