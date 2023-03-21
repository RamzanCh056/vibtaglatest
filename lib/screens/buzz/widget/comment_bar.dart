// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../utils/constant.dart';

class BuzzinCommentBar extends StatefulWidget {
  final List<dynamic> comments;
  const BuzzinCommentBar({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  State<BuzzinCommentBar> createState() => _BuzzinCommentBarState();
}

class _BuzzinCommentBarState extends State<BuzzinCommentBar> {
  int pageIndex = 0;
  List<String> comments = [];

  @override
  void initState() {
    super.initState();
    for (var comment in widget.comments) {
      if (comment['text'].toString().isNotEmpty) {
        comments.add(comment['text']);
      }
    }
    setComments();
  }

  List<Widget> commentsList = [];
  setComments() {
    commentsList = [];
    for (var comment in comments) {
      commentsList.add(
        Container(
          padding: spacing(horizontal: 7),
          alignment: Alignment.centerLeft,
          child: Text(
            comment,
            style: TextStyle(
              color: white,
              fontSize: 10,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      );
    }
    SliderScroll();
  }

  final PageController pageController = PageController(initialPage: 0);
  void SliderScroll() {
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (mounted) {
          if (pageIndex == (comments.length - 1)) {
            if (mounted) {
              setState(() {
                pageIndex = 0;
              });
            }
          } else {
            if (mounted) {
              setState(() {
                pageIndex++;
              });
            }
          }
          pageController.animateToPage(pageIndex,
              duration: Duration(milliseconds: 1000), curve: Curves.easeInSine);
        }
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      reverse: true,
      onPageChanged: (index) {
        pageIndex = index;
      },
      scrollDirection: Axis.horizontal,
      controller: pageController,
      children: commentsList,
    );
  }
}
