import 'dart:convert';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/utils/constant.dart';

class GroupMethod {
  Future<void> JoinGroup({required String group_id}) async {
    if (groups_data.contains(loginUserId)) {
      groups_data.remove(loginUserId);
    } else {
      groups_data.add(loginUserId);
    }
    final response = await API().postData({
      'type': 'follow_like_join',
      'action': 'join_group',
      'user_id': loginUserId,
      'group_id': group_id,
    });
    ToastMessage(message: jsonDecode(response.body)['join']);
  }
}
