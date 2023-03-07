// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';
import '../video_player/Single_video_player.dart';
import '../video_player/video_player.dart';
import 'my_playlist.dart';
import 'other_playlist.dart';

class PlayListScreen extends StatefulWidget {
  final String playlist_id;
  const PlayListScreen({
    Key? key,
    required this.playlist_id,
  }) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int currentTab = 0;
  List<String> videoBar = [
    'Currently playing',
    'My Playlist',
    'Other Playlist'
  ];
  Map<String, dynamic> playlist = {};
  List<dynamic> videos = [];
  bool isLoading = false;
  String post_id = '';
  String video_url = '';
  String thumbnail = '';
  @override
  void initState() {
    super.initState();
    getPlaylists();
  }

  getPlaylists() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'playlist_api',
      'action': 'get_playlist_videos',
      'playlist_id': widget.playlist_id.toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body);
    playlist = response['playlist'];
    videos = response['data'];
    if (videos.length > 0) {
      post_id = videos[0]['post_id'].toString();
      video_url = videos[0]['postFile'].toString();
      thumbnail = videos[0]['postFileThumb'].toString();
    }
    setState(() {
      isLoading = false;
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
        child: Container(
          height: height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: isLoading
                ? Container(
                    height: height,
                    child: Center(
                      child: loadingSpinner(),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.125,
                        child: Column(
                          children: [NavBar(), Header()],
                        ),
                      ),
                      Container(
                        height: height * 0.885,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VideoMediaPlayer(
                                post_id: post_id,
                                videoUrl: video_url,
                                thumbnail: thumbnail,
                                videoTimer: true,
                              ),
                              gap(h: 15),
                              Container(
                                margin: spacing(horizontal: 7),
                                child: Text(
                                  'Playlists Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              gap(h: 5),
                              Container(
                                margin: spacing(horizontal: 7),
                                height: height * 0.05,
                                width: double.infinity,
                                child: ListView.builder(
                                    itemCount: videoBar.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      if (i == currentTab) {
                                        return Container(
                                          margin: spacing(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          padding: spacing(
                                            horizontal: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: orangePrimary,
                                            ),
                                            borderRadius: borderRadius(width),
                                          ),
                                          child: Center(
                                            child: Text(
                                              videoBar[i],
                                              style: TextStyle(
                                                color: orange,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return InkWell(
                                        onTap: () {
                                          currentTab = i;
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: spacing(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          padding: spacing(
                                            horizontal: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: borderRadius(width),
                                          ),
                                          child: Center(
                                            child: Text(
                                              videoBar[i],
                                              style: TextStyle(
                                                color: grayMed,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              ListView.builder(
                                  itemCount: videos.length,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics(),
                                  ),
                                  itemBuilder: (context, i) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: white,
                                      ),
                                      padding: spacing(
                                        horizontal: 7,
                                        vertical: 7,
                                      ),
                                      margin: spacing(vertical: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height * 0.08,
                                            width: width * 0.25,
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius(5),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: borderRadius(5),
                                              child: Image.network(
                                                videos[i]['postFileThumb'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          gap(w: 10),
                                          Container(
                                            width: width * 0.66,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: width * 0.6,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(videos[i]
                                                          ['postText']),
                                                      gap(h: 10),
                                                      Row(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/eye.png',
                                                                color: grayMed,
                                                              ),
                                                              gap(w: 5),
                                                              Text(
                                                                '${getInK(number: int.parse(videos[i]['videoViews'].toString()))} Views',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      grayMed,
                                                                  fontSize: 12,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          gap(w: 10),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/new/icons/favorite_heart.png',
                                                                color: grayMed,
                                                              ),
                                                              gap(w: 5),
                                                              Text(
                                                                '${getInK(number: int.parse(videos[i]['reactions'].toString()))} Reacts',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      grayMed,
                                                                  fontSize: 12,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/new/icons/more_v.png',
                                                  color: grayMed,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
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
