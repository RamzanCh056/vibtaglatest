import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/utils/constant.dart';

import '../provider/userProvider.dart';

class AuthMethod {
  Future<Map<String, dynamic>> getUserData(String user_profile_id) async {
    final data = {
      'type': 'get_user_data',
      'sub_type': 'profile_info',
      'user_id': loginUserId.toString(),
      'user_profile_id': user_profile_id,
    };
    final result = await API().postData(data);
    return jsonDecode(result.body)['user_data'];
  }

  Future<void> setUser({
    required BuildContext context,
  }) async {
    final data = {
      'type': 'get_user_data',
      'sub_type': 'profile_info',
      'user_profile_id': loginUserId.toString(),
      'user_id': loginUserId.toString(),
    };
    final result = await API().postData(data);

    Map<String, dynamic> jsonData = jsonDecode(result.body)['user_data'];
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('userData', jsonEncode(jsonData));
    Provider.of<UserProvider>(context, listen: false).setUser(
      jsonData,
    );
  }
}
