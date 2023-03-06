// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';

import 'package:vibetag/screens/playlists/playlist/create_playlist.dart';
import 'package:vibetag/screens/playlists/playlist/playlist_pop.dart';

import '../../../utils/constant.dart';
import '../../../widgets/bottom_modal_sheet_widget.dart';

class PlayListOption extends StatefulWidget {
  final String music_id;
  const PlayListOption({
    Key? key,
    required this.music_id,
  }) : super(key: key);

  @override
  State<PlayListOption> createState() => _PlayListOptionState();
}

class _PlayListOptionState extends State<PlayListOption> {
  bool isLoading = false;
  List<Widget> playlists = [];

  @override
  void initState() {
    super.initState();
    getPlaylist();
  }

  getPlaylist() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'playlist_api',
      'action': 'get_my_playlist',
      'user_id': loginUserId.toString(),
      'music_id': widget.music_id.toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body)['data'];
    for (var playlist in response) {
      playlists.add(
        PlayListPop(
          playlist: playlist,
          post_id: widget.music_id,
        ),
      );
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      height: height * 0.6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            gap(h: 30),
            Text(
              'Save to',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            gap(h: 10),
            Text(
              'Select the playlist to save the video',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: grayMed,
                fontSize: 10,
              ),
            ),
            gap(h: 15),
            InkWell(
              onTap: () {
                pop(context);
                createBottomModalSheet(
                  context: context,
                  screen: CreatePlaylist(
                    music_id: widget.music_id.toString(),
                  ),
                );
              },
              child: Container(
                padding: spacing(horizontal: 20, vertical: 15),
                margin: spacing(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: grayLight,
                  borderRadius: borderRadius(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/new/images/video_icons/playlist.png',
                      color: grayMed,
                    ),
                    gap(w: 10),
                    Text(
                      'Create new playlist',
                      style: TextStyle(
                        color: blackLight,
                      ),
                    )
                  ],
                ),
              ),
            ),
            isLoading
                ? loadingSpinner()
                : SingleChildScrollView(
                    child: Column(
                      children: playlists,
                    ),
                  ),
            gap(h: 30),
            Container(
              width: double.maxFinite,
              padding: spacing(vertical: 15),
              margin: spacing(horizontal: 25),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: borderRadius(10),
                gradient: gradient,
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
