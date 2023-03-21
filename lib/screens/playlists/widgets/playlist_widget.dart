// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/screens/playlists/playlists_detail.dart';

import '../../../utils/constant.dart';

class PlaylistWidget extends StatefulWidget {
  Map<String, dynamic> playlist;
  PlaylistWidget({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  State<PlaylistWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return InkWell(
      onTap: () {
        pushRoute(
          context: context,
          screen: PlayListScreen(
            playlist: widget.playlist,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: spacing(
          horizontal: width * 0.025,
          vertical: height * 0.01,
        ),
        margin: spacing(
          vertical: height * 0.005,
        ),
        decoration: BoxDecoration(
          color: white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap(h: 5),
            Padding(
              padding: spacing(
                horizontal: 15,
              ),
              child: Text(
                widget.playlist['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap(h: 10),
            ClipRRect(
              borderRadius: borderRadius(7),
              child: widget.playlist['cover'] != ''
                  ? Image.network(
                      widget.playlist['cover'].toString().contains(serverUrl)
                          ? widget.playlist['cover']
                          : '${serverUrl}${widget.playlist['cover']}',
                    )
                  : Container(
                      height: height * 0.25,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/photo.svg',
                          width: width * 0.15,
                        ),
                      ),
                    ),
            ),
            gap(h: 10),
          ],
        ),
      ),
    );
  }
}
