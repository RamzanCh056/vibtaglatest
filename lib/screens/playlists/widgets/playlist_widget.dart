// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/screens/playlists/playlist/update_playlist.dart';
import 'package:vibetag/screens/playlists/playlists_detail.dart';

import '../../../utils/constant.dart';
import '../../../widgets/bottom_modal_sheet_widget.dart';
import '../playlist/create_playlist.dart';

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
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
  
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
          borderRadius: borderRadius(7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap(h: 5),
            ClipRRect(
              borderRadius: borderRadius(7),
              child: widget.playlist['cover'].toString().isNotEmpty
                  ? netImage(
                      getFullLink(
                        widget.playlist['cover'].toString(),
                      ),
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
            Container(
              width: width - 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: spacing(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.playlist['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        gap(h: 5),
                        Row(
                          children: [
                            Image.asset(
                              widget.playlist['private'].toString() == '0'
                                  ? 'assets/new/icons/lock.png'
                                  : 'assets/images/eye.png',
                            ),
                            gap(w: 10),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: grayMed,
                                borderRadius: borderRadius(width),
                              ),
                            ),
                            gap(w: 10),
                            Text(
                              widget.playlist['private'].toString() == '0'
                                  ? 'Private'
                                  : 'Public',
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      createBottomModalSheet(
                          context: context,
                          screen: UpdatePlaylist(
                            playlist: widget.playlist,
                          ));
                    },
                    child: Container(
                      padding: spacing(horizontal: 10, vertical: 5),
                      child: Image.asset(
                        'assets/images/more_v.png',
                        color: grayMed,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
