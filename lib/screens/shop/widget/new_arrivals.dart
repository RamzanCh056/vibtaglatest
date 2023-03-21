// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vibetag/screens/shop/widget/new_arrival_slide.dart';

import 'package:vibetag/utils/constant.dart';

class NewArrival extends StatefulWidget {
  final List<dynamic> arrivals;
  const NewArrival({
    Key? key,
    required this.arrivals,
  }) : super(key: key);

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  PageController pageController = PageController();
  List<dynamic> shop = [1, 3, 4];
  List<Widget> arrivals = [];
  int currentSlide = 0;
  @override
  void initState() {
    super.initState();
    setArrivals();
  }

  setArrivals() {
    for (var arrival in widget.arrivals) {
      arrivals.add(
        NewArrivalsWidget(
          arrival: arrival,
        ),
      );
    }
    slider();
  }

  slider() {
    Timer.periodic(
      Duration(seconds: 10),
      (Timer timer) {
        if (currentSlide == (widget.arrivals.length - 1)) {
          if (mounted) {
            setState(() {
              currentSlide = 0;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              currentSlide++;
            });
          }
        }
        if (mounted) {
          pageController.animateToPage(currentSlide,
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
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Container(
      width: width,
      height: height * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/leafes.jpg',
          ),
        ),
      ),
      child: Container(
        width: width * 0.8,
        height: height * 0.5,
        margin: spacing(
          horizontal: 25,
          vertical: 25,
        ),
        decoration: BoxDecoration(
          color: white,
        ),
        child: Column(
          children: [
            gap(h: 15),
            Text(
              'New Arrivals',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            gap(h: 15),
            Container(
              width: width * 0.65,
              height: width * 0.8,
              child: PageView(
                onPageChanged: (i) {
                  currentSlide = i;
                },
                controller: pageController,
                children: arrivals,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
