import 'package:flutter/widgets.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';

import '../utils/constant.dart';

class PostProvider with ChangeNotifier {
  List<Widget> _posts = [];

  List<Widget> get posts => _posts;

  setPostsWidgets(List<dynamic> posts) {
    List<Widget> postWidgets = PostMethods().setPosts(posts: posts);
    _posts = postWidgets;
    notifyListeners();
  }

  filterPosts(List<dynamic> posts) {
    List<dynamic> _allFilterPosts = [];
    for (var post in posts) {
      if (!(deletedPostIds.contains(post['id'].toString())) &&
          !(hidePostIds.contains(post['id'].toString()))) {
        _allFilterPosts.add(post);
      }
    }
    setPostsWidgets(_allFilterPosts);
  }

  loadMorePosts(List<dynamic> posts) {
    if (posts.length > 0) {
      for (var i = 0; i < posts.length; i++) {
        rawPostData.add(posts[i]);
      }
      setPostsWidgets(rawPostData);
    }
  }

  clearAndSet(List<dynamic> posts) {
    _posts = [];
    List<Widget> postWidgets = PostMethods().setPosts(posts: posts);
    _posts = postWidgets;
    notifyListeners();
  }

  clear() {
    _posts = [];
    notifyListeners();
  }

   clearOnly() {
    _posts = [];
  }
}
