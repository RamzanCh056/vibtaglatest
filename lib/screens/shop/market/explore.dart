import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/album/all_albums.dart';
import 'package:vibetag/screens/album/create_album.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../drawer/shop_drawer.dart';
import '../shop_header.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
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
                      onTap: () {
                        key.currentState!.openDrawer();
                      },
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DefaultTabController(
                          length: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.08,
                                width: width,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: accent,
                                    ),
                                  ),
                                ),
                                child: TabBar(
                                  indicatorPadding: EdgeInsets.zero,
                                  indicatorWeight: 4,
                                  padding: spacing(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                  isScrollable: true,
                                  unselectedLabelColor: darkGray,
                                  labelColor: Colors.orange,
                                  indicatorColor: Colors.orange,
                                  labelStyle: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  onTap: (value) {},
                                  tabs: [
                                    Tab(
                                      icon: Container(
                                        width: width * 0.15,
                                        alignment: Alignment.center,
                                        child: const FittedBox(
                                          child: Text('Post'),
                                        ),
                                      ),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    Tab(
                                      icon: Container(
                                        width: width * 0.15,
                                        alignment: Alignment.center,
                                        child: const FittedBox(
                                          child: Text('Users'),
                                        ),
                                      ),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    Tab(
                                      icon: Container(
                                        width: width * 0.15,
                                        alignment: Alignment.center,
                                        child: const FittedBox(
                                          child: Text('Pages'),
                                        ),
                                      ),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                    Tab(
                                      icon: Container(
                                        width: width * 0.15,
                                        alignment: Alignment.center,
                                        child: const FittedBox(
                                          child: Text('Groups'),
                                        ),
                                      ),
                                      iconMargin: const EdgeInsets.all(0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                width: width,
                                height: height * 0.85,
                                child: TabBarView(
                                  children: [
                                    ListView.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, i) => Container(
                                        child: Container(
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              width * 0.02,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: const CircleAvatar(
                                                  foregroundImage: AssetImage(
                                                      'assets/images/streamer.jpg'),
                                                ),
                                                title: Row(
                                                  children: [
                                                    const Text('David Millan'),
                                                    const SizedBox(
                                                      width: 7,
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 7,
                                                        height: 7,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: accent,
                                                          borderRadius:
                                                              borderRadius(10),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 7,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Like',
                                                          style: TextStyle(
                                                            color: blue,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Container(
                                                          width: width * 0.43,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: width *
                                                                    0.35,
                                                                child:
                                                                    FittedBox(
                                                                  child: Text(
                                                                    'Added products for sale',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          darkGray,
                                                                      fontSize:
                                                                          10,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_outlined,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    const Text('5 minutes ago'),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    Container(
                                                      width: width * 0.025,
                                                      child: const SvgIcon(
                                                        'assets/svg/globe.svg',
                                                        width: 12,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: accent,
                                                      size: 16,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Image.asset(
                                                  'assets/images/market.png'),
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
                                                    const Text('London'),
                                                    const SizedBox(
                                                      width: 7,
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 7,
                                                        height: 7,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: accent,
                                                          borderRadius:
                                                              borderRadius(10),
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
                                                          color: accent,
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
                                                        Text('Contact seller')
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
                                                            'Price \$13.99 (GBP)')
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
                                                        Text('Type New')
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
                                                        Text(
                                                            'Standard Delivery | 7 - 10 Days')
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
                                                          child: const Text(
                                                            'A lovely set of art pens, pencils and paint And much more',
                                                            style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
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
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
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
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: orange,
                                                      ),
                                                      child: Text(
                                                        'View details',
                                                        style: TextStyle(
                                                          color: white,
                                                          fontSize: textSm,
                                                        ),
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
                                                      MainAxisAlignment
                                                          .spaceAround,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              '465',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              '321',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                              '212',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                    Container(),
                                    Container(),
                                    Container(),
                                  ],
                                ),
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
      ),
    );
  }
}
