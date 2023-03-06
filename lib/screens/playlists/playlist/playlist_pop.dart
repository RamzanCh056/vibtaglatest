// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vibetag/methods/api.dart';

import '../../../utils/constant.dart';

class PlayListPop extends StatefulWidget {
  final Map<String, dynamic> playlist;
  final String post_id;
  const PlayListPop({
    Key? key,
    required this.playlist,
    required this.post_id,
  }) : super(key: key);

  @override
  State<PlayListPop> createState() => _PlayListPopState();
}

class _PlayListPopState extends State<PlayListPop> {
  @override
  bool inPlaylist = false;

  @override
  void initState() {
    super.initState();
    isInPlaylist();
  }

  isInPlaylist() {
    inPlaylist = widget.playlist['current'] == 'No' ? false : true;
  }

  addOrRemoveFromPlaylist() async {
    var data = {};
    setState(() {});
    if (inPlaylist) {
      data = {
        'type': 'playlist_api',
        'action': 'add_delete_to_exisitng_playlist',
        'task': 'add',
        'user_id': loginUserId.toString(),
        'music_id': widget.post_id.toString(),
        'playlist': widget.playlist['p_id'].toString(),
      };
    } else {
      data = {
        'type': 'playlist_api',
        'action': 'add_delete_to_exisitng_playlist',
        'task': 'delete',
        'user_id': loginUserId.toString(),
        'music_id': widget.post_id.toString(),
        'playlist': widget.playlist['p_id'].toString(),
      };
    }
    final result = await API().postData(data);
    final response = jsonDecode(result.body);
 
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        inPlaylist = !inPlaylist;
        addOrRemoveFromPlaylist();
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
            inPlaylist
                ? Icon(
                    Icons.check_box,
                    color: orange,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    color: grayMed,
                  ),
            gap(w: 10),
            Text(
              widget.playlist['name'],
              style: TextStyle(
                color: blackLight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
