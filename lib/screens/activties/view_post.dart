import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/utils/constant.dart';

class ViewPosts extends StatefulWidget {
  const ViewPosts({super.key});

  @override
  State<ViewPosts> createState() => _ViewPostsState();
}

class _ViewPostsState extends State<ViewPosts> {
  List<Widget> viewPosts = [];
  List<dynamic> rawPosts = [];
  bool isLoading = false;

  getPosts() async {
    isLoading = true;
    setState(() {});
    final response = await API().newPostData({
      'type': 'get_viewed_post',
      'action': 'get_viewed_post',
      'user_id': '${loginUserId}',
      'loggedin': 'true',
    });
    for (var post in response['data']) {
  
      if (post['postData']['post_id'] != null) {
        rawPosts.add(post['postData']);
      }
    }

    List<Widget> postList = PostMethods().setPosts(posts: rawPosts);
    for (var i = 0; i < response['data'].length; i++) {
      if (response['data'][i]['postData']['post_id'] != null) {
        viewPosts.add(
          Container(
            padding: spacing(vertical: 10),
            decoration: BoxDecoration(
              color: white,
            ),
            child: Column(
              children: [
                Container(
                  width: width,
                  padding: spacing(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You viewed House post',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${DateFormat('yMMMMEEEEd').format(
                              DateTime.fromMillisecondsSinceEpoch(int.parse(
                                    response['data'][i]['time'].toString(),
                                  ) *
                                  1000),
                            )}',
                          ),
                        ],
                      ),
                      Text(
                        readTimestamp(
                          int.parse(
                            response['data'][i]['time'].toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                gap(h: 10),
                Container(
                  margin: spacing(horizontal: 10),
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(5),
                    color: HexColor('#C8D1E5'),
                  ),
                ),
                postList[i],
              ],
            ),
          ),
        );
      }
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingSpinner()
        : Container(
            child: Column(
              children: viewPosts,
            ),
          );
  }
}
