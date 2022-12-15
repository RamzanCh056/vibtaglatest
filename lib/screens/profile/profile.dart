import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/blog/recent.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/search_bar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';
import '../../widgets/custom_painter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                          height: height * 0.4,
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
                                top: height * 0.21,
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
                                          MainAxisAlignment.start,
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
                                              'David Millan',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
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
                                          '@david_millan',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        const Text(
                                          'Pakistan',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: darkGray,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: height * 0.16,
                                child: Column(
                                  children: [
                                    Container(
                                      width: width * 0.3,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Like',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            '10K',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.3,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Following',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            '23',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.3,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Followers',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            '11K',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: height * 0.16,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius: borderRadius(5),
                                            ),
                                            padding: spacing(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            child: Text(
                                              'Follow',
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius: borderRadius(5),
                                            ),
                                            padding: spacing(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            child: Text(
                                              'Add to family',
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Image.asset(
                                            'assets/images/flag.png',
                                            width: width * 0.05,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: height * 0.26,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: spacing(
                                              horizontal: 10,
                                              vertical: 0,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'More info',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding: spacing(
                                                      vertical: 5,
                                                      horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    color: accent,
                                                    borderRadius:
                                                        borderRadius(width),
                                                  ),
                                                  child: SvgPicture.asset(
                                                    'assets/svg/post/info.svg',
                                                    width: width * 0.02,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                left: 0,
                                bottom: height * 0.07,
                                child: Center(
                                  child: Container(
                                    width: width * 0.95,
                                    alignment: Alignment.center,
                                    height: 1,
                                    color: darkGray,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                left: 0,
                                bottom: height * 0.01,
                                child: Container(
                                  padding: spacing(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        padding: spacing(
                                            horizontal: 10, vertical: 7),
                                        decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius: borderRadius(5),
                                        ),
                                        child: Text(
                                          'Message',
                                          style: TextStyle(
                                            color: white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        padding:
                                            spacing(horizontal: 5, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: medGray,
                                          borderRadius: borderRadius(10),
                                        ),
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: white,
                                        ),
                                      )
                                    ],
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
                            height: height * 0.6,
                            width: width * 0.95,
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, i) => Container(
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
                                      contentPadding: spacing(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      leading: const CircleAvatar(
                                        foregroundImage: AssetImage(
                                            'assets/images/streamer.jpg'),
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('David Millan'),
                                          Icon(Icons.keyboard_arrow_down)
                                        ],
                                      ),
                                      isThreeLine: true,
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Create a post'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text('5 minutes ago'),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Container(
                                                    width: width * 0.05,
                                                    child: const SvgIcon(
                                                      'assets/svg/globe.svg',
                                                      width: 16,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: const [
                                                  Text(
                                                    'Spooken words',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons.music_note,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons.menu_open_outlined,
                                                    size: 20,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text('Lovely Music'),
                                          Row(
                                            children: [
                                              Text(
                                                'Now all was as it seems',
                                                style: TextStyle(
                                                  fontSize: textXSm,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '#Love&Music',
                                                style: TextStyle(
                                                  color: orange,
                                                  fontSize: textXSm,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset('assets/images/cover.jpg'),
                                    SizedBox(
                                      height: height * 0.02,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    '465',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    '321',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    '212',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
