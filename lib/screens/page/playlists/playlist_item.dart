// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../utils/constant.dart';

class PlaylistItem extends StatefulWidget {
  VoidCallback onTap;
  bool isActive;
  final Map<String, dynamic> video;
  PlaylistItem({
    Key? key,
    required this.onTap,
    required this.isActive,
    required this.video,
  }) : super(key: key);

  @override
  State<PlaylistItem> createState() => _PlaylistItemState();
}

class _PlaylistItemState extends State<PlaylistItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isActive ? white : grayLight,
          boxShadow: boxShadow,
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
                  widget.video['postFileThumb'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            gap(w: 10),
            Container(
              width: width * 0.66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.video['postText']),
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
                                  '${getInK(number: int.parse(widget.video['videoViews'].toString()))} Views',
                                  style: TextStyle(
                                    color: grayMed,
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
                                  '${getInK(number: int.parse(widget.video['reactions'].toString()))} Reacts',
                                  style: TextStyle(
                                    color: grayMed,
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
      ),
    );
  }
}
