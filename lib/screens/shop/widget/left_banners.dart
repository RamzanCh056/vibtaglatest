// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:vibetag/screens/shop/widget/new_arrival_slide.dart';
import 'package:vibetag/utils/constant.dart';

class LeftBanners extends StatefulWidget {
  final List<dynamic> leftBanners;
  const LeftBanners({
    Key? key,
    required this.leftBanners,
  }) : super(key: key);

  @override
  State<LeftBanners> createState() => _LeftBannersState();
}

class _LeftBannersState extends State<LeftBanners> {
  PageController pageController = PageController();
  List<Widget> banners = [];
  int currentBanner = 0;
  @override
  void initState() {
    super.initState();
    setLeftBanner();
  }

  setLeftBanner() {
    for (var banner in widget.leftBanners) {
      banners.add(
        InkWell(
          onTap: () {
            launchUrl(Uri.parse(banner['link']));
          },
          child: Container(
            width: double.infinity,
            margin: spacing(vertical: 7),
            height: width * 1.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.fill,
                image: NetworkImage(
                  banner['image'],
                ),
              ),
            ),
          ),
        ),
      );
    }
    slider();
  }

  slider() {
    Timer.periodic(
      Duration(seconds: 10),
      (Timer timer) {
        if (currentBanner == (banners.length - 1)) {
          if (mounted) {
            setState(() {
              currentBanner = 0;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              currentBanner++;
            });
          }
        }
        if (mounted) {
          pageController.animateToPage(currentBanner,
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeInOutCubic);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width,
      height: width * 1.3,
      child: PageView(
        onPageChanged: (i) {
          currentBanner = i;
        },
        controller: pageController,
        children: banners,
      ),
    );
  }
}
