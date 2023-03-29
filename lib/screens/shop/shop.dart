import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/shop/widget/new_arrivals.dart';
import 'package:vibetag/screens/shop/widget/product_widget.dart';
import 'package:vibetag/screens/shop/widget/shop_categories_widget.dart';
import 'package:vibetag/screens/shop/widget/slider_widget.dart';
import 'package:vibetag/screens/shop/widget/left_banners.dart';
import 'package:vibetag/widgets/categories_items.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../utils/constant.dart';
import '../drawer/drawer.dart';
import '../drawer/shop_drawer.dart';
import 'shop_header.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  PageController pageController = PageController(initialPage: 0);
  Map<String, dynamic> shop = {};
  List<Widget> sliderList = [];
  List<Widget> bannerLeftList = [];
  bool isShop = false;
  bool isLoading = false;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    getShopProducts();
  }

  getShopProducts() async {
    setState(() {
      isLoading = !isLoading;
    });
    final data = {
      'type': 'store',
      'sub_type': 'get_store_page_content',
    };
    final result = await API().postData(data);
    shop = jsonDecode(result.body);

    for (var item in shop['top_banner']) {
      sliderList.add(ShopSliderItem(
        item: item,
      ));
    }

    setState(() {
      isLoading = !isLoading;
    });
    slider();
  }

  int currentSlid = 0;
  int bannerLeftPage = 0;

  slider() {
    Timer.periodic(
      Duration(seconds: 10),
      (Timer timer) {
        if (currentSlid == (shop['top_banner'].length - 1)) {
          if (mounted) {
            setState(() {
              currentSlid = 0;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              currentSlid++;
            });
          }
        }
        if (mounted) {
          pageController.animateToPage(currentSlid,
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeInOutCubic);
        }
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
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Scaffold(
      drawer: isShop ? ShopMenu() : DrawerMenu(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: isLoading
            ? loadingSpinner()
            : Container(
                width: width,
                height: height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NavBar(),
                          Header(),
                          ShopHeader(
                            onTap: () {
                              setState(() {
                                isShop = true;
                              });
                              if (key.currentState != null) {
                                key.currentState!.openDrawer();
                              }
                            },
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: width * 1.3,
                              width: double.infinity,
                              child: PageView(
                                reverse: true,
                                controller: pageController,
                                onPageChanged: (i) {
                                  currentSlid = i;
                                },
                                children: sliderList,
                              ),
                            ),
                            NewArrival(
                              arrivals: shop['new_arrival'],
                            ),
                            LeftBanners(
                              leftBanners: shop['banner_left'],
                            ),
                            LeftBanners(
                              leftBanners: shop['three_banners_in_row'],
                            ),
                            Container(
                              margin: spacing(
                                horizontal: width * 0.02,
                                vertical: 0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * 0.8,
                                    height: height * 0.06,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'Search products',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: HexColor('#E3E3E3'),
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.only(
                                            top: 15,
                                            left: 10,
                                            right: 10,
                                          ),
                                          suffix: const Icon(
                                            Icons.search,
                                            color: Colors.orange,
                                          )),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/chat/plus.svg',
                                    width: width * 0.1,
                                  )
                                ],
                              ),
                            ),
                            gap(h: 10),
                            Column(
                              children: [],
                            ),
                            gap(h: 10),
                            Container(
                              height: height * 0.5,
                              width: width,
                              decoration: BoxDecoration(
                                color: HexColor('#000000'),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Items of Sale',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    width: width,
                                    height: height * 0.3,
                                    child: ListView.builder(
                                      itemCount: shop['products_sale'].length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return ShopProductWidget(
                                          product: shop['products_sale'][i],
                                          haveSale: true,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Categories',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  const Text(
                                    'Our most trending categories that peoples buy the most',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  ShopCategories(
                                    categories: shop['trending_categories'],
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  const Text(
                                    'Soft Light',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  const Text(
                                    'Check the sport ligth of our products',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Container(
                                    width: width,
                                    height: height * 0.3,
                                    child: ListView.builder(
                                      itemCount: shop['spot_light'].length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        if (i % 2 == 0) {
                                          return ShopProductWidget(
                                            product: shop['spot_light'][i],
                                          );
                                        } else {
                                          return gap();
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: width,
                                    height: height * 0.3,
                                    child: ListView.builder(
                                      itemCount: shop['spot_light'].length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        if (i % 2 == 1) {
                                          return ShopProductWidget(
                                            product: shop['spot_light'][i],
                                          );
                                        } else {
                                          return gap();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: width,
                              height: height * 0.25,
                              decoration: BoxDecoration(
                                color: HexColor('#E3E3E3'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: width,
                              height: height * 0.25,
                              decoration: BoxDecoration(
                                color: HexColor('#E3E3E3'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: height * 0.5,
                              width: width,
                              decoration: BoxDecoration(
                                color: HexColor('#000000'),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Toys',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    width: width,
                                    height: height * 0.3,
                                    child: ListView.builder(
                                      itemCount: shop['toys'].length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return ShopProductWidget(
                                          product: shop['toys'][i],
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: width * 0.05,
                                      vertical: height * 0.007,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: spacing(
                                            horizontal: width * 0.05,
                                            vertical: height * 0.007,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: borderRadius(10),
                                          ),
                                          child: const Text(
                                            'See offers',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: HexColor('#949494'),
                                                borderRadius: borderRadius(10),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_left_outlined,
                                                color: HexColor('#EAEAEA'),
                                                size: 32,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              decoration: BoxDecoration(
                                                color: HexColor('#949494'),
                                                borderRadius: borderRadius(10),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_right_outlined,
                                                color: HexColor('#EAEAEA'),
                                                size: 32,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: height * 0.5,
                              width: width,
                              decoration: BoxDecoration(
                                color: HexColor('#EFEFEF'),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Applications',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Text(
                                    'Check the modern Appliances',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    width: width,
                                    height: height * 0.3,
                                    child: ListView.builder(
                                      itemCount: 1,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return ShopProductWidget(
                                          product: shop['appliances'],
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: width * 0.05,
                                      vertical: height * 0.007,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: spacing(
                                            horizontal: width * 0.05,
                                            vertical: height * 0.007,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: borderRadius(10),
                                          ),
                                          child: const Text(
                                            'See offers',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: HexColor('#AEAEAE'),
                                                borderRadius: borderRadius(10),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_left_outlined,
                                                color: HexColor('#FFFFFF'),
                                                size: 32,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              decoration: BoxDecoration(
                                                color: HexColor('#AEAEAE'),
                                                borderRadius: borderRadius(10),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_right_outlined,
                                                color: HexColor('#FFFFFF'),
                                                size: 32,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: height * 0.5,
                              width: width,
                              decoration: BoxDecoration(
                                color: HexColor('#FEB1C3'),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'People just added to their wishlists',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    width: width,
                                    height: height * 0.3,
                                    child: ListView.builder(
                                      itemCount: 1,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) {
                                        return ShopProductWidget(
                                          product: shop['wishlist='],
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: width * 0.05,
                                      vertical: height * 0.007,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: spacing(
                                            horizontal: width * 0.05,
                                            vertical: height * 0.007,
                                          ),
                                          decoration: BoxDecoration(
                                            color: HexColor('#000000'),
                                            borderRadius: borderRadius(10),
                                          ),
                                          child: Text(
                                            'See offers',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: HexColor('#C78B99'),
                                                borderRadius: borderRadius(10),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_left_outlined,
                                                size: 32,
                                                color: HexColor('#666666'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              decoration: BoxDecoration(
                                                color: HexColor('#C78B99'),
                                                borderRadius: borderRadius(10),
                                              ),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_right_outlined,
                                                size: 32,
                                                color: HexColor('#666666'),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Magazine',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'A world of inspiration',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'READ MARKET SHOP MAGAZINE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor('#BCBCBC'),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  width: width * 0.95,
                                  height: height * 0.5,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 1,
                                    ),
                                    itemCount: 4,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        width: width * 0.35,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: height * 0.165,
                                              decoration: BoxDecoration(
                                                color: HexColor('#DCDCDC'),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    15,
                                                  ),
                                                  topRight: Radius.circular(
                                                    15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                    15,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    15,
                                                  ),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                        'Cradle to Cradel | ',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '#vibetagsho',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.orange,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    'Read story',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color:
                                                          HexColor('#BCBCBC'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
