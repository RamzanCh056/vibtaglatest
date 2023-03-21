import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/model/user_details.dart';
import 'package:vibetag/provider/user_detailsProvider.dart';

import '../model/user.dart';
import '../provider/userProvider.dart';

class AuthMethod {
  getUser({required String userId}) async {
    final data = {
      'type': 'get_user_data',
      'user_profile_id': userId,
      'user_id': userId,
    };
    final result = await API().postData(data);
    final jsonData = jsonDecode(result.body)['user_data'];
    return jsonData;
  }

  Future<void> setUser({
    required BuildContext context,
    required String userId,
  }) async {
    final data = {
      'type': 'get_user_data',
      'sub_type': 'profile_info',
      'user_profile_id': userId,
      'user_id': userId,
    };
    final result = await API().postData(data);
    final jsonData = jsonDecode(result.body)['user_data'];
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userData = jsonEncode(jsonData);
    pref.setString('userData', userData);
    Provider.of<UserProvider>(context, listen: false).setUser(
      ModelUser.fromMap(jsonData),
    );
    Provider.of<UsersDetailsProvider>(context, listen: false).setUserDetails(
      UserDetails.fromMap(jsonData['details']),
    );
  }
}
