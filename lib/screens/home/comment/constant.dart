import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../profile/profile.dart';

deleteComments(int deleteComment_Id, int deleteReply_id) {
  for (var comment in comments[deleteComment_Id]) {
    if (comment['id'] == deleteReply_id) {
      comments[deleteComment_Id].removeWhere(
        (comments[deleteComment_Id][deleteReply_id] == deleteReply_id),
      );
    }
  }
}

tagType(e, BuildContext context) {
  if (e.parent!.attributes['data-type'].toString() == 'user') {
    pushRoute(
      context: context,
      screen: Profile(
        user_id: e.parent!.attributes['data-id'].toString(),
      ),
    );
  }
}
