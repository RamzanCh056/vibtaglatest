import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/buzz/buzzin_player.dart';

import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/video_player/video_player.dart';

import '../../utils/constant.dart';

class Buzzin extends StatefulWidget {
  const Buzzin({super.key});

  @override
  State<Buzzin> createState() => _BuzzinState();
}

class _BuzzinState extends State<Buzzin> {
  final TextEditingController search = TextEditingController();
  int pageIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  List<String> not_ids = [];

  void SliderScroll() {
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (mounted) {
          if (pageIndex == (comments.length - 1)) {
            setState(() {
              pageIndex = 0;
            });
          } else {
            setState(() {
              pageIndex++;
            });
          }

          // pageController.animateToPage(pageIndex,
          //     duration: Duration(milliseconds: 1000), curve: Curves.easeInSine);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getBuzzin();
    setComments();
  }

  List<String> comments = [
    'Khan',
    'Filler text is text that shares some characteristics of a real written text, but is random or otherwise generated. It may be used to display a sample of fonts, generate text for testing, or to spoof an e-mail spam filter',
    'Umair'
  ];

  List<Widget> commentsList = [];
  setComments() {
    commentsList = [];
    for (var i = 0; i < comments.length; i++) {
      commentsList.add(Container(
        padding: spacing(horizontal: 7),
        alignment: Alignment.centerLeft,
        child: Text(
          comments[i],
          style: TextStyle(
            color: white,
            fontSize: 10,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.start,
        ),
      ));
    }
  }

  late List<dynamic> buzzin;
  bool isLoading = false;

  getBuzzin() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'buzzin',
      'sub_type': 'get_buzzin',
      'user_id': loginUserId,
    };
    final result = await API().postData(data);
    buzzin = jsonDecode(result.body)['data'];
    setState(() {
      isLoading = false;
    });
    SliderScroll();
  }

  loadMoreBuzzin() async {
    for (var i = 0; i < buzzin.length; i++) {
      not_ids.add(buzzin[i]['id']);
    }
    String not_included = not_ids.toString();

    final data = {
      'type': 'buzzin',
      'sub_type': 'load_more_buzzin',
      'user_id': loginUserId,
      'category': '',
      'not_ids': not_included.substring(1, (not_included.length - 1)),
    };
    final result = await API().postData(data);
    List<dynamic> buzzData = jsonDecode(result.body)['data'];
    if (buzzData.length > 0) {
      for (var i = 0; i < buzzData.length; i++) {
        buzzin.add(buzzData[i]);
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: darkGray,
      drawer: DrawerMenu(),
      body: isLoading
          ? loadingSpinner()
          : Container(
              height: height * 0.93,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: buzzin.length,
                  itemBuilder: (context, i) {
                    if (i == (buzzin.length - 1)) {
                      loadMoreBuzzin();
                    }
                    return Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: blackPrimary,
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //     buzzin[i]['postFileThumb'],
                        //   ),
                        // ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: BuzzinPlayer(
                              thumbnail: buzzin[i]['postFileThumb'],
                              videoUrl: buzzin[i]['postFile_full'],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: Container(
                              width: width,
                              padding: spacing(
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * 0.08,
                                    height: width * 0.08,
                                    child: SvgPicture.asset(
                                        'assets/new/svg/buzzin/back.svg'),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: width * 0.08,
                                        height: width * 0.08,
                                        decoration: BoxDecoration(
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: SvgPicture.asset(
                                            'assets/new/svg/buzzin/search.svg'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: borderRadius(width),
                                        child: Image.network(
                                          buzzin[i]['publisher']['avatar'],
                                          width: width * 0.08,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 10,
                            child: Container(
                              width: width * 0.95,
                              padding: spacing(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              'assets/new/images/border.png',
                                            ),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding: spacing(
                                                horizontal: 2,
                                                vertical: 2,
                                              ),
                                              decoration: const BoxDecoration(),
                                              child: Container(
                                                padding: spacing(
                                                  horizontal: 3,
                                                  vertical: 3,
                                                ),
                                                child: buzzin[i]['publisher']
                                                            ['avatar'] !=
                                                        ''
                                                    ? CircleAvatar(
                                                        foregroundImage:
                                                            NetworkImage(
                                                          buzzin[i]['publisher']
                                                              ['avatar'],
                                                        ),
                                                        radius: width * 0.07,
                                                      )
                                                    : gap(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            buzzin[i]['publisher']['name'],
                                            style: TextStyle(
                                              color: white,
                                              fontSize: textSm,
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.7,
                                            child: Html(
                                              data: buzzin[i]['postText'],
                                              style: {
                                                "body": Style(
                                                  fontSize: FontSize(12.0),
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  color: white,
                                                  maxLines: 1,
                                                ),
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: width * 0.7,
                                    height: height * 0.04,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(76, 255, 255, 255),
                                      borderRadius: borderRadius(width),
                                      border: Border.all(
                                        width: 1,
                                        color: whitePrimary,
                                      ),
                                    ),
                                    child: PageView(
                                      reverse: true,
                                      onPageChanged: (index) {
                                        pageIndex = index;
                                      },
                                      scrollDirection: Axis.horizontal,
                                      controller: pageController,
                                      children: commentsList,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: width * 0.07,
                                  child: SvgPicture.asset(
                                      'assets/new/svg/buzzin/heart.svg'),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${getInK(number: int.parse(buzzin[i]['reaction']['count'].toString()))}',
                                  style: TextStyle(
                                    color: whitePrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: width * 0.07,
                                  child: SvgPicture.asset(
                                      'assets/new/svg/buzzin/Iconly/Light-Outline/Chat.svg'),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${getInK(number: int.parse(buzzin[i]['post_comments'].toString()))}',
                                  style: TextStyle(
                                    color: whitePrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: width * 0.06,
                                  child: Image.asset(
                                    'assets/new/icons/revibe.png',
                                    color: white,
                                    width: width * 0.06,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${getInK(number: int.parse(buzzin[i]['post_shares'].toString()))}',
                                  style: TextStyle(
                                    color: whitePrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  child: SvgPicture.asset(
                                      'assets/new/svg/buzzin/more_h.svg'),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isMuted = !isMuted;
                                    });
                                  },
                                  child: Container(
                                    child: Icon(
                                      isMuted
                                          ? Icons.volume_off_outlined
                                          : Icons.volume_up_outlined,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
    );
  }
}
