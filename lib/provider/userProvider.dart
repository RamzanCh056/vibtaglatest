import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/model/user.dart';

class UserProvider with ChangeNotifier {
  ModelUser _user = ModelUser(
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    avatar: '',
    address: '',
    about: '',
    cover: '',
    birthday: '',
    userId: 0,
  );

  ModelUser get user => _user;

  setUser(ModelUser user) {
    _user = user;
    notifyListeners();
  }
}
