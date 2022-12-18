import 'package:flutter/widgets.dart';
import 'package:vibetag/model/user_details.dart';

class UsersDetailsProvider with ChangeNotifier {
  UserDetails _userDetails = UserDetails(
    post_count: '',
    album_count: '',
    following_count: '',
    followers_count: '',
    groups_count: '',
    likes_count: '',
    mutual_friends_count: false,
  );

  UserDetails get userDetails => _userDetails;

  setUserDetails(UserDetails userDetails) {
    _userDetails = userDetails;
    notifyListeners();
  }
}
