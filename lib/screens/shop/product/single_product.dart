import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/shop/product/product_drop.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/drawer/shop_drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/screens/shop/shop_header.dart';

import '../../../utils/constant.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  bool isTap = false;
  bool isShop = false;
  TextEditingController delivery = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final List<String> buttonText = [
    '1 like',
    '85 Products',
    '10 Recations',
    '5 Shop Review'
  ];
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: isShop ? ShopMenu() : DrawerMenu(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                      onTap: () {
                        setState(() {
                          isShop = false;
                        });
                        _key.currentState!.openDrawer();
                      },
                    ),
                    ShopHeader(
                      onTap: () {
                        setState(() {
                          isShop = true;
                        });
                        _key.currentState!.openDrawer();
                      },
                    ),
                  ],
                ),
                Container(
                  height: height * 0.82,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: spacing(
                            horizontal: width * 0.01,
                            vertical: 0,
                          ),
                          margin: spacing(
                            horizontal: width * 0.03,
                            vertical: height * 0.02,
                          ),
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.maxFinite,
                                alignment: Alignment.center,
                                height: height * 0.3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: borderRadius(15),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/kettle.jpg',
                                      ),
                                    )),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: height * 0.13,
                                      right: width * 0.03,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: HexColor('#D4D4D4'),
                                            borderRadius: borderRadius(25)),
                                        child: const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: height * 0.13,
                                      left: width * 0.03,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: HexColor('#D4D4D4'),
                                            borderRadius: borderRadius(25)),
                                        child: const Icon(
                                          Icons.arrow_back_ios_outlined,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius: borderRadius(25)),
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: double.maxFinite,
                                height: width * 0.15,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        width: width * 0.15,
                                        height: width * 0.15,
                                        margin: spacing(
                                          horizontal: 5,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: borderRadius(5),
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Container(
                                width: width * 0.7,
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Morphy Richards 102783 Equip Jug Kettle - Black',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                width: width * 0.5,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'London, UK 90 In stock',
                                  style: TextStyle(
                                      fontSize: 14, color: HexColor('#727272')),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.006,
                              ),
                              Container(
                                width: width * 0.5,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\$40.00',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: HexColor('#000000'),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(10),
                                  color: Colors.white,
                                ),
                                child: DropDownList(
                                  items: const [
                                    'Delivery',
                                    'Express',
                                  ],
                                  controller: delivery,
                                  first: 'Delivery',
                                  bgColor: white,
                                  textColor: accent,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(10),
                                  color: Colors.orange,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                margin: spacing(
                                  horizontal: 10,
                                  vertical: 7,
                                ),
                                child: Row(children: [
                                  SvgPicture.asset(
                                    'assets/svg/product/support.svg',
                                    width: width * 0.05,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Contact Seller',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.orange,
                                    ),
                                  )
                                ]),
                              ),
                              Container(
                                margin: spacing(
                                  horizontal: 10,
                                  vertical: 7,
                                ),
                                child: Row(children: [
                                  SvgPicture.asset(
                                    'assets/svg/product/bookmark.svg',
                                    width: width * 0.05,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Type | Brand New',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.orange,
                                    ),
                                  )
                                ]),
                              ),
                              Container(
                                margin: spacing(
                                  horizontal: 10,
                                  vertical: 7,
                                ),
                                child: Row(children: [
                                  SvgPicture.asset(
                                    'assets/svg/product/fast-delivery.svg',
                                    width: width * 0.05,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Standart Delivery | 13 - 17 Days',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.orange,
                                    ),
                                  )
                                ]),
                              ),
                              Container(
                                margin: spacing(
                                  horizontal: 10,
                                  vertical: 7,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/product/bookmark3.svg',
                                      width: width * 0.05,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Model Number : KTTVIB89912a',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.orange,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: spacing(
                                  horizontal: 10,
                                  vertical: 7,
                                ),
                                child: Row(children: const [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Design : Kettles',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.orange,
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Table(
                            border: TableBorder(
                              verticalInside: BorderSide(
                                width: 1,
                                color: HexColor('#B4B4B4'),
                              ),
                            ),
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: HexColor('#B4B4B4'),
                                  ),
                                  borderRadius: borderRadius(15),
                                ),
                                children: [
                                  TableCell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: HexColor('#B4B4B4'),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                            ),
                                            child: Container(
                                              color: Colors.white,
                                              height: height * 0.06,
                                              alignment: Alignment.center,
                                              child: Text('Model Number'),
                                            ),
                                          ),
                                          Container(
                                            color: HexColor('#EDEDED'),
                                            height: height * 0.06,
                                            alignment: Alignment.center,
                                            child: Text('Amount of stock'),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: height * 0.06,
                                            alignment: Alignment.center,
                                            child: Text('Delivery Type'),
                                          ),
                                          Container(
                                            color: HexColor('#EDEDED'),
                                            height: height * 0.06,
                                            alignment: Alignment.center,
                                            child: Text('Brand'),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                            ),
                                            child: Container(
                                              color: Colors.white,
                                              height: height * 0.06,
                                              alignment: Alignment.center,
                                              child: Text('Ruturnable'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: HexColor('#B4B4B4'),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Container(
                                              color: Colors.white,
                                              height: height * 0.06,
                                              alignment: Alignment.center,
                                              child: Text('KTTVIB89912a'),
                                            ),
                                          ),
                                          Container(
                                            color: HexColor('#EDEDED'),
                                            height: height * 0.06,
                                            alignment: Alignment.center,
                                            child: Text('90'),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: height * 0.06,
                                            alignment: Alignment.center,
                                            child: Text('Free'),
                                          ),
                                          Container(
                                            color: HexColor('#EDEDED'),
                                            height: height * 0.06,
                                            alignment: Alignment.center,
                                            child: Text('Morphy Richard'),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(15),
                                            ),
                                            child: Container(
                                              color: white,
                                              height: height * 0.06,
                                              alignment: Alignment.center,
                                              child: Text('No'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ProductDropDownWidget(
                          dropText: 'Additional Description',
                          widget: Container(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ProductDropDownWidget(
                          dropText: 'Reviews',
                          widget: Container(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ProductDropDownWidget(
                          dropText: 'About Seller',
                          widget: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.2,
                                  height: width * 0.2,
                                  margin: spacing(
                                    horizontal: 0,
                                    vertical: 10,
                                  ),
                                  padding: spacing(
                                    horizontal: 4,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: orange,
                                    borderRadius: borderRadius(width * 0.2),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: darkGray,
                                  ),
                                ),
                                Container(
                                  width: width * 0.6,
                                  margin: spacing(
                                    horizontal: 10,
                                    vertical: 0,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Seller Name',
                                            style: TextStyle(
                                              fontSize: textMed,
                                              color: primaryGray,
                                            ),
                                          ),
                                          Container(
                                            padding: spacing(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius: borderRadius(5),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Like',
                                                  style: TextStyle(
                                                    color: white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.thumb_up_alt,
                                                  color: white,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.maxFinite,
                                        child: Text(
                                          'When in need of new laptop or even an iron. This is the page to be on.',
                                          style: TextStyle(
                                            color: primaryGray,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: width * 0.6,
                                        height: height * 0.1,
                                        child: GridView.builder(
                                          itemCount: 4,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 10,
                                                  crossAxisSpacing: 10,
                                                  childAspectRatio: 3 / 1),
                                          itemBuilder: (context, i) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  color: orange,
                                                  borderRadius:
                                                      borderRadius(5)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                buttonText[i],
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: spacing(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: borderRadius(7),
                            ),
                            child: const Text(
                              'Bought Together',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 10,
                            vertical: 2,
                          ),
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
                                  color: white,
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
                                                    color: HexColor('#000000'),
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
                                                    horizontal: width * 0.01,
                                                    vertical: height * 0.001,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#000000'),
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
                                                      color:
                                                          HexColor('#A0A0A0'),
                                                      fontSize: 10,
                                                      decoration: TextDecoration
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
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: spacing(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: borderRadius(7),
                            ),
                            child: const Text(
                              'Bought Together',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 10,
                            vertical: 2,
                          ),
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
                                  color: white,
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
                                                    color: HexColor('#000000'),
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
                                                    horizontal: width * 0.01,
                                                    vertical: height * 0.001,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#000000'),
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
                                                      color:
                                                          HexColor('#A0A0A0'),
                                                      fontSize: 10,
                                                      decoration: TextDecoration
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
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: spacing(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: borderRadius(7),
                            ),
                            child: const Text(
                              'Bought Together',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          margin: spacing(
                            horizontal: 10,
                            vertical: 2,
                          ),
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
                                  color: white,
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
                                                    color: HexColor('#000000'),
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
                                                    horizontal: width * 0.01,
                                                    vertical: height * 0.001,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#000000'),
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
                                                      color:
                                                          HexColor('#A0A0A0'),
                                                      fontSize: 10,
                                                      decoration: TextDecoration
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
                                        color: white,
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
                        SecondaryFooter(),
                        AppFooter()
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
}
