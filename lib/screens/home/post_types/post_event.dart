// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:vibetag/screens/home/post_constants.dart';
import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/screens/home/post_types/widgets/reaction_bar.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

import '../../../methods/api.dart';
import '../../profile/profile.dart';

class PostEvent extends StatefulWidget {
  final dynamic post;

  const PostEvent({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostEvent> createState() => _PostEventState();
}

class _PostEventState extends State<PostEvent> {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  bool isAdded = false;
  String responseData = '';

  followOrLike() async {
    var data = {};
    if (widget.post['publisher']['page_id'] != null) {
      data = {
        'type': 'follow_like_join',
        'action': 'like_page',
        'user_id': loginUserId.toString(),
        'page_id': widget.post['publisher']['page_id'],
      };
    } else {
      data = {
        'type': 'follow_like_join',
        'action': 'follow_user',
        'user_id': widget.post['publisher']['user_id'],
        'loggedin_user_id': loginUserId,
      };
    }
    final result = await API().postData(data);
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return Container(
      margin: spacing(
        vertical: 10,
      ),
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            width * 0.02,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * 0.08,
              margin: spacing(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          pushRoute(
                              context: context,
                              screen: Profile(
                                user_id: widget.post['publisher']['user_id']
                                    .toString(),
                              ));
                        },
                        child: Container(
                          width: width * 0.12,
                          height: width * 0.12,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: borderRadius(width),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  orangePrimary,
                                  graySecondary,
                                ],
                              )),
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                              borderRadius: borderRadius(width),
                              child: Container(
                                width: width * 0.12,
                                child: netImage(
                                  widget.post['publisher']['avatar'],
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  pushRoute(
                                      context: context,
                                      screen: Profile(
                                        user_id: widget.post['publisher']
                                                ['user_id']
                                            .toString(),
                                      ));
                                },
                                child: profileName(
                                  widget.post['publisher']['name'],
                                ),
                              ),
                              gap(
                                w: 5,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              postTime(widget.post['post_time']),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      createBottomModalSheet(
                        context: context,
                        screen: PostBottomBar(
                          post: widget.post,
                          is_publisher:
                              widget.post['publisher']['user_id'].toString() ==
                                      loginUserId
                                  ? true
                                  : false,
                        ),
                      );
                    },
                    child: Container(
                      width: width * 0.08,
                      height: width * 0.08,
                      child: Image.asset(
                        'assets/new/icons/more_h.png',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    netImage(widget.post['event']['cover']),
                    gap(h: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.post['event']['name']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: blackPrimary,
                            ),
                          ),
                          Text(
                            '${widget.post['event']['start_date']} to ${widget.post['event']['end_date']}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    gap(h: 10),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  left: 10,
                  child: Container(
                    padding: spacing(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: borderRadius(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(50, 0, 0, 0),
                          offset: Offset.zero,
                          spreadRadius: 0.5,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                            '${widget.post['event']['start_date'].toString().trim().substring(0, 2)}'),
                        Text(
                          '${months[int.parse(widget.post['event']['start_date'].toString().substring(3, 5)) - 1]}',
                          style: TextStyle(
                            color: red,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            gap(h: 10),
            PostReactionSections(
              post: widget.post,
            ),
            gap(h: 10),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
