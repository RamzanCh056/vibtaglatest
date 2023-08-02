import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/page/playlists/playlists_detail.dart';

import '../../../utils/constant.dart';
import '../../../widgets/footer.dart';

class OtherPlayList extends StatefulWidget {
  const OtherPlayList({Key? key}) : super(key: key);

  @override
  State<OtherPlayList> createState() => _OtherPlayListState();
}

class _OtherPlayListState extends State<OtherPlayList> {
  List<dynamic> popular = [];
  List<dynamic> latest = [];
  Map<String, dynamic> response = {};
  bool isloading = false;

  getAllPlaylists() async {
    isloading = true;
    setState(() {});
    final result = await API()
        .postData({'type': 'playlist_api', 'action': 'get_all_playlist'});
    response = jsonDecode(result.body);
    int indexPlaylist = 0;
    for (var playlist in response['data']) {
      if (indexPlaylist % 2 == 0) {
        popular.add(playlist);
      } else {
        latest.add(playlist);
      }
      indexPlaylist++;
    }
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    getAllPlaylists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return isloading
        ? loadingSpinner()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Popular Playlist",
                            style: TextStyle(
                              color: HexColor('#000000'),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * 0.26,
                          margin: spacing(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: popular.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  pushRoute(
                                    context: context,
                                    screen: PlayListScreen(
                                      playlist: popular[index],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: width * 0.45,
                                  height: height * 0.26,
                                  margin: spacing(horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(
                                      10,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: height * 0.2,
                                            width: 450,
                                            child: ClipRRect(
                                              borderRadius: borderRadius(
                                                10,
                                              ),
                                              child: Image.network(
                                                popular[index]['cover'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // const Positioned.fill(
                                          //     child: Align(
                                          //         alignment:
                                          //             Alignment.bottomCenter,
                                          //         child: Text(
                                          //           "12 Videos",
                                          //           style: TextStyle(
                                          //               color: Colors.white),
                                          //         )))
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          width: double.maxFinite,
                                          child: Text(
                                            popular[index]['name'],
                                            style: TextStyle(
                                              color: HexColor('#000000'),
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Latest Playlist",
                            style: TextStyle(
                              color: HexColor('#000000'),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * 0.26,
                          margin: spacing(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: latest.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  pushRoute(
                                    context: context,
                                    screen: PlayListScreen(
                                      playlist: latest[index],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: width * 0.45,
                                  height: height * 0.26,
                                  margin: spacing(horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(
                                      10,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: height * 0.2,
                                            width: 450,
                                            child: ClipRRect(
                                              borderRadius: borderRadius(
                                                10,
                                              ),
                                              child: Image.network(
                                                latest[index]['cover'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // const Positioned.fill(
                                          //     child: Align(
                                          //         alignment:
                                          //             Alignment.bottomCenter,
                                          //         child: Text(
                                          //           "12 Videos",
                                          //           style: TextStyle(
                                          //               color: Colors.white),
                                          //         )))
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          width: double.maxFinite,
                                          child: Text(
                                            latest[index]['name'],
                                            style: TextStyle(
                                              color: HexColor('#000000'),
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Sponserd",
                            style: TextStyle(
                              color: HexColor('#000000'),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        gap(h: 7),
                        InkWell(
                          onTap: () async {
                            await launchUrl(response['sponsored']['url']);
                          },
                          child: Container(
                            width: double.infinity,
                            margin: spacing(horizontal: 7),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                response['sponsored']['ad_media'],
                              ),
                            ),
                          ),
                        ),
                        gap(h: 7),
                        Container(
                          margin: spacing(horizontal: 16),
                          child: Text(
                            response['sponsored']['description'],
                            maxLines: 2,
                          ),
                        ),
                        gap(h: 7),
                        InkWell(
                          onTap: () async {
                            await launchUrl(response['sponsored']['url']);
                          },
                          child: Container(
                            margin: spacing(horizontal: 16),
                            child: Text(
                              response['sponsored']['url'],
                              style: TextStyle(
                                color: orange,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        gap(h: 7),
                      ],
                    ),
                  ),
                  gap(h: 45),
                ],
              ),
            ),
          );
  }
}
