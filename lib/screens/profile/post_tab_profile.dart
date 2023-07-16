// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/home/create_post/home_search.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../utils/constant.dart';

class PostTabProfile extends StatefulWidget {
  final String user_id;
  final Map<String, dynamic> user;
  const PostTabProfile({
    Key? key,
    required this.user_id,
    required this.user,
  }) : super(key: key);

  @override
  State<PostTabProfile> createState() => _PostTabProfileState();
}

class _PostTabProfileState extends State<PostTabProfile> {
  bool isLoading = false;
  bool loadingMore = false;
  bool isAlreadyLoading = false;
  List<String> adsIds = [];
  bool isNoMore = false;
  late Map<String, dynamic> modelUser;

  String lastPostId = '';
  bool isFindId = false;
  List<String> postsId = [];
  List<Widget> posts = [];
  @override
  void initState() {
    super.initState();
    getProfilePosts();
  }

  getProfilePosts() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_posts',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id,
      'after_post_id': '0',
    };

    final result = await API().postData(data);
    List<dynamic> postList = jsonDecode(result.body)['posts_data'];
    for (var i = 0; i < postList.length; i++) {
      if (postList[i]['post_id'] != null) {
        postsId.add(postList[i]['post_id'].toString());
      } else {
        adsIds.add(postList[i]['id'].toString());
      }
    }
    rawPostData = postList;
    Provider.of<PostProvider>(context, listen: false)
        .setPostsWidgets(rawPostData);
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  loadMore() async {
    final data = {
      'type': 'get_user_data',
      'sub_type': 'get_user_posts',
      'user_id': loginUserId,
      'user_profile_id': widget.user_id,
      'after_post_id': postsId[(postsId.length - 1)].toString(),
    };
    final result = await API().postData(data);
    final newPosts = jsonDecode(result.body)['posts_data'];
    if (newPosts.length > 0) {
      for (var i = 0; i < newPosts.length; i++) {
        if (newPosts[i]['post_id'] != null) {
          postsId.add(newPosts[i]['post_id'].toString());
          rawPostData.add(newPosts[i]);
        } else {
          if (!(adsIds.contains(newPosts[i]['id']))) {
            rawPostData.add(newPosts[i]);
            adsIds.add(newPosts[i]['id']);
          }
        }
      }
    } else {
      isNoMore = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    posts = Provider.of<PostProvider>(context).posts;
    modelUser = Provider.of<UserProvider>(
      context,
      listen: false,
    ).user;
    return isLoading
        ? loadingSpinner()
        : Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                width * 0.02,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.user_id.toString() == loginUserId.toString()
                    ? gap(h: 10)
                    : gap(),
                widget.user_id.toString() == loginUserId.toString()
                    ? createPost(modelUser)
                    : gap(),
                gap(h: 10),
                Column(
                  children: posts,
                ),
                isNoMore
                    ? Center(child: Text('No More Posts'))
                    : VisibilityDetector(
                        key: Key('Load_more_profile'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.3) {
                            loadMore();
                          }
                        },
                        child: loadingSpinner(),
                      ),
                gap(h: height * 0.1),
              ],
            ),
          );
  }
}
