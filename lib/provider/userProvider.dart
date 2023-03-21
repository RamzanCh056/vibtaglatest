import 'package:flutter/widgets.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/model/user.dart';
import 'package:vibetag/utils/constant.dart';

class UserProvider with ChangeNotifier {
  ModelUser _user = ModelUser(
    first_name: '',
    last_name: '',
    username: '',
    email: '',
    avatar: '',
    address: '',
    about: '',
    cover: '',
    birthday: '',
    user_id: '',
    review_market: '',
    review_login: '',
    relationship_id: '',
    working: '',
    working_link: '',
    school: '',
    gender: '',
    country_id: '',
    website: '',
    facebook: '',
    google: '',
    twitter: '',
    linkedin: '',
    youtube: '',
    vk: '',
    ip_address: '',
    private_privacy: '',
    follow_privacy: '',
    friend_privacy: '',
    post_privacy: '',
    mailru: '',
    language: '',
    email_code: '',
    src: '',
    following_number: '',
    verified: '',
    following_data: [],
    likes_data: [],
    groups_data: [],
  );

  ModelUser get user => _user;

  setUser(ModelUser user) {
    _user = user;
    following_data = user.following_data!;
    likes_data = user.likes_data!;
    groups_data = user.groups_data!;
    notifyListeners();
  }
}
