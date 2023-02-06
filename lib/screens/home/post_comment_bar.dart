import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';
import 'package:vibetag/screens/home/comment_option.dart';
import 'package:vibetag/screens/home/comments.dart';

import '../../utils/constant.dart';

PostComments({required BuildContext context, required String postId}) {
  return showBarModalBottomSheet(
      barrierColor: Color.fromARGB(0, 255, 255, 255),
      elevation: 0,
      topControl: Container(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      context: context,
      builder: (context) {
        return Comments(
          postId: postId,
        );
      });
}
