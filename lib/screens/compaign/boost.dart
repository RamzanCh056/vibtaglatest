import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/drawer/shop_drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';
import 'package:vibetag/screens/shop/shop_header.dart';

import '../../utils/constant.dart';

class Boost extends StatefulWidget {
  const Boost({super.key});

  @override
  State<Boost> createState() => _BoostState();
}

class _BoostState extends State<Boost> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isShop = false;

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      drawer: isShop ? ShopMenu() : DrawerMenu(),
      backgroundColor: backgroundColor,
      key: _key,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    )
                  ],
                ),
                Container(
                  height: height * 0.81,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 1.05,
                          child: Stack(
                            children: [
                              Container(
                                width: width,
                                height: height * 0.2,
                                color: orange,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: height * 0.035,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Vibe Tag',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: textXXl,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: height * 0.065,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Boost Features allows you to explore all\n Amazing tools over your vibes',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: textXSm,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: height * 0.03,
                                      right: 50,
                                      child: Container(
                                        padding: spacing(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: borderRadius(5)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Booster',
                                          style: TextStyle(
                                            color: orange,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: height * 0.15,
                                left: 0,
                                right: 0,
                                child: Container(
                                  width: width * 0.8,
                                  margin: spacing(
                                    horizontal: 20,
                                    vertical: 0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(10),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          'Select Your Plan With Just Simple Click',
                                          style: TextStyle(
                                            fontSize: textXSm,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Table(
                                          children: [
                                            TableRow(
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/compaign/torch.jpeg',
                                                          width: width * 0.1,
                                                        ),
                                                        Text(
                                                          'Torch',
                                                          style: TextStyle(
                                                            fontSize: textXSm,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/compaign/waves.jpeg',
                                                          width: width * 0.1,
                                                        ),
                                                        Text(
                                                          'Waves',
                                                          style: TextStyle(
                                                            fontSize: textXSm,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/compaign/standardom.jpeg',
                                                          width: width * 0.1,
                                                        ),
                                                        Text(
                                                          'Torch',
                                                          style: TextStyle(
                                                            fontSize: textXSm,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const TableRow(children: [
                                              TableCell(
                                                child: SizedBox(
                                                  height: 30,
                                                ),
                                              ),
                                              TableCell(
                                                child: SizedBox(
                                                  height: 30,
                                                ),
                                              ),
                                              TableCell(
                                                child: SizedBox(
                                                  height: 30,
                                                ),
                                              ),
                                              TableCell(
                                                child: SizedBox(
                                                  height: 30,
                                                ),
                                              ),
                                            ]),
                                            TableRow(
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: white,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Price',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: white,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '\$3/day',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: white,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '\$8/day',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: white,
                                                    ),
                                                    width: width * 0.2,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '\$30/day',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: lightGray,
                                              ),
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Featured Member',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: white,
                                              ),
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'See profile Visitors',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: lightGray,
                                              ),
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Show/Hide Last seen',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.green,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: white,
                                              ),
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Posts Promotion',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '1 Post',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '2 Post',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '5 Post',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: lightGray,
                                              ),
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 15,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Pages Promotion',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Icon(
                                                      Icons.close,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '1 Post',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '2 Post',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: white,
                                              ),
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 25,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Discount',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Icon(
                                                      Icons.close,
                                                      size: iconMed,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '10% Discount',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Container(
                                                    width: width * 0.2,
                                                    padding: spacing(
                                                      horizontal: 10,
                                                      vertical: 20,
                                                    ),
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Text(
                                                      '20% Discount',
                                                      style: TextStyle(
                                                        fontSize: textXSm,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: width * 0.8,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: spacing(
                                                  horizontal: 10,
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: HexColor('#1AB51E'),
                                                  borderRadius:
                                                      borderRadius(10),
                                                ),
                                                child: Text(
                                                  'Boost Now',
                                                  style: TextStyle(
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: spacing(
                                                  horizontal: 10,
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: HexColor('#FD9225'),
                                                  borderRadius:
                                                      borderRadius(10),
                                                ),
                                                child: Text(
                                                  'Boost Now',
                                                  style: TextStyle(
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: spacing(
                                                  horizontal: 10,
                                                  vertical: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: HexColor('#F55252'),
                                                  borderRadius:
                                                      borderRadius(10),
                                                ),
                                                child: Text(
                                                  'Boost Now',
                                                  style: TextStyle(
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: width * 0.9,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(10),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  'Why Choose Booster',
                                  style: TextStyle(
                                    fontSize: textMed,
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/chat/users.svg',
                                  width: width * 0.1,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Get Featured',
                                  style: TextStyle(
                                    fontSize: textXSm,
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/chat/users.svg',
                                  width: width * 0.1,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Show/Hide Last seen',
                                  style: TextStyle(
                                    fontSize: textXSm,
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/chat/users.svg',
                                  width: width * 0.1,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Promote Your Posts Contents',
                                  style: TextStyle(
                                    fontSize: textXSm,
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const AppFooter(),
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
