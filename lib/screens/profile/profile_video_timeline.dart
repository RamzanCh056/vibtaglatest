// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/home/post_types/post_photo.dart';
import 'package:vibetag/screens/profile/video_tab/video_post.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/navbar.dart';

class ProfileVideoTimeline extends StatefulWidget {
  Map<String, dynamic> first;
  List<dynamic> posts;
  ProfileVideoTimeline({
    Key? key,
    required this.first,
    required this.posts,
  }) : super(key: key);

  @override
  State<ProfileVideoTimeline> createState() => _ProfileVideoTimelineState();
}

class _ProfileVideoTimelineState extends State<ProfileVideoTimeline> {
  List<Widget> posts = [];
  List<dynamic> postsList = [];
  @override
  void initState() {
    super.initState();
    setPosts();
  }

  setPosts() {
    postsList.add(widget.first);
    for (var post in widget.posts) {
      if (post['post_id'].toString() != widget.first['post_id'].toString()) {
        postsList.add(post);
      }
    }
    posts = PostMethods().setPosts(posts: postsList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
            NavBar(),
          Header(),
          Container(
            width: width,
            height: height*0.8,
            child: SingleChildScrollView(
              child: Column(
                children: posts,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
