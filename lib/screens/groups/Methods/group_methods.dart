import 'dart:convert';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/utils/constant.dart';

class GroupMethod {
  Future JoinGroup({required String group_id}) async {
    final data = {
      'type': 'follow_like_join',
      'action': 'join_group',
      'user_id': loginUserId,
      'group_id': group_id,
    };
    final result = await API().postData(data);
    print(jsonDecode(result.body));
  }
}
