import 'package:flutter/widgets.dart';
import 'package:vibetag/screens/home/post_models/post_modal.dart';

class PostProvider with ChangeNotifier {
  List<dynamic> _postModel = [];

  List<dynamic> get posts => _postModel;

  setPosts(List<dynamic> posts) {
    _postModel = posts;
    notifyListeners();
  }

  loadMorePosts(List<dynamic> posts) {
    if (posts.length > 0) {
      for (var i = 0; i < posts.length; i++) {
        _postModel.add(posts[i]);
      }
      notifyListeners();
    }
  }

  clearAndSet(List<dynamic> posts) {
    _postModel = [];
    _postModel = posts;
    notifyListeners();
  }

  clear() {
    _postModel = [];
    notifyListeners();
  }
}
