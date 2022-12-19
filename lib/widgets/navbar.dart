import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
              Container(
                alignment: Alignment.topLeft,
                height: height * 0.04,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                ),
                child: Image.asset('assets/images/logo.png'),
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
                          myVibePop(
                            context: context,
                          );
                        },
                        child: Container(
                          padding: spacing(
                            horizontal: 7,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: grayPrimary,
                            borderRadius: borderRadius(width),
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
                          setupPop(
                            context: context,
                          );
                        },
                        child: Container(
                          padding: spacing(
                            horizontal: 7,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: grayPrimary,
                            borderRadius: borderRadius(width),
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
                  width: width * 0.15,
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.045,
                        child: Image.asset('assets/new/icons/notification.png'),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Container(
                        width: width * 0.06,
                        child: Image.asset('assets/new/icons/profile.png'),
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
