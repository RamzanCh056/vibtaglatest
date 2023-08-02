// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../../methods/api.dart';
import '../../../utils/constant.dart';
import '../../video_player/Single_video_player.dart';
import '../../video_player/video_player.dart';
import 'my_playlist.dart';
import 'other_playlist.dart';

class PlayList extends StatefulWidget {
  int currentPlay;
  PlayList({
    Key? key,
    this.currentPlay = 0,
  }) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  int currentTab = 0;
  List<String> playListBar = ['My Playlist', 'Other Playlist'];
  List<Widget> screen = [MyPlaylist(), OtherPlayList()];

  @override
  void initState() {
    currentTab = widget.currentPlay;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     width = deviceWidth(context: context);
     height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: HexColor('#F1F4FB'),
      body: SafeArea(
        child: Container(
          height: height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
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
                        Container(
                          height: height * 0.06,
                          margin: spacing(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.8,
                                child: ListView.builder(
                                  itemCount: playListBar.length,
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
                                            playListBar[i],
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
                                            playListBar[i],
                                            style: TextStyle(
                                              color: grayMed,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: grayMed,
                                  borderRadius: borderRadius(width),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/new/icons/search.png',
                                    color: white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * 0.82,
                          child: screen[currentTab],
                        ),
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
