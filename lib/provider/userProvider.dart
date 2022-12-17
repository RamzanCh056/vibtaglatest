import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/model/user.dart';

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
  );

  ModelUser get user => _user;

  setUser(ModelUser user) {
    _user = user;
    notifyListeners();
  }
}
