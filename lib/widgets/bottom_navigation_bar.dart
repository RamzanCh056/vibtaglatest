import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/buzz/buzz.dart';
import '../screens/drawer/bottom_modal_sheet.dart';
import '../screens/profile/profile.dart';
import '../screens/shop/market/market.dart';
import '../screens/shop/shop.dart';
import '../screens/trending/trending.dart';
import '../utils/constant.dart';

Widget AppBottomNavigationBar(
    {required BuildContext context, required int currentIndex,required int}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);

  return StatefulBuilder(
    builder: (context, setState) => Container(
      height: height * 0.1,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset.zero,
            color: Color.fromARGB(75, 0, 0, 0),
            blurRadius: 5,
            spreadRadius: 0.5,
          )
        ],
      ),
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: Column(
                children: [
                  Container(
                    height: height * 0.035,
                    child: SvgPicture.asset(
                      'assets/new/svg/home.svg',
                      color: currentIndex == 0 ? orangePrimary : grayMed,
                    ),
                  ),
                  gap(h: 10),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: currentIndex == 0 ? orangePrimary : grayMed,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child: Column(
                children: [
                  Container(
                    height: height * 0.035,
                    child: SvgPicture.asset(
                      'assets/new/svg/trending.svg',
                      color: currentIndex == 1 ? orangePrimary : grayMed,
                    ),
                  ),
                  gap(h: 10),
                  Text(
                    'Trending',
                    style: TextStyle(
                      color: currentIndex == 1 ? orangePrimary : grayMed,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child: Column(
                children: [
                  Container(
                    height: height * 0.035,
                    child: SvgPicture.asset(
                      'assets/new/svg/buzzin.svg',
                      color: currentIndex == 2 ? orangePrimary : grayMed,
                    ),
                  ),
                  gap(h: 10),
                  Text(
                    'Buzzin',
                    style: TextStyle(
                      color: currentIndex == 2 ? orangePrimary : grayMed,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              child: Column(
                children: [
                  Container(
                    height: height * 0.035,
                    child: SvgPicture.asset(
                      'assets/new/svg/shopping.svg',
                      color: currentIndex == 3 ? orangePrimary : grayMed,
                    ),
                  ),
                  gap(h: 10),
                  Text(
                    'Store',
                    style: TextStyle(
                      color: currentIndex == 3 ? orangePrimary : grayMed,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // setState(() {
                //   currentIndex = 4;
                // });
                BottomDrawer(context: context);
              },
              child: Column(
                children: [
                  Container(
                    height: height * 0.035,
                    child: SvgPicture.asset(
                      'assets/new/svg/category.svg',
                      color: currentIndex == 4 ? orangePrimary : grayMed,
                    ),
                  ),
                  gap(h: 10),
                  Text(
                    'More',
                    style: TextStyle(
                      color: currentIndex == 4 ? orangePrimary : grayMed,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
