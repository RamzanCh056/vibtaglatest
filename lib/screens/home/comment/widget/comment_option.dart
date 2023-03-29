import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';
import '../methods/comment_methods.dart';

CommentOptions({
  required BuildContext context,
  required String? commentId,
}) {
  return Container(
    decoration: BoxDecoration(
      color: whitePrimary,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: spacing(vertical: 2),
            padding: spacing(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(15),
            ),
            child: Text('Edit'),
          ),
          InkWell(
            onTap: () async {
              await CommentMethods().DeleteCommet(comment_id: comment_id);
            },
            child: Container(
              margin: spacing(vertical: 2),
              padding: spacing(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(15),
              ),
              child: Text('Delete'),
            ),
          ),
        ],
      ),
    ),
  );
}
