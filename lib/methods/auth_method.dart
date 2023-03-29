import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/utils/constant.dart';

import '../provider/userProvider.dart';

class AuthMethod {
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
    print(Provider.of<UserProvider>(context, listen: false).user);
  }
}
