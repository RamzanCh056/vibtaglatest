import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/album/all_albums.dart';
import 'package:vibetag/screens/album/create_album.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final GlobalKey<ScaffoldState> key = GlobalKey();

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
                  height: height * 0.865,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.08,
                          width: width,
                          child: Card(
                            child: Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Center(
                                            child: Container(
                                              width: width * 0.07,
                                              height: width * 0.07,
                                              padding: spacing(
                                                horizontal: 5,
                                                vertical: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: orange,
                                                borderRadius: borderRadius(20),
                                              ),
                                              child: SvgIcon(
                                                'assets/svg/post/image1.svg',
                                                width: width * 0.04,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'View Wishlist',
                                            style: TextStyle(
                                              fontSize: textMed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.95,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(15),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height: height * 0.6,
                                  child: GridView.builder(
                                    itemCount: 10,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                      childAspectRatio: 1 / 1.2,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        width: width * 0.42,
                                        height: width * 0.42,
                                        margin: spacing(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: medGray,
                                          borderRadius: borderRadius(15),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: Center(
                                                child: Icon(
                                                  Icons.photo,
                                                  size: 48,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: spacing(
                                                      horizontal: 12,
                                                      vertical: 3,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: darkGray,
                                                      borderRadius:
                                                          borderRadius(5),
                                                    ),
                                                    child: Text(
                                                      'Appliances',
                                                      style: TextStyle(
                                                        color: white,
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    padding: spacing(
                                                      horizontal: 12,
                                                      vertical: 3,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: darkGray,
                                                      borderRadius:
                                                          borderRadius(5),
                                                    ),
                                                    child: Text(
                                                      'Household Appliances',
                                                      style: TextStyle(
                                                        color: white,
                                                        fontSize: 8,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                height: height * 0.06,
                                                decoration: BoxDecoration(
                                                  color: backgroundColor,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const FittedBox(
                                                        child: Text(
                                                          'Volve Break House - Rear',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          '£9.70',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: orange,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: height * 0.45,
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: HexColor('#FEB1C3'),
                                  ),
                                  child: SingleChildScrollView(
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
                                                  borderRadius:
                                                      borderRadius(10),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              borderRadius(5),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#F0F0F0'),
                                                          borderRadius:
                                                              borderRadius(5),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: height * 0.04,
                                                      left: 5,
                                                      child: Container(
                                                        height: height * 0.05,
                                                        alignment:
                                                            Alignment.center,
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
                                                        alignment:
                                                            Alignment.center,
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
                                                                  padding:
                                                                      spacing(
                                                                    horizontal:
                                                                        width *
                                                                            0.01,
                                                                    vertical:
                                                                        height *
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
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      spacing(
                                                                    horizontal:
                                                                        width *
                                                                            0.01,
                                                                    vertical:
                                                                        height *
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
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10,
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
                                                                    style:
                                                                        TextStyle(
                                                                      color: HexColor(
                                                                          '#A0A0A0'),
                                                                      fontSize:
                                                                          10,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.002,
                                                                ),
                                                                Container(
                                                                  child:
                                                                      const Text(
                                                                    '\$220.00',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .orange,
                                                                      fontSize:
                                                                          10,
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
                                                  borderRadius:
                                                      borderRadius(10),
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
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#C78B99'),
                                                      borderRadius:
                                                          borderRadius(10),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_left_outlined,
                                                      size: 32,
                                                      color:
                                                          HexColor('#666666'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    width: width * 0.1,
                                                    height: width * 0.1,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#C78B99'),
                                                      borderRadius:
                                                          borderRadius(10),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right_outlined,
                                                      size: 32,
                                                      color:
                                                          HexColor('#666666'),
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
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: spacing(
                                    horizontal: 5,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              width: width * 0.35,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: height * 0.18,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#DCDCDC'),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                          15,
                                                        ),
                                                        topRight:
                                                            Radius.circular(
                                                          15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                          15,
                                                        ),
                                                        bottomRight:
                                                            Radius.circular(
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
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '#vibetagsho',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .orange,
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
                                                            color: HexColor(
                                                                '#BCBCBC'),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SecondaryFooter(),
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
