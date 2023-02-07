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
    mutual_friends_count: 0,
    video_views: '',
    total_reactions: 0,
  );

  UserDetails get userDetails => _userDetails;

  setUserDetails(UserDetails userDetails) {
    _userDetails = userDetails;
    notifyListeners();
  }
}
