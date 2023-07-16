import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/drawer/shop_drawer.dart';
import 'package:vibetag/screens/shop/shop_header.dart';
import 'package:vibetag/screens/shop/product/price_bar.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  final GlobalKey<ScaffoldState> key = GlobalKey();
  bool isShop = false;
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: key,
      drawer: isShop ? ShopMenu() : DrawerMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      
                      ),
                      ShopHeader(
                        onTap: () {
                          setState(() {
                            isShop = true;
                          });
                          key.currentState!.openDrawer();
                        },
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: width,
                      height: height * 0.87,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              width: width * 0.9,
                              height: height * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: borderRadius(
                                  width * 0.03,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Cart',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/kettle.jpg',
                                          width: width * 0.25,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: width * 0.55,
                                              child: const Text(
                                                'Morphy Richards 102783 Equip Jug Kettle - Black',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Container(
                                              padding: spacing(
                                                horizontal: width * 0.07,
                                                vertical: height * 0.01,
                                              ),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#DCDCDC'),
                                                  border: Border.all(
                                                    width: 1,
                                                    color: HexColor('#808080'),
                                                  ),
                                                  borderRadius: borderRadius(
                                                    width * 0.02,
                                                  )),
                                              child: Text('Raqoni'),
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  'Express Delivery | 5 - 7 days = ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  ('\$6'),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.orange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  'Price \$25.2 x 1 = ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  ('\$25.2'),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.orange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Container(
                                              width: width * 0.55,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: width * 0.15,
                                                        padding: spacing(
                                                          horizontal:
                                                              width * 0.04,
                                                          vertical:
                                                              height * 0.007,
                                                        ),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#DCDCDC'),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                              width * 0.02,
                                                            ),
                                                            bottomLeft:
                                                                Radius.circular(
                                                              width * 0.02,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          '1',
                                                          style: TextStyle(
                                                            fontSize: 22,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: HexColor(
                                                                  '#DCDCDC'),
                                                              border:
                                                                  Border.all(
                                                                width: 1,
                                                                color: HexColor(
                                                                    '#808080'),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                  width * 0.02,
                                                                ),
                                                              ),
                                                            ),
                                                            child: const Icon(
                                                              Icons
                                                                  .keyboard_arrow_up,
                                                              size: 15,
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: HexColor(
                                                                  '#DCDCDC'),
                                                              border:
                                                                  Border.all(
                                                                width: 1,
                                                                color: HexColor(
                                                                    '#808080'),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                  width * 0.02,
                                                                ),
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              size: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    width: width * 0.23,
                                                    decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        width * 0.02,
                                                      ),
                                                    ),
                                                    padding: spacing(
                                                      horizontal: width * 0.03,
                                                      vertical: height * 0.013,
                                                    ),
                                                    child: const Text(
                                                      'Update',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Container(
                                      padding: spacing(
                                        horizontal: width * 0.05,
                                        vertical: height * 0.01,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Summary',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          rateItems(
                                            context: context,
                                            title: 'Total',
                                            price: '25.2',
                                          ),
                                          rateItems(
                                            context: context,
                                            title: 'Delivery Charges',
                                            price: '6',
                                          ),
                                          rateItems(
                                            context: context,
                                            title: 'Commission fees',
                                            price: '1.26',
                                          ),
                                          const Text(
                                            '5% of Total',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          rateItems(
                                            context: context,
                                            title: 'Buyers Protection',
                                            price: '1.26',
                                          ),
                                          const Text(
                                            '5% of Total',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          rateItems(
                                              context: context,
                                              title: 'Grand Total',
                                              price: '32.26',
                                              color: '#FD9225',
                                              textColor: '#FFFFFF')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                                                    borderRadius:
                                                        borderRadius(10),
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
                                                    borderRadius:
                                                        borderRadius(5),
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
                                                    borderRadius:
                                                        borderRadius(5),
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
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding: spacing(
                                                              horizontal:
                                                                  width * 0.01,
                                                              vertical: height *
                                                                  0.001,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: HexColor(
                                                                  '#000000'),
                                                              borderRadius:
                                                                  borderRadius(
                                                                      10),
                                                            ),
                                                            child: Text(
                                                              'Gardens & Pets',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                height * 0.002,
                                                          ),
                                                          Container(
                                                            padding: spacing(
                                                              horizontal:
                                                                  width * 0.01,
                                                              vertical: height *
                                                                  0.001,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: HexColor(
                                                                  '#000000'),
                                                              borderRadius:
                                                                  borderRadius(
                                                                      10),
                                                            ),
                                                            child: Text(
                                                              'Storage',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
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
                                                            height:
                                                                height * 0.002,
                                                          ),
                                                          Container(
                                                            child: const Text(
                                                              '\$220.00',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .orange,
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
                                                color: HexColor('#DCDCDC'),
                                                borderRadius: borderRadius(10),
                                              ),
                                              child: const Icon(
                                                Icons
                                                    .keyboard_arrow_left_outlined,
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
                                                color: HexColor('#DCDCDC'),
                                                borderRadius: borderRadius(10),
                                              ),
                                              child: const Icon(
                                                Icons
                                                    .keyboard_arrow_right_outlined,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Magazine',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
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
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.8,
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                    color: HexColor('#DCDCDC'),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        15,
                                      ),
                                      topRight: Radius.circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Cradle to Cradel | ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '#vibetagsho',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Read story',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor('#BCBCBC'),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.8,
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                    color: HexColor('#DCDCDC'),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        15,
                                      ),
                                      topRight: Radius.circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Cradle to Cradel | ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '#vibetagsho',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Read story',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor('#BCBCBC'),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.8,
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                    color: HexColor('#DCDCDC'),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        15,
                                      ),
                                      topRight: Radius.circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Cradle to Cradel | ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '#vibetagsho',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Read story',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: HexColor('#BCBCBC'),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.8,
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                    color: HexColor('#DCDCDC'),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        15,
                                      ),
                                      topRight: Radius.circular(
                                        15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppFooter(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
