import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/find%20vibes/widget/find_vibes_widget.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/home/post_types/post_file.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:path/path.dart' as p;
import 'package:visibility_detector/visibility_detector.dart';

import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';

class FindVibes extends StatefulWidget {
  const FindVibes({super.key});

  @override
  State<FindVibes> createState() => _FindVibesState();
}

class _FindVibesState extends State<FindVibes> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isLoading = false;
  bool isLoadMoreCall = false;
  List<dynamic> vibes = [];
  List<Map<String, dynamic>> vibesCategories = [];
  List<Widget> vibeWidgets = [];
  List<String> vibesIds = [];
  List<dynamic> rawData = [];
  String selectedCategory = '';
  bool isNoMorePost = false;

  List<String> images = [
    'assets/images/findvibe/findvibOne.png',
    'assets/images/findvibe/findvibTwo.png',
    'assets/images/findvibe/findvibThree.png',
    'assets/images/findvibe/findvibTwo.png',
  ];
  List<String> postImages = [
    'assets/images/findvibe/postOne.png',
    'assets/images/findvibe/postTwo.png',
    'assets/images/findvibe/postThree.png',
  ];

  List<String> name = [
    'Entertainment',
    'Architecture',
    'Asian Music',
    'Architecture',
  ];
  List<String> userName = [
    'Gwen Stacy',
    'Gwen CH',
    'Vib Gwen',
  ];
  void initState() {
    super.initState();
    getVibes();
  }

  Future<void> vibeCategories() async {
    final response = await API()
        .postData({'type': 'get_post_categories', 'user_id': '${loginUserId}'});
    Map<String, dynamic> allCategories = jsonDecode(response.body)['data'];
    for (var category in allCategories['Explore']) {
      vibesCategories.add(category);
    }
    for (var category in allCategories['Leisure']) {
      vibesCategories.add(category);
    }
    for (var category in allCategories['Lifestyle']) {
      vibesCategories.add(category);
    }
    for (var category in allCategories['MusicAudio']) {
      vibesCategories.add(category);
    }
    for (var category in allCategories['TVProgrammes']) {
      vibesCategories.add(category);
    }
    for (var category in allCategories['SocietyEnvironment']) {
      vibesCategories.add(category);
    }
    vibesCategories.shuffle();
  }

  Future<void> getVibes({bool loadCategories = true}) async {
    setState(() {
      isLoading = true;
    });
    vibesIds = [];
    vibeWidgets = [];
    if (loadCategories) {
      await vibeCategories();
    } else {
      vibesCategories.shuffle();
    }
    final data = {
      'type': 'find_vibes',
      'action': 'find_vibes',
      'limit': '30',
      'cat': selectedCategory,
      'after_id': '0',
    };

    final response = await API().postData(data);
    rawData = jsonDecode(response.body)['data'];
    for (var post in rawData) {
      String fileExtension = p.extension(post['postFile']);
      bool is_video = isVideo(ex: fileExtension);
      bool is_Image = IsImage(post['postFile']);
      if (is_video || is_Image) {
        vibes.add(post);
      }
    }
    for (var vibe in vibes) {
      if (!(vibesIds.contains(vibe['post_id'].toString()))) {
        vibesIds.add(vibe['post_id']);
        vibeWidgets.add(
          FindVibesWidget(post: vibe),
        );
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> getMoreVibes() async {
    isLoadMoreCall = true;
    final data = {
      'type': 'find_vibes',
      'action': 'find_more_vibes',
      'limit': '30',
      'cat': selectedCategory,
      'after_id': rawData.length == 0
          ? '0'
          : rawData[(rawData.length - 1)]['post_id'].toString(),
    };

    final response = await API().postData(data);
    rawData = jsonDecode(response.body)['data'];
    for (var post in rawData) {
      String fileExtension = p.extension(post['postFile']);
      bool is_video = isVideo(ex: fileExtension);
      bool is_Image = IsImage(post['postFile']);
      if (is_video || is_Image) {
        vibes.add(post);
      }
    }
    for (var vibe in vibes) {
      if (!(vibesIds.contains(vibe['post_id'].toString()))) {
        vibesIds.add(vibe['post_id']);
        vibeWidgets.add(
          FindVibesWidget(post: vibe),
        );
      }
    }
    if (rawData.length == 0) {
      isNoMorePost = true;
    }
    setState(() {
      isLoadMoreCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: _key,
      backgroundColor: HexColor('#F1F4FB'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const NavBar(),
                  Header(),
                ],
              ),
              SingleChildScrollView(
                child: isLoading
                    ? loadingSpinner()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 6)
                                ]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width,
                                  height: height * 0.25,
                                  margin: spacing(
                                    horizontal: 5,
                                    vertical: 0,
                                  ),
                                  child: ListView.builder(
                                    itemCount: vibesCategories.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      return InkWell(
                                        onTap: () {
                                          selectedCategory =
                                              vibesCategories[i]['id'];
                                          getVibes(loadCategories: false);
                                        },
                                        child: Container(
                                          width: width * 0.29,
                                          height: height * 0.25,
                                          margin: spacing(
                                              horizontal: 5, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: borderRadius(
                                              10,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * 0.2,
                                                child: ClipRRect(
                                                  borderRadius: borderRadius(
                                                    10,
                                                  ),
                                                  child: Image.network(
                                                    '${vibesCategories[i]['img']}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: double.maxFinite,
                                                  child: Text(
                                                    vibesCategories[i]['name'],
                                                    style: TextStyle(
                                                      color:
                                                          HexColor('#000000'),
                                                    ),
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
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Column(
                                children: vibeWidgets,
                              ),
                              isNoMorePost
                                  ? Center(
                                      child: Text('No more vibes'),
                                    )
                                  : VisibilityDetector(
                                      key: Key('findVibes'),
                                      child: loadingSpinner(),
                                      onVisibilityChanged: (info) {
                                        if (info.visibleFraction > 0.25 &&
                                            !isLoadMoreCall &&
                                            rawData.length > 0) {
                                          getMoreVibes();
                                        }
                                      },
                                    ),
                              gap(h: 25),
                            ],
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
