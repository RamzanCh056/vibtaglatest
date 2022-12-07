import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/constant.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.05,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: height * 0.04,
                width: width * 0.5,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                ),
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
          Container(
            width: width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: width * 0.28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Vibes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Text(
                        'Set up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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
                        child: Image.asset('assets/icons/notification.png'),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Container(
                        width: width * 0.06,
                        child: Image.asset('assets/icons/new-requests.png'),
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
