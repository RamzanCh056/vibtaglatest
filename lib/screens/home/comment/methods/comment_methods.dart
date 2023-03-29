import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../methods/api.dart';
import '../../../../utils/constant.dart';
import '../widget/comment_item.dart';

class CommentMethods {
  Future ReactOnComment(
      {required String comment_id, required int reaction}) async {
    final data = {
      'type': 'react_comment',
      'comment_id': comment_id,
      'user_id': loginUserId.toString(),
      'reaction': reaction.toString(),
    };
    await API().postData(data);
  }

  Future<void> loadCommets({required String postId}) async {
    final data = {
      'type': 'comments',
      'sub_type': 'fetch_comments',
      'post_id': postId,
      'limit': '10',
      'offset': '0'
    };
    final result = await API().postData(data);
    comments = jsonDecode(result.body)['data'];
    setComments();
  }

  List<Widget> setComments() {
    List<Widget> commentsList = [];
    for (var comment in comments) {
      commentsList.add(
        CommentWidget(
          comment: comment,
        ),
      );
    }
    return commentsList;
  }

  Future<void> removeReaction(String CommentId) async {
    final data = {
      'type': 'remove_react_comment',
      'comment_id': CommentId.toString(),
      'user_id': loginUserId.toString(),
    };
    await API().postData(data);
  }

  Future AddComment({
    required String image,
    required String post_id,
    required String stickerUrl,
    required String text,
  }) async {
    if (image == '') {
      final data = {
        'type': 'comment_add',
        'post_id': post_id,
        'image': '',
        'audio': '',
        'image_url': stickerUrl,
        'text': text,
        'user_id': loginUserId.toString(),
      };

      await API().postData(data);
    } else {
      final data = {
        'type': 'comment_add',
        'post_id': post_id,
        'audio': '',
        'image_url': stickerUrl,
        'text': text,
        'user_id': loginUserId.toString(),
      };
      await API().MultiPartRequest(path: image, data: data);
    }
  }

  Future CommentReply({
    required String image,
    required String comment_id,
    required String stickerUrl,
    required String text,
  }) async {
    if (image == '') {
      final data = {
        'type': 'comment_reply_add',
        'comment_id': comment_id,
        'image': '',
        'audio': '',
        'image_url': stickerUrl,
        'text': text,
        'user_id': loginUserId.toString(),
      };
      final result = await API().postData(data);
      final response = jsonDecode(result.body);
    } else {
      final data = {
        'type': 'comment_reply_add',
        'comment_id': comment_id,
        'audio': '',
        'image_url': stickerUrl,
        'text': text,
        'user_id': loginUserId.toString(),
      };
      await API().MultiPartRequest(path: image, data: data);
    }
  }

  Future DeleteCommet({required String comment_id}) async {
    final data = {
      'type': 'comment_delete',
      'comment_id': comment_id,
      'user_id': loginUserId.toString(),
    };
    await API().postData(data);
  }

  getReactionsDetails(List<dynamic> reactions) {
    List<String> elements = [];
    List<int> reactionsEmojis = [];
    Map<String, dynamic> reactionsData = {};
    for (var reaction in reactions) {
      elements.add(reaction['reaction'].toString());
    }
    var counts = elements.fold<Map<String, int>>({}, (map, element) {
      map[element] = (map[element] ?? 0) + 1;
      return map;
    });
    for (var i = 0; i < 8; i++) {
      if (counts['${i + 1}'] != null) {
        reactionsEmojis.add((i + 1));
      }
    }

    reactionsData = {
      'reactions': counts,
      'emojis': reactionsEmojis,
      'counts': reactions.length,
    };
    print(reactionsData);
    return reactionsData;
  }
}
