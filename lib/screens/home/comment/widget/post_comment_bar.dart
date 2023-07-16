import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vibetag/screens/home/comment/comments.dart';

PostComments({
  required BuildContext context,
  required String postId,
  int totalComments = 10,
}) {
  return showBarModalBottomSheet(
      barrierColor: Color.fromARGB(0, 255, 255, 255),
      elevation: 0,
      topControl: Container(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      context: context,
      builder: (context) {
        // return ReplyCommentBar();
        return Comments(
          postId: postId,
          totalComments: totalComments,
        );
      });
}
