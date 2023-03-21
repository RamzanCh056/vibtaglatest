// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vibetag/screens/shop/widget/new_arrival_slide.dart';
import 'package:vibetag/screens/shop/widget/shop_category_item.dart';

import 'package:vibetag/utils/constant.dart';

class ShopCategories extends StatefulWidget {
  final List<dynamic> categories;
  const ShopCategories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<ShopCategories> createState() => _ShopCategoriesState();
}

class _ShopCategoriesState extends State<ShopCategories> {
  PageController pageController = PageController();
  List<Widget> productCategory = [];
  int currentSlide = 0;
  @override
  void initState() {
    super.initState();
    setcategories();
  }

  setcategories() {
    for (var category in widget.categories) {
      productCategory.add(ShopCategorySingleItem(
        category: category,
      ));
    }
    slider();
  }

  slider() {
    Timer.periodic(
      Duration(seconds: 10),
      (Timer timer) {
        if (currentSlide == (widget.categories.length - 1)) {
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
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width,
      height: height * 0.75,
      decoration: BoxDecoration(),
      child: PageView(
        controller: pageController,
        onPageChanged: (i) {
          currentSlide = i;
        },
        children: productCategory,
      ),
    );
  }
}
