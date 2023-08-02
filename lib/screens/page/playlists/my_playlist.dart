import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vibetag/screens/page/playlists/widgets/playlist_widget.dart';

import '../../../methods/api.dart';
import '../../../utils/constant.dart';

class MyPlaylist extends StatefulWidget {
  const MyPlaylist({Key? key}) : super(key: key);

  @override
  State<MyPlaylist> createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  List<dynamic> playlists = [];
  List<Widget> playlistList = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getMyPlaylists();
  }

  getMyPlaylists() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'playlist_api',
      'action': 'get_my_playlist',
      'user_id': loginUserId == '' ? '1724025' : loginUserId.toString(),
      'music_id': '0',
    };
    final result = await API().postData(data);
    playlists = jsonDecode(result.body)['data'];
    for (var playlist in playlists) {
      playlistList.add(PlaylistWidget(
        playlist: playlist,
      ));
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
    return Scaffold(
      body: Container(
        child: isLoading
            ? loadingSpinner()
            : playlists.length > 0
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        gap(h: 10),
                        SingleChildScrollView(
                            child: Column(
                          children: playlistList,
                        ))
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/findvibe/empty.png"),
                        const Text('There is no playlist yet!',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff000000))),
                        const Text(
                          'Create your new playlist buy clicking the button below & add whatever you want!',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff7D8CAC),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.menu,
                                  size: 28,
                                  color: Color(0xff99A7C7),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Create new playlist',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff99A7C7)))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
