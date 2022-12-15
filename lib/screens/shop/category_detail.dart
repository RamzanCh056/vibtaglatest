import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/shop/cart.dart';
import 'package:vibetag/screens/shop/product/my_products.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/media_library.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/shop_drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/screens/shop/shop_header.dart';

import '../../utils/constant.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  double _progress = 25;
  TextEditingController sortControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
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
                      onTap: () {},
                    ),
                    ShopHeader(onTap: () {}),
                  ],
                ),
                Container(
                  height: height * 0.87,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          height: height * 0.06,
                          padding: spacing(
                            horizontal: 10,
                            vertical: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_left_outlined,
                                color: Colors.orange,
                                size: 32,
                              ),
                              Text(
                                'Fashion',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            color: HexColor('#B4B4B4'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width,
                          margin: spacing(
                            horizontal: 15,
                            vertical: 0,
                          ),
                          padding: spacing(
                            horizontal: 15,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: borderRadius(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  'Location',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: HexColor('#727272'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.6,
                                    height: height * 0.06,
                                    child: Slider(
                                      activeColor: orange,
                                      inactiveColor:lightGray,
                                      thumbColor: HexColor('#1C1C1C'),
                                      min: 0,
                                      max: 100,
                                      value: _progress,
                                      onChanged: (value) {
                                        setState(() {
                                          _progress = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    _progress.toInt().toString(),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _increase();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:lightGray,
                                            border: Border.all(
                                              width: 1,
                                              color: HexColor('#969696'),
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.keyboard_arrow_up_sharp,
                                            size: 18,
                                            color: HexColor('#969696'),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _decrease();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: lightGray,
                                            border: Border.all(
                                              width: 1,
                                              color: HexColor('#969696'),
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 18,
                                            color: HexColor('#969696'),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('KM')
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width,
                          margin: spacing(
                            horizontal: 15,
                            vertical: 0,
                          ),
                          padding: spacing(
                            horizontal: 15,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: borderRadius(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  'Sort',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: HexColor('#727272'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 5,
                                  vertical: 0,
                                ),
                                decoration: BoxDecoration(
                                  color: lightGray,
                                  borderRadius: borderRadius(15),
                                ),
                                child: DropDownList(
                                  items: const [
                                    'Late',
                                    'First',
                                    'Second',
                                  ],
                                  controller: sortControlller,
                                  first: 'Late',
                                  bgColor: lightGray,
                                  textColor: accent,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width * 0.95,
                          height: height * 0.7,
                          child: GridView.builder(
                            itemCount: 20,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1 / 1.3,
                            ),
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  pushRoute(
                                    context: context,
                                    screen: Cart(),
                                  );
                                },
                                child: Container(
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
                                            color: HexColor('#EAEAEA'),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: spacing(
                                                      horizontal: width * 0.01,
                                                      vertical: height * 0.001,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#000000'),
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
                                                      horizontal: width * 0.01,
                                                      vertical: height * 0.001,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#000000'),
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
                                                        color:
                                                            HexColor('#A0A0A0'),
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
                                                        color: Colors.orange,
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
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: width * 0.8,
                          height: height * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.keyboard_arrow_left_outlined,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: spacing(
                                      horizontal: 2,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: borderRadius(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '1',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: spacing(
                                      horizontal: 2,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '2',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: spacing(
                                      horizontal: 2,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: spacing(
                                      horizontal: 2,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '4',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: spacing(
                                      horizontal: 2,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '5',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: spacing(
                                      horizontal: 2,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(5),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '6',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right_outlined,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                        SecondaryFooter(),
                        AppFooter(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _increase() {
    if (_progress < 100) {
      setState(() {
        _progress += 1;
      });
    }
  }

  void _decrease() {
    if (_progress > 0) {
      setState(() {
        _progress -= 1;
      });
    }
  }
}
