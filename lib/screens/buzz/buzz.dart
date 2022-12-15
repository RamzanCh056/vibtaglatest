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
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Container(
                  width: width * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_left,
                            color: white,
                            size: 32,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Buzzin',
                            style: TextStyle(
                              color: white,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/images/buzzin.gif',
                        width: width * 0.06,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  width: width * 0.95,
                  padding: spacing(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: spacing(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: medGray,
                              borderRadius: borderRadius(width * 0.1),
                            ),
                            child: CircleAvatar(
                              backgroundColor: accent,
                              radius: width * 0.07,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Vibetv',
                            style: TextStyle(
                              color: white,
                              fontSize: textSm,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: medGray,
                                borderRadius: borderRadius(width * 0.1),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Like',
                            style: TextStyle(
                              color: white,
                              fontSize: textSm,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.thumb_up_alt,
                            color: white,
                            size: 24,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'This dance is a vibe #vibetv',
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: white,
                          ),
                          Text(
                            '4k+',
                            style: TextStyle(
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.message,
                            color: white,
                          ),
                          Text(
                            '2k',
                            style: TextStyle(
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.speaker,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            '2M+ Views',
                            style: TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.more_vert_outlined,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
