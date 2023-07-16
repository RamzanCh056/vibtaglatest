// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/home/post_types/post_photo.dart';
import 'package:vibetag/screens/profile/video_tab/video_post.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/navbar.dart';

class ProfilePhotoTimeline extends StatefulWidget {
  Map<String, dynamic> first;
  List<dynamic> posts;
  ProfilePhotoTimeline({
    Key? key,
    required this.first,
    required this.posts,
  }) : super(key: key);

  @override
  State<ProfilePhotoTimeline> createState() => _ProfilePhotoTimelineState();
}

class _ProfilePhotoTimelineState extends State<ProfilePhotoTimeline> {
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
          child: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(),
              Header(),
              Container(
                width: width,
                height: height * 0.87,
                child: SingleChildScrollView(
                  child: Column(
                    children: posts,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
