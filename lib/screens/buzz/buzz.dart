import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/buzz/buzzin_player.dart';
import 'package:vibetag/screens/buzz/category_item.dart';
import 'package:vibetag/screens/buzz/widget/buzz_bar.dart';
import 'package:vibetag/screens/buzz/widget/comment_bar.dart';
import 'package:vibetag/screens/buzz/widget/owner_bar.dart';

import 'package:vibetag/screens/hast_tag/tred_screen.dart';

import '../../utils/constant.dart';
import '../../widgets/bottom_modal_sheet_widget.dart';
import '../home/comment/widget/post_comment_bar.dart';
import '../home/post_methods/post_methods.dart';
import '../home/revibe.dart';

class Buzzin extends StatefulWidget {
  const Buzzin({super.key});

  @override
  State<Buzzin> createState() => _BuzzinState();
}

class _BuzzinState extends State<Buzzin> {
  final TextEditingController search = TextEditingController();

  List<String> not_ids = [];
  List<String> likedIds = [];

  bool showSearchbar = false;
  bool isFocusCategory = false;
  List<dynamic> categories = [];
  List<dynamic> searchedVideos = [];
  List<Widget> categoriesList = [];
  List<Widget> searchedVideosList = [];
  String buzzCategory = '';
  String post_id = '';
  bool interest_search = true;
  bool toggleBar = false;

  @override
  void initState() {
    super.initState();
    getBuzzin();
  }

  List<dynamic> buzzin = loadedBuzzin;
  bool isLoading = false;

  getBuzzin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // if (pref.getString('buzzin') != null) {
    //   buzzin = jsonDecode(pref.getString('buzzin')!);
    // }
    if (buzzin.length == 0) {
      setState(() {
        isLoading = true;
      });
      final data = {
        'type': 'buzzin',
        'sub_type': 'get_buzzin',
        'user_id': loginUserId,
        'category': buzzCategory,
        'query': '',
        'post_id': post_id,
      };
      final result = await API().postData(data);
      buzzin = jsonDecode(result.body)['data'];
      pref.setString(
        'buzzin',
        jsonEncode(jsonEncode(buzzin)),
      );
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }

    getBuzzinCategory();
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
      'category': buzzCategory,
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

  getBuzzinCategory() async {
    final data = {
      'type': 'buzzin',
      'sub_type': 'get_buzzin_categories',
    };
    final result = await API().postData(data);
    categories = jsonDecode(result.body);
    if (categories.length > 0) {
      for (var i = 0; i < categories.length; i++) {
        categoriesList.add(
          InkWell(
            onTap: () {
              buzzin = [];
              buzzCategory = categories[i]['id'];
              isFocusCategory = !isFocusCategory;
              getBuzzin();
            },
            child: CategoryItem(
              title: categories[i]['name'],
            ),
          ),
        );
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  buzzinSearch() async {
    final data = {
      'type': 'buzzin',
      'sub_type': 'get_buzzin_post_suggestion',
      'keyword': search.text.toString(),
    };
    final result = await API().postData(data);
    searchedVideos = jsonDecode(result.body)['data'];
    setSearchedVideos();
  }

  getBuzzinSearchedVideos() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'buzzin',
      'sub_type': 'get_buzzin',
      'user_id': loginUserId,
      'category': buzzCategory,
      'query': '',
      'post_id': post_id,
    };
    final result = await API().postData(data);
    buzzin = jsonDecode(result.body)['data'];

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  setSearchedVideos() {
    for (var video in searchedVideos) {
      searchedVideosList.add(
        InkWell(
          onTap: () {
            post_id = '${video['post_id']}';
            getBuzzinSearchedVideos();
            isFocusCategory = !isFocusCategory;
            setState(() {});
          },
          child: Container(
            width: width - 45,
            padding: spacing(vertical: 7, horizontal: 7),
            margin: spacing(vertical: 5),
            decoration: BoxDecoration(
              color: HexColor('#232323'),
              boxShadow: lightShadow,
              borderRadius: borderRadius(5),
            ),
            child: Text(
              video['postText'],
              style: TextStyle(
                fontSize: 12,
                color: white,
              ),
              maxLines: 3,
            ),
          ),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: darkGray,
      body: isLoading
          ? loadingSpinner()
          : Container(
              height: height * 0.93,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: buzzin.length,
                  itemBuilder: (context, i) {
                    if (buzzin[i]['reaction']['is_reacted']) {
                      likedIds.add(buzzin[i]['post_id'].toString());
                    }
                    if (i == (buzzin.length - 5)) {
                      loadMoreBuzzin();
                    }
                    return Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: blackPrimary,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              height: height * 0.93,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset.zero,
                                    color: Color.fromARGB(54, 0, 0, 0),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),
                              child: Opacity(
                                opacity: 0.1,
                                child: Image.network(
                                  buzzin[i]['postFileThumb'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: BuzzinPlayer(
                              thumbnail: buzzin[i]['postFileThumb'],
                              videoUrl: buzzin[i]['postFile_full'],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: showSearchbar
                                ? Column(
                                    children: [
                                      Container(
                                        width: width * 0.9,
                                        margin: spacing(horizontal: 15),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              bottom: 0,
                                              child: Image.asset(
                                                'assets/new/icons/buzzin_search.png',
                                                color: grayMed,
                                              ),
                                            ),
                                            isFocusCategory
                                                ? Positioned(
                                                    right: 0,
                                                    top: 0,
                                                    bottom: 0,
                                                    child: InkWell(
                                                      onTap: () {
                                                        isFocusCategory =
                                                            !isFocusCategory;
                                                        setState(() {});
                                                      },
                                                      child: Image.asset(
                                                        'assets/icons/clear_comment_1.png',
                                                      ),
                                                    ),
                                                  )
                                                : gap(),
                                            Container(
                                              height: height * 0.05,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 2,
                                                  color: grayMed,
                                                ),
                                                borderRadius:
                                                    borderRadius(width),
                                              ),
                                              child: TextFormField(
                                                controller: search,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    if (interest_search) {
                                                      setState(() {
                                                        interest_search = false;
                                                      });
                                                    }
                                                    buzzinSearch();
                                                  } else {
                                                    if (!interest_search) {
                                                      setState(() {
                                                        interest_search = true;
                                                      });
                                                    }
                                                  }
                                                },
                                                onTap: () {
                                                  setState(() {
                                                    isFocusCategory =
                                                        !isFocusCategory;
                                                  });
                                                },
                                                onTapOutside: (e) {
                                                  if (!isFocusCategory) {
                                                    setState(() {
                                                      showSearchbar =
                                                          !showSearchbar;
                                                    });
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  hintText: 'Search by post',
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                    left: 40,
                                                    right: 40,
                                                    bottom: 10,
                                                  ),
                                                  hintStyle: TextStyle(
                                                    color: grayMed,
                                                  ),
                                                ),
                                                style: TextStyle(
                                                  color: grayMed,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      gap(h: 10),
                                      isFocusCategory
                                          ? Center(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            interest_search =
                                                                true;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding: spacing(
                                                            horizontal: 20,
                                                            vertical: 7,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                interest_search
                                                                    ? orange
                                                                    : white,
                                                            borderRadius:
                                                                borderRadius(
                                                                    width),
                                                            boxShadow:
                                                                boxShadow,
                                                          ),
                                                          child: Text(
                                                            'Search by interests',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  interest_search
                                                                      ? white
                                                                      : orange,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      gap(w: 10),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            interest_search =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding: spacing(
                                                            horizontal: 20,
                                                            vertical: 7,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                !interest_search
                                                                    ? orange
                                                                    : white,
                                                            borderRadius:
                                                                borderRadius(
                                                                    width),
                                                            boxShadow:
                                                                boxShadow,
                                                          ),
                                                          child: Text(
                                                            'Search by post',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  !interest_search
                                                                      ? white
                                                                      : orange,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  gap(h: 10),
                                                  Container(
                                                    width: width - 14,
                                                    height: height * 0.6,
                                                    margin:
                                                        spacing(horizontal: 7),
                                                    padding: spacing(
                                                      horizontal: 15,
                                                      vertical: 10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#3D3D3D'),
                                                      borderRadius:
                                                          borderRadius(10),
                                                      border: Border.all(
                                                        width: 1,
                                                        color: grayMed,
                                                      ),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          interest_search
                                                              ? Wrap(
                                                                  children:
                                                                      categoriesList,
                                                                )
                                                              : Column(
                                                                  children:
                                                                      searchedVideosList,
                                                                ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : gap(),
                                    ],
                                  )
                                : Container(
                                    width: width,
                                    padding: spacing(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width * 0.08,
                                          height: width * 0.08,
                                          child: SvgPicture.asset(
                                              'assets/new/svg/buzzin/back.svg'),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  showSearchbar =
                                                      !showSearchbar;
                                                });
                                              },
                                              child: Container(
                                                width: width * 0.08,
                                                height: width * 0.08,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      borderRadius(width),
                                                ),
                                                child: SvgPicture.asset(
                                                    'assets/new/svg/buzzin/search.svg'),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            ClipRRect(
                                              borderRadius: borderRadius(width),
                                              child: Image.network(
                                                buzzin[i]['publisher']
                                                    ['avatar'],
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
                                                        radius: width * 0.05,
                                                      )
                                                    : gap(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: width * 0.15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: spaceOnly(left: 10),
                                              child: Text(
                                                buzzin[i]['publisher']['name'],
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: width * 0.7,
                                              child: Html(
                                                shrinkWrap: true,
                                                onAnchorTap:
                                                    (str, rndr, map, e) {
                                                  pushRoute(
                                                    context: context,
                                                    screen: HashTrend(
                                                        hashTag: e!.text
                                                                .toString()
                                                                .contains('#')
                                                            ? e.text
                                                                .toString()
                                                                .replaceFirst(
                                                                    RegExp(
                                                                        r'#'),
                                                                    '')
                                                            : e.text
                                                                .toString()),
                                                  );
                                                },
                                                data: buzzin[i]['postText'],
                                                style: {
                                                  "body": Style(
                                                    fontSize: FontSize(8.0),
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
                                    child: buzzin[i]['all_comments'].length == 0
                                        ? Container(
                                            padding: spacing(horizontal: 7),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'No Comment there yet!',
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 10,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          )
                                        : BuzzinCommentBar(
                                            comments: buzzin[i]['all_comments'],
                                          ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 5,
                            child: isFocusCategory
                                ? gap()
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          if (likedIds.contains(buzzin[i]
                                                  ['post_id']
                                              .toString())) {
                                            likedIds.remove(buzzin[i]['post_id']
                                                .toString());
                                            setState(() {});

                                            await PostMethods().removeReact(
                                              post_id: buzzin[i]['post_id']
                                                  .toString(),
                                            );
                                          } else {
                                            likedIds.add(buzzin[i]['post_id']
                                                .toString());
                                            setState(() {});

                                            await PostMethods().reactOnPost(
                                              post_id: buzzin[i]['post_id'],
                                              reactionValue: '2',
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: width * 0.07,
                                          child: SvgPicture.asset(
                                            'assets/new/svg/buzzin/heart.svg',
                                            color: likedIds.contains(buzzin[i]
                                                        ['post_id']
                                                    .toString())
                                                ? red
                                                : white,
                                          ),
                                        ),
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
                                      InkWell(
                                        onTap: () {
                                          PostComments(
                                            context: context,
                                            postId:
                                                buzzin[i]['post_id'].toString(),
                                          );
                                        },
                                        child: Container(
                                          width: width * 0.07,
                                          child: SvgPicture.asset(
                                              'assets/new/svg/buzzin/Iconly/Light-Outline/Chat.svg'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${getInK(number: int.parse(buzzin[i]['total_comments'].toString()))}',
                                        style: TextStyle(
                                          color: whitePrimary,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Revibe(context: context);
                                        },
                                        child: Container(
                                          width: width * 0.06,
                                          child: Image.asset(
                                            'assets/new/icons/revibe.png',
                                            color: white,
                                            width: width * 0.06,
                                          ),
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
                                      InkWell(
                                        onTap: () {
                                          toggleBar = !toggleBar;
                                          createBottomModalSheet(
                                            context: context,
                                            screen: toggleBar
                                                ? OwnerBar()
                                                : BuzzinBottomBar(),
                                          );
                                        },
                                        child: Container(
                                          child: SvgPicture.asset(
                                              'assets/new/svg/buzzin/more_h.svg'),
                                        ),
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
