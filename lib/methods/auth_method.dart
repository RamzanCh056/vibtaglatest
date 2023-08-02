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

  Future<void> LikePage(String page_id) async {
    if (likes_data.contains(page_id)) {
      likes_data.remove(page_id);
    } else {
      likes_data.add(page_id);
    }
    final data = {
      'type': 'follow_like_join',
      'action': 'like_page',
      'user_id': loginUserId.toString(),
      'page_id': page_id,
    };
    await API().postData(data);
  }

  Future<void> followUser(String user_id) async {
    if (following_data.contains(user_id)) {
      following_data.remove(user_id);
    } else {
      following_data.add(user_id);
    }
    final data = {
      'type': 'follow_user_startup',
      'user_id': loginUserId,
      'user': user_id,
    };
    await API().postData(data);
  }

  Future<void> joinGroup(String group_id) async {
    if (groups_data.contains(loginUserId)) {
      groups_data.remove(loginUserId);
    } else {
      groups_data.add(loginUserId);
    }
    final data = {
      'type': 'follow_like_join',
      'action': 'join_group',
      'user_id': loginUserId,
      'group_id': group_id,
    };
    final response = await API().postData(data);
    ToastMessage(message: jsonDecode(response['join']));
  }
}
