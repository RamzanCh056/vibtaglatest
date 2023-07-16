// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:vibetag/screens/header/const.dart';
import 'package:vibetag/screens/profile/profile_photo_timeline.dart';

import '../../../utils/constant.dart';
import '../../hast_tag/tred_screen.dart';

class PostSearchWidget extends StatefulWidget {
  final Map<String, dynamic> post;
  final List<dynamic> postsList;
  const PostSearchWidget({
    Key? key,
    required this.post,
    required this.postsList,
  }) : super(key: key);

  @override
  State<PostSearchWidget> createState() => _PostSearchWidgetState();
}

class _PostSearchWidgetState extends State<PostSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearchOption = false;
        setState(() {});
        pushRoute(
          context: context,
          screen: ProfilePhotoTimeline(
            first: widget.post,
            posts: widget.postsList,
          ),
        );
      },
      child: Container(
        margin: spacing(
          horizontal: 15,
        ),
        padding: spacing(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: grayMed,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 25,
              child: Image.asset(
                'assets/icons/search_history.png',
                fit: BoxFit.cover,
              ),
            ),
            gap(w: 10),
            Container(
              width: width * 0.7,
              child: Html(
                data: widget.post['postText'],
                onAnchorTap: (str, map, e) {
                  pushRoute(
                    context: context,
                    screen: HashTrend(
                        hashTag: e!.text.toString().contains('#')
                            ? e.text.toString().replaceFirst(RegExp(r'#'), '')
                            : e.text.toString()),
                  );
                },
                style: {
                  "body": Style(
                    fontSize: FontSize(12.0),
                    textOverflow: TextOverflow.ellipsis,
                    color: Colors.black54,
                    maxLines: 1,
                  ),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
