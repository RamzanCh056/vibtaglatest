import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/widgets/categories_items.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../utils/constant.dart';
import '../widgets/popup/drawer/drawer.dart';
import '../widgets/popup/drawer/shop_drawer.dart';
import '../widgets/shop_header.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  bool isShop = false;
  int currentPage = 0;
  List<Widget> categories = [
    CategoriesProduct(
      img: 'assets/images/girls.png',
      title: 'Women',
    ),
    CategoriesProduct(
      img: 'assets/images/men.png',
      title: 'Men\'s',
    ),
    CategoriesProduct(
      img: 'assets/images/kids.png',
      title: 'Kid\'s',
    ),
    CategoriesProduct(
      img: 'assets/images/tshirt.png',
      title: 'Boys',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      drawer: isShop ? ShopMenu() : DrawerMenu(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
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
                    Header(
                      onTap: () {
                        setState(() {
                          isShop = false;
                        });
                        if (key.currentState != null) {
                          key.currentState!.openDrawer();
                        }
                      },
                    ),
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
                Container(
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: width,
                              height: height * 0.2,
                              child: Image.asset(
                                'assets/images/shop.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 30,
                              right: 20,
                              child: Container(
                                alignment: Alignment.center,
                                padding: spacing(
                                  horizontal: width * 0.03,
                                  vertical: 5,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                child: const Text(
                                  'Shop All',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return Container(
                                width: width * 0.75,
                                height: height * 0.25,
                                margin: spacing(
                                  horizontal: width * 0.01,
                                  vertical: 0,
                                ),
                                decoration: BoxDecoration(
                                  color: HexColor('#E3E3E3'),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: width * 0.02,
                            vertical: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width * 0.8,
                                height: height * 0.06,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Search products',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              return Container(
                                width: width * 0.75,
                                height: height * 0.25,
                                margin: spacing(
                                  horizontal: width * 0.01,
                                  vertical: 0,
                                ),
                                decoration: BoxDecoration(
                                  color: HexColor('#E3E3E3'),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          height: height * 0.5,
                          width: width,
                          decoration: BoxDecoration(
                            color: HexColor('#000000'),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: height * 0.02,
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
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      margin: spacing(
                                        horizontal: width * 0.01,
                                        vertical: height * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor('#FFFFFF'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                color: Colors.white,
                                              ),
                                              width: width * 0.4,
                                              height: height * 0.3,
                                            ),
                                          ),
                                          Positioned(
                                            top: width * 0.03,
                                            right: width * 0.02,
                                            child: Container(
                                              width: width * 0.1,
                                              height: height * 0.025,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Sale',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                              height: height * 0.09,
                                              decoration: BoxDecoration(
                                                color: HexColor('#F0F0F0'),
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: height * 0.04,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Toomax Storway 1670',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              width: width * 0.37,
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Gardens & Pets',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Storage',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '\$235',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                '#A0A0A0'),
                                                            fontSize: 10,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        child: const Text(
                                                          '\$220.00',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                                // child: Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Container(
                                //       padding: spacing(
                                //         horizontal: width * 0.05,
                                //         vertical: height * 0.007,
                                //       ),
                                //       decoration: BoxDecoration(
                                //         color: HexColor('#000000'),
                                //         borderRadius: borderRadius(10),
                                //       ),
                                //       child: const Text(
                                //         'See offers',
                                //         style: TextStyle(
                                //           color: Colors.white,
                                //           fontSize: 20,
                                //         ),
                                //       ),
                                //     ),
                                //     Row(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.center,
                                //       children: [
                                //         Container(
                                //           width: width * 0.1,
                                //           height: width * 0.1,
                                //           padding: const EdgeInsets.all(5),
                                //           decoration: BoxDecoration(
                                //             color: HexColor('#DCDCDC'),
                                //             borderRadius: borderRadius(10),
                                //           ),
                                //           child: const Icon(
                                //             Icons.keyboard_arrow_left_outlined,
                                //             size: 32,
                                //           ),
                                //         ),
                                //         SizedBox(
                                //           width: width * 0.01,
                                //         ),
                                //         Container(
                                //           width: width * 0.1,
                                //           height: width * 0.1,
                                //           decoration: BoxDecoration(
                                //             color: HexColor('#DCDCDC'),
                                //             borderRadius: borderRadius(10),
                                //           ),
                                //           child: const Icon(
                                //             Icons.keyboard_arrow_right_outlined,
                                //             size: 32,
                                //           ),
                                //         ),
                                //       ],
                                //     )
                                //   ],
                                // ),
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
                              Container(
                                width: width,
                                height: height * 0.25,
                                padding: spacing(
                                  horizontal: width * 0.05,
                                  vertical: 0,
                                ),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                    childAspectRatio: 2 / 1,
                                  ),
                                  itemCount: 4,
                                  itemBuilder: (context, i) {
                                    return categories[i];
                                  },
                                ),
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
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      margin: spacing(
                                        horizontal: width * 0.01,
                                        vertical: height * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor('#FFFFFF'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                color: Colors.white,
                                              ),
                                              width: width * 0.4,
                                              height: height * 0.3,
                                            ),
                                          ),
                                          Positioned(
                                            top: width * 0.03,
                                            right: width * 0.02,
                                            child: Container(
                                              width: width * 0.1,
                                              height: height * 0.025,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Sale',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                              height: height * 0.09,
                                              decoration: BoxDecoration(
                                                color: HexColor('#F0F0F0'),
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: height * 0.04,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Toomax Storway 1670',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              width: width * 0.37,
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Gardens & Pets',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Storage',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '\$235',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                '#A0A0A0'),
                                                            fontSize: 10,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        child: const Text(
                                                          '\$220.00',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Container(
                                width: width,
                                height: height * 0.3,
                                child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      margin: spacing(
                                        horizontal: width * 0.01,
                                        vertical: height * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor('#FFFFFF'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                color: Colors.white,
                                              ),
                                              width: width * 0.4,
                                              height: height * 0.3,
                                            ),
                                          ),
                                          Positioned(
                                            top: width * 0.03,
                                            right: width * 0.02,
                                            child: Container(
                                              width: width * 0.1,
                                              height: height * 0.025,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Sale',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                              height: height * 0.09,
                                              decoration: BoxDecoration(
                                                color: HexColor('#F0F0F0'),
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: height * 0.04,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Toomax Storway 1670',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              width: width * 0.37,
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Gardens & Pets',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Storage',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '\$235',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                '#A0A0A0'),
                                                            fontSize: 10,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        child: const Text(
                                                          '\$220.00',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            color: HexColor('#E3E3E3'),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            color: HexColor('#E3E3E3'),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          height: height * 0.5,
                          width: width,
                          decoration: BoxDecoration(
                            color: HexColor('#000000'),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: height * 0.02,
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
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      margin: spacing(
                                        horizontal: width * 0.01,
                                        vertical: height * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor('#FFFFFF'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                color: Colors.white,
                                              ),
                                              width: width * 0.4,
                                              height: height * 0.3,
                                            ),
                                          ),
                                          Positioned(
                                            top: width * 0.03,
                                            right: width * 0.02,
                                            child: Container(
                                              width: width * 0.1,
                                              height: height * 0.025,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Sale',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                              height: height * 0.09,
                                              decoration: BoxDecoration(
                                                color: HexColor('#F0F0F0'),
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: height * 0.04,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Toomax Storway 1670',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              width: width * 0.37,
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Gardens & Pets',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Storage',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '\$235',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                '#A0A0A0'),
                                                            fontSize: 10,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        child: const Text(
                                                          '\$220.00',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                                            Icons.keyboard_arrow_left_outlined,
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
                                            Icons.keyboard_arrow_right_outlined,
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
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            color: HexColor('#E3E3E3'),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                            color: HexColor('#E3E3E3'),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          width: width,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            color: HexColor('#E3E3E3'),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          height: height * 0.5,
                          width: width,
                          decoration: BoxDecoration(
                            color: HexColor('#EFEFEF'),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: height * 0.02,
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
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      margin: spacing(
                                        horizontal: width * 0.01,
                                        vertical: height * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor('#FFFFFF'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                color: Colors.white,
                                              ),
                                              width: width * 0.4,
                                              height: height * 0.3,
                                            ),
                                          ),
                                          Positioned(
                                            top: width * 0.03,
                                            right: width * 0.02,
                                            child: Container(
                                              width: width * 0.1,
                                              height: height * 0.025,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Sale',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                              height: height * 0.09,
                                              decoration: BoxDecoration(
                                                color: HexColor('#F0F0F0'),
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: height * 0.04,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Toomax Storway 1670',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              width: width * 0.37,
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Gardens & Pets',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: const Text(
                                                          'Storage',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '\$235',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                '#A0A0A0'),
                                                            fontSize: 10,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        child: const Text(
                                                          '\$220.00',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                                            Icons.keyboard_arrow_left_outlined,
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
                                            Icons.keyboard_arrow_right_outlined,
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
                          height: height * 0.02,
                        ),
                        Container(
                          height: height * 0.5,
                          width: width,
                          decoration: BoxDecoration(
                            color: HexColor('#FEB1C3'),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: height * 0.02,
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
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      margin: spacing(
                                        horizontal: width * 0.01,
                                        vertical: height * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor('#FFFFFF'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(10),
                                                color: Colors.white,
                                              ),
                                              width: width * 0.4,
                                              height: height * 0.3,
                                            ),
                                          ),
                                          Positioned(
                                            top: width * 0.03,
                                            right: width * 0.02,
                                            child: Container(
                                              width: width * 0.1,
                                              height: height * 0.025,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                'Sale',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                              height: height * 0.09,
                                              decoration: BoxDecoration(
                                                color: HexColor('#F0F0F0'),
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: height * 0.04,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Toomax Storway 1670',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 5,
                                            child: Container(
                                              height: height * 0.05,
                                              width: width * 0.37,
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: Text(
                                                          'Gardens & Pets',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.01,
                                                          vertical:
                                                              height * 0.001,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#000000'),
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                        child: Text(
                                                          'Storage',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '\$235',
                                                          style: TextStyle(
                                                            color: HexColor(
                                                                '#A0A0A0'),
                                                            fontSize: 10,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.002,
                                                      ),
                                                      Container(
                                                        child: const Text(
                                                          '\$220.00',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                                            Icons.keyboard_arrow_left_outlined,
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
                                            Icons.keyboard_arrow_right_outlined,
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
                          height: height * 0.02,
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
                              height: height * 0.52,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: 4,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: width * 0.35,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: height * 0.18,
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
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                  fontWeight: FontWeight.w300,
                                                  color: HexColor('#BCBCBC'),
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
                              height: height * 0.02,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                  Container(
                                    width: width * 0.2,
                                    child: const Text(
                                      'Find Help & support',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        AppFooter(),
                        SizedBox(
                          height: height * 0.07,
                        ),
                      ],
                    ),
                  ),
                )
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
