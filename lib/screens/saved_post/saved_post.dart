import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';

class SavedPost extends StatefulWidget {
  const SavedPost({super.key});

  @override
  State<SavedPost> createState() => _SavedPostState();
}

class _SavedPostState extends State<SavedPost> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<dynamic> response = [];
  final TextEditingController search = TextEditingController();
  List<Widget> savedPosts = [];
  List<String> postIds = [];
  bool isLoading = false;
  bool isNoMorePosts = false;
  bool isAlreadyCalled = false;
  getSavedPosts() async {
    isLoading = true;
    setState(() {});
    final result = await API().postData({
      'type': 'saved_posts',
      'action': 'get_saved_posts',
      'user_id': '${loginUserId}',
    });
    response = jsonDecode(result.body);
    for (var post in response) {
      postIds.add(post['id']);
    }
    savedPosts = PostMethods().setPosts(posts: response);

    isLoading = false;
    if (response.length == 0) {
      isNoMorePosts = true;
    }
    setState(() {});
  }

  loadMoreSavePosts() async {
    List<dynamic> loadmore = [];
    if (response.length > 0) {
      isAlreadyCalled = true;
      final result = await API().postData({
        'type': 'saved_posts',
        'action': 'get_more_saved_posts',
        'user_id': '${loginUserId}',
        'after_post_id': response[(response.length - 1)]['post_id'].toString()
      });
      loadmore = jsonDecode(result.body);
      for (var post in loadmore) {
        if (!(postIds.contains(post['id'].toString()))) {
          response.add(post);
          postIds.add(post['id'].toString());
        }
      }

      List<Widget> loadMorePosts = PostMethods().setPosts(posts: response);
      if (loadMorePosts.length > 0) {
        for (var post in loadMorePosts) {
          savedPosts.add(post);
        }
      } else {
        isNoMorePosts = true;
        setState(() {});
      }
      isAlreadyCalled = false;

      setState(() {});
    }
  }

  @override
  void initState() {
    getSavedPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      drawer: DrawerMenu(),
      key: _key,
      body: SafeArea(
        child: isLoading
            ? loadingSpinner()
            : Container(
                width: width,
                height: height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [NavBar(), Header()],
                      ),
                      Column(
                        children: savedPosts,
                      ),
                      VisibilityDetector(
                        key: Key('Saved post load more'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.5 && !isAlreadyCalled) {
                            loadMoreSavePosts();
                          }
                        },
                        child: isNoMorePosts
                            ? Center(
                                child: Column(
                                  children: [
                                    gap(h: 25),
                                    Text('No more posts'),
                                    gap(h: 25),
                                  ],
                                ),
                              )
                            : loadingSpinner(),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
