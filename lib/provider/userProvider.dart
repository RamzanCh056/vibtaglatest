import 'package:flutter/widgets.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/utils/constant.dart';

class UserProvider with ChangeNotifier {
  Map<String, dynamic> _user = {};

  Map<String, dynamic> get user => _user;

  setUser(Map<String, dynamic> userData) {
    _user = userData;
    loginUser = userData;
    following_data = isEmpty(user['following_data']);
    groups_data = isEmpty(user['groups_data']);
    likes_data = isEmpty(user['likes_data']);
    notifyListeners();
  }

  clearUser(Map<String, dynamic> userData) {
    _user = userData;
    following_data = [];
    groups_data = [];
    likes_data = [];
    loginUser = {};
    notifyListeners();
  }
}
