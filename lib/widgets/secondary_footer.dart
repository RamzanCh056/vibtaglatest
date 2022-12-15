import 'package:flutter/material.dart';
import 'package:vibetag/screens/help_support/help_support.dart';

import '../utils/constant.dart';

class SecondaryFooter extends StatelessWidget {
  const SecondaryFooter({super.key});

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              InkWell(
                onTap: () {
                  pushRoute(
                    context: context,
                    screen: const HelpAndSupport(),
                  );
                },
                child: Container(
                  width: width * 0.2,
                  child: const Text(
                    'Find Help & support',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
