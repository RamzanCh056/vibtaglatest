import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';

import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';
import '../../widgets/custom_painter.dart';
import '../shop/cart.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: DrawerMenu(),
      key: _key,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                    )
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          height: height * 0.33,
                          decoration: BoxDecoration(
                            color: white,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  width: width,
                                  height: height * 0.15,
                                  child: Image.asset(
                                    'assets/images/cover.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: height * 0.09,
                                child: Container(
                                  width: width * 0.2,
                                  height: width * 0.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(width * 0.15),
                                  ),
                                  child: CircleAvatar(
                                    foregroundImage: const AssetImage(
                                        'assets/images/streamer.jpg'),
                                    radius: width * 0.15,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: height * 0.2,
                                child: Center(
                                  child: Container(
                                    width: width * 0.3,
                                    height: width * 0.2,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(width * 0.15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Epic Cras',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              child: Icon(
                                                Icons.verified,
                                                color: blue,
                                                size: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                        const Text(
                                          '1M members',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.2,
                                          padding: spacing(
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: orange,
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: width * 0.03,
                                                height: width * 0.03,
                                                child: SvgPicture.asset(
                                                  'assets/svg/chat/plus.svg',
                                                  color: white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Join',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: white,
                                                ),
                                              ),
                                            ],
                                          ),
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
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: width * 0.95,
                            height: height * 0.16,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                width * 0.02,
                              ),
                            ),
                            child: Column(
                              children: [
                                DefaultTabController(
                                  length: 8,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const TabBar(
                                        unselectedLabelColor:
                                            Color.fromARGB(255, 110, 107, 107),
                                        labelColor: Colors.orange,
                                        indicatorColor: Colors.orange,
                                        labelStyle: TextStyle(
                                          fontSize: 24,
                                        ),
                                        tabs: [
                                          Tab(
                                            icon: SvgIcon(
                                                'assets/svg/list-text.svg'),
                                          ),
                                          Tab(
                                            icon: SvgIcon(
                                                'assets/svg/writing.svg'),
                                          ),
                                          Tab(
                                            icon:
                                                SvgIcon('assets/svg/photo.svg'),
                                          ),
                                          Tab(
                                            icon: SvgIcon(
                                                'assets/svg/play-button.svg'),
                                          ),
                                          Tab(
                                            icon:
                                                SvgIcon('assets/svg/music.svg'),
                                          ),
                                          Tab(
                                            icon:
                                                SvgIcon('assets/svg/copy.svg'),
                                          ),
                                          Tab(
                                            icon: SvgIcon(
                                                'assets/svg/position.svg'),
                                          ),
                                          Tab(
                                            icon:
                                                SvgIcon('assets/svg/live.svg'),
                                          ),
                                        ],
                                      ),
                                      Container(),
                                      Container(),
                                      Container(),
                                      Container(),
                                      Container(),
                                      Container(),
                                      Container(),
                                      Container(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width * 0.8,
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      width * 0.1,
                                    ),
                                    border: Border.all(
                                      width: width * 0.004,
                                      color: Color.fromARGB(255, 116, 113, 113),
                                    ),
                                  ),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Search all post',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                        bottom: 9,
                                        left: 10,
                                        right: 10,
                                        top: 1,
                                      ),
                                      suffix: Icon(Icons.search),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: width * 0.95,
                            height: height * 0.4,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(12),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.2,
                                          height: width * 0.2,
                                          padding: spacing(
                                            horizontal: 15,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: lightGray,
                                            borderRadius: borderRadius(width),
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/svg/group/menu.svg',
                                            color: white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'No post to show',
                                          style: TextStyle(
                                            color: darkGray,
                                            fontSize: textSm,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: Container(
                                    padding: spacing(
                                      horizontal: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: width * 0.9,
                                          padding: spacing(
                                            horizontal: 10,
                                          ),
                                          child: Text('Search all posts'),
                                        ),
                                        Container(
                                          width: width * 0.9,
                                          height: height * 0.04,
                                          padding: spacing(
                                            horizontal: 10,
                                          ),
                                          alignment: Alignment.center,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    borderRadius(width),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: width * 0.95,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(12),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: spacing(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width * 0.1,
                                        height: width * 0.1,
                                        padding: spacing(
                                          horizontal: 8,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svg/post/info.svg',
                                          color: white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Info',
                                        style: TextStyle(
                                          fontSize: textLg,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: spacing(
                                    horizontal: 30,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width * 0.07,
                                        height: width * 0.07,
                                        padding: spacing(
                                          horizontal: 5,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svg/group/lock.svg',
                                          color: white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Private',
                                        style: TextStyle(
                                          fontSize: textXSm,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: spacing(
                                    horizontal: 30,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width * 0.07,
                                        height: width * 0.07,
                                        padding: spacing(
                                          horizontal: 5,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svg/group/price-tag.svg',
                                          color: white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Cars and Vehicles',
                                        style: TextStyle(
                                          fontSize: textXSm,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: spacing(
                                    horizontal: 30,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width * 0.07,
                                        height: width * 0.07,
                                        padding: spacing(
                                          horizontal: 5,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svg/group/notes.svg',
                                          color: white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Cars and Vehicles',
                                        style: TextStyle(
                                          fontSize: textXSm,
                                        ),
                                      )
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
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: width * 0.95,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(12),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: spacing(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width * 0.1,
                                        height: width * 0.1,
                                        padding: spacing(
                                          horizontal: 8,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svg/group/paragraph.svg',
                                          color: white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'About',
                                        style: TextStyle(
                                          fontSize: textLg,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: width * 0.85,
                                  height: height * 0.05,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                        top: 10,
                                        left: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1),
                                        borderRadius: borderRadius(width),
                                      ),
                                      hintText:
                                          'Share latest cars in the world',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: width * 0.95,
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: width * 0.1,
                                    height: width * 0.1,
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/svg/group/menu.svg',
                                      color: white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Suggested Groups',
                                    style: TextStyle(
                                      fontSize: textLg,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
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
                                      color: medGray,
                                      borderRadius: borderRadius(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius(10),
                                            ),
                                            width: width * 0.4,
                                            height: height * 0.3,
                                          ),
                                        ),
                                        Positioned(
                                          top: height * 0.075,
                                          right: 0,
                                          left: 0,
                                          child: Center(
                                            child: Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius(5),
                                              ),
                                              alignment: Alignment.center,
                                              child: SvgPicture.asset(
                                                'assets/svg/photo.svg',
                                                color: white,
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
                                              color: white,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
                                            ),
                                            padding: spacing(
                                              horizontal: 5,
                                              vertical: 5,
                                            ),
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: double.maxFinite,
                                                      child: const Text(
                                                        'Marget can be very h',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.maxFinite,
                                                      child: Text(
                                                        '20K Members',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: darkGray,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Center(
                                                  child: Container(
                                                    width: width * 0.35,
                                                    decoration: BoxDecoration(
                                                      color: orange,
                                                      borderRadius:
                                                          borderRadius(5),
                                                    ),
                                                    padding: spacing(
                                                      vertical: 3,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Like Page',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .thumb_up_alt_sharp,
                                                          size: 16,
                                                          color: white,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SecondaryFooter(),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
