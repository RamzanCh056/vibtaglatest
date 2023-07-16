import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibetag/screens/album/all_albums.dart';
import 'package:vibetag/screens/album/create_album.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../drawer/shop_drawer.dart';
import '../../header/header.dart';
import '../shop_header.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const NavBar(),
                    Header(
                     
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.75,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, i) => Container(
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: accent,
                          borderRadius: BorderRadius.circular(
                            width * 0.02,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: width,
                              height: height * 0.3,
                              child: Stack(
                                children: [
                                  Container(
                                    width: width,
                                    child: Image.asset(
                                      'assets/images/market_product.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      padding: spacing(
                                        horizontal: 5,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: darkGray,
                                        borderRadius: borderRadius(5),
                                      ),
                                      child: Text(
                                        '1/7',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 0,
                                    left: 0,
                                    child: Center(
                                      child: Container(
                                        width: width * 0.3,
                                        padding: spacing(
                                          horizontal: 5,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: borderRadius(5),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: spacing(
                                                horizontal: 2,
                                              ),
                                              alignment: Alignment.center,
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: accent,
                                                borderRadius: borderRadius(10),
                                              ),
                                            ),
                                            Container(
                                              margin: spacing(
                                                horizontal: 2,
                                              ),
                                              alignment: Alignment.center,
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: accent,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: spacing(
                                                horizontal: 2,
                                              ),
                                              alignment: Alignment.center,
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: accent,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: spacing(
                                                horizontal: 2,
                                              ),
                                              alignment: Alignment.center,
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: accent,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: spacing(
                                                horizontal: 2,
                                              ),
                                              alignment: Alignment.center,
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: accent,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: spacing(
                                                horizontal: 2,
                                              ),
                                              alignment: Alignment.center,
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: accent,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: spacing(
                                                horizontal: 2,
                                              ),
                                              alignment: Alignment.center,
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: accent,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              width: double.maxFinite,
                              child: Text(
                                '150 PCS art set extravaganza',
                                style: TextStyle(
                                  fontSize: textSm,
                                  color: white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'London',
                                    style: TextStyle(
                                      color: white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: borderRadius(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Container(
                                    width: width * 0.43,
                                    child: Text(
                                      '1000 In stock',
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: darkGray,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/product/bookmark.svg',
                                        width: width * 0.05,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Contact seller',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/product/bookmark3.svg',
                                        width: width * 0.05,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Price \$13.99 (GBP)',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/product/bookmark.svg',
                                        width: width * 0.05,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Type New',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/product/fast-delivery.svg',
                                        width: width * 0.05,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: width * 0.75,
                                        child: Text(
                                          'Express Delivery | 7 - 10 Days \nStandard Delivery | 18 - 29 Days',
                                          style: TextStyle(
                                            color: white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/product/bookmark.svg',
                                        width: width * 0.05,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: width * 0.75,
                                        child: Text(
                                          'Model Number: NWDNMVB23311A \n Material: Denium/Cotton \nDesgin: Womens\'s Clotthing',
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            color: white,
                                            fontSize: textSm,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: width * 0.05,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: width * 0.75,
                                        child: const Text(
                                          'Material: Plastic',
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    height: height * 0.05,
                                    padding: spacing(
                                      horizontal: 20,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: orange,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'View details',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: textSm,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: white,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: spacing(
                                horizontal: width * 0.01,
                                vertical: 0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        child: Image.asset(
                                          'assets/icons/like1.png',
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Likes',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '465',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        child: Image.asset(
                                          'assets/icons/comment1.png',
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Comments',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '321',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        child: Image.asset(
                                          'assets/icons/revibe1.png',
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Revibed',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '212',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SecondaryFooter(),
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.star_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Refresh',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            tooltip: '1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
