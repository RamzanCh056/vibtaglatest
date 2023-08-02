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

  Future<void> loadCommets({
    required String postId,
    bool loadAll = false,
    int totalComments = 10,
  }) async {
    final data = {
      'type': 'comments',
      'sub_type': 'fetch_comments',
      'post_id': postId,
      'limit': totalComments.toString(),
      'offset': loadAll
          ? '0'
          : comments.length == 0
              ? '0'
              : comments[comments.length - 1]['id'].toString()
    };

    final result = await API().postData(data);
    comments = jsonDecode(result.body)['data'];
    print(comments);
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
    required String gifUrl,
    required String text,
  }) async {
    if (image == '' && gifUrl == '') {
      final data = {
        'type': 'comment_add',
        'post_id': post_id,
        'image': '',
        'audio': '',
        'image_url': stickerUrl,
        'text': text,
        'user_id': loginUserId.toString(),
      };

      final response = await API().postData(data);
      print(jsonDecode(response.body));
    } else if (gifUrl != '') {
      final data = {
        'type': 'comment_add',
        'post_id': post_id,
        'audio': '',
        'image_url': gifUrl,
        'text': text,
        'user_id': loginUserId.toString(),
      };
      await API().MultiPartRequest(path: image, data: data);
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

  Future<void> deleteReply(String reply_id) async {
    final data = {
      'type': 'comment_reply_delete',
      'reply_id': reply_id,
      'user_id': loginUserId.toString()
    };
    final result = await API().postData(data);
    print(jsonDecode(result.body));
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
