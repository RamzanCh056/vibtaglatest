import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:vibetag/methods/api.dart';

class AuthMethod {
  getUser({required String userId}) async {
    print(userId);
    final data = {
      'type': 'get_user_data',
      'user_profile_id': userId,
      'user_id': userId,
    };
    final result = await API().postData(data);
    final jsonData = jsonDecode(result.body)['user_data'];
    print(jsonData);
    return jsonData;
  }

  Future<void> setUser(
      {required BuildContext context, required String userId}) async {
    final data = {
      'type': 'get_user_data',
      'user_profile_id': userId,
      'user_id': userId,
    };
    final result = await API().postData(data);
  }
}
