// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constant.dart';

class TrendAdsBanner extends StatefulWidget {
  final List<dynamic> ads;
  TrendAdsBanner({
    Key? key,
    required this.ads,
  }) : super(key: key);

  @override
  State<TrendAdsBanner> createState() => _TrendAdsBannerState();
}

class _TrendAdsBannerState extends State<TrendAdsBanner> {
  int pageIndex = 0;
  List<Widget> slides = [];
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    setSliderPage();
    slider();
  }

  setSliderPage() {
    for (var ad in widget.ads) {
      slides.add(AdsWidgetTrend(
        ad: ad,
      ));
    }
  }

  slider() {
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (pageIndex == slides.length) {
          if (mounted) {
            setState(() {
              pageIndex = 0;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              pageIndex++;
            });
          }
        }
        pageController.animateToPage(
          pageIndex,
          duration: Duration(
            seconds: 1,
          ),
          curve: Curves.easeInSine,
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.45,
            child: PageView(
              reverse: true,
              controller: pageController,
              onPageChanged: (i) {
                pageIndex = i;
              },
              children: slides,
            ),
          ),
          gap(h: 15),
          Container(
            width: double.infinity,
            child: Center(
              child: Container(
                width: slides.length * 15,
                height: 25,
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: slides.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Center(
                      child: Container(
                        margin: spacing(
                          horizontal: 3,
                        ),
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(width),
                          color: pageIndex == i ? orange : grayMed,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdsWidgetTrend extends StatelessWidget {
  final Map<String, dynamic> ad;
  const AdsWidgetTrend({
    Key? key,
    required this.ad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.3,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: lightGray,
              ),
              child: ad['ad_media'] != ''
                  ? Image.network(
                      ad['ad_media'].toString().trim(),
                    )
                  : Center(
                      child: Container(
                        width: width * 0.08,
                        height: width * 0.08,
                        child: SvgPicture.asset(
                          'assets/svg/photo.svg',
                          color: white,
                          width: width * 0.08,
                        ),
                      ),
                    ),
            ),
            Container(
              width: double.maxFinite,
              padding: spacing(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gap(h: 10),
                  Container(
                    width: width * 0.8,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ad['name'],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  gap(h: 7),
                  Text(
                    ad['description'],
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 12,
                    ),
                  ),
                  gap(h: 7),
                  InkWell(
                    onTap: () {
                      launchUrl(
                        Uri.parse(
                          ad['url'],
                        ),
                      );
                    },
                    child: Text(
                      ad['url'],
                      style: TextStyle(
                        color: orangePrimary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  gap(h: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
