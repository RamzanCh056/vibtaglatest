// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:vibetag/screens/home/comment.dart';
import 'package:vibetag/screens/home/post_type.dart';
import 'package:vibetag/screens/home/revibe.dart';

import '../../utils/constant.dart';

class Post extends StatefulWidget {
  final String avatar;
  final String name;
  final String postTime;
  final String postText;
  final String postFile;
  final String comments;
  final String likes;
  final String shares;

  const Post({
    Key? key,
    required this.avatar,
    required this.name,
    required this.postTime,
    required this.postText,
    required this.postFile,
    required this.comments,
    required this.likes,
    required this.shares,
  }) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return Container(
      width: double.maxFinite,
      margin: spacing(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: whiteSecondary,
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      child: Column(
        children: [
          postFile(
            file: widget.postFile,
            context: context,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: spacing(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: spacing(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  margin: spacing(
                    horizontal: 3,
                  ),
                  decoration: BoxDecoration(
                    color: grayLight,
                    borderRadius: borderRadius(width),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/new/icons/heavy_smil.png'),
                      Image.asset('assets/new/icons/small_heart.png'),
                      gap(w: 5),
                      Text(
                        "${widget.likes}",
                        style: TextStyle(
                          color: grayMed,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.comments} Comments | ${widget.shares} Revibed",
                  style: TextStyle(
                    color: grayMed,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width * 0.04,
                    height: width * 0.04,
                    child: Image.asset(
                      'assets/new/icons/heart.png',
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'React',
                    style: TextStyle(
                      color: grayMed,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Comments(
                    context: context,
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.04,
                      height: width * 0.04,
                      child: Image.asset(
                        'assets/new/icons/comment.png',
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Comment',
                      style: TextStyle(
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Revibe(context: context);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.04,
                      height: width * 0.04,
                      child: Image.asset(
                        'assets/new/icons/revibe.png',
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Revibe',
                      style: TextStyle(
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            width: width * 0.95,
            height: 2,
            color: medGray,
          ),
          Container(
            width: width * 0.65,
            padding: spacing(
              horizontal: 10,
              vertical: 5,
            ),
            margin: spacing(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
                color: white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(56, 0, 0, 0),
                    offset: Offset.zero,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
                borderRadius: borderRadius(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset('assets/new/gif/thumbs_up.gif'),
                ),
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset('assets/new/gif/sparkling_heart.gif'),
                ),
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset('assets/new/gif/squinting_face.gif'),
                ),
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset('assets/new/gif/hushed_face.gif'),
                ),
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset('assets/new/gif/weary_face.gif'),
                ),
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset('assets/new/gif/pouting_face.gif'),
                ),
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset('assets/new/gif/broken_heart.gif'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
            ),
            child: Html(
              data: widget.postText,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
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
                    Container(
                      width: width * 0.15,
                      height: width * 0.15,
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
                      child: CircleAvatar(
                        radius: width * 0.075,
                        foregroundImage: NetworkImage(
                          widget.avatar,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: blackPrimary,
                          ),
                        ),
                        Text(
                          widget.postTime,
                          style: TextStyle(
                            color: grayMed,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset(
                    'assets/new/icons/more_h.png',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
