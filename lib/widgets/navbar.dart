import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/front.dart';
import 'package:vibetag/widgets/setup_pop.dart';

import '../utils/constant.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.05,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  pushReplacement(
                    context: context,
                    screen: const FrontPage(),
                  );
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  height: height * 0.04,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.01,
                  ),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          MyVibes(context: context);
                        },
                        child: Container(
                          padding: spacing(
                            horizontal: 7,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(width),
                            color: HexColor('#3D3D3D'),
                          ),
                          child: const Text(
                            'My Vibes',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          SetUpPopUp(context: context);
                        },
                        child: Container(
                          padding: spacing(
                            horizontal: 7,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(width),
                            color: HexColor('#3D3D3D'),
                          ),
                          child: const Text(
                            'Set up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: width * 0.07,
                              padding: spacing(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: borderRadius(width),
                                color: HexColor('#3D3D3D'),
                              ),
                              child: Image.asset(
                                  'assets/new/icons/notification.png'),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              'assets/new/icons/active_n.png',
                              width: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: width * 0.07,
                              padding: spacing(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: borderRadius(width),
                                color: HexColor('#3D3D3D'),
                              ),
                              child: Image.asset(
                                'assets/new/icons/profile.png',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              'assets/new/icons/active_n.png',
                              width: 15,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
