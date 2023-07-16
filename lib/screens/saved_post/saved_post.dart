import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/blog/recent.dart';
import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/search_bar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';

class SavedPost extends StatefulWidget {
  const SavedPost({super.key});

  @override
  State<SavedPost> createState() => _SavedPostState();
}

class _SavedPostState extends State<SavedPost> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      drawer: DrawerMenu(),
      key: _key,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                    
                    )
                  ],
                ),
                Container(
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.95,
                          height: height * 0.85,
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
                                    leading: const CircleAvatar(
                                      foregroundImage: AssetImage(
                                          'assets/images/streamer.jpg'),
                                    ),
                                    title: Text('David Millan'),
                                    subtitle: Row(
                                      children: [
                                        const Text('5 minutes ago'),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Container(
                                          width: width * 0.04,
                                          child: SvgPicture.asset(
                                            'assets/svg/globe.svg',
                                          ),
                                        )
                                      ],
                                    ),
                                    trailing: const Icon(
                                      Icons.more_horiz,
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
                        )
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
