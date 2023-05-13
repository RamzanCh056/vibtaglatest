// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/home/comment/methods/comment_methods.dart';

import '../../../../utils/constant.dart';

class EditComment extends StatefulWidget {
  final Map<String, dynamic> comment;
  bool isCommentReply;
  EditComment({
    Key? key,
    required this.comment,
    this.isCommentReply = false,
  }) : super(key: key);

  @override
  State<EditComment> createState() => _EditCommentState();
}

class _EditCommentState extends State<EditComment> {
  TextEditingController text = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    text.text = widget.comment['Orginaltext'].toString();
  }

  updateComment() async {
    setState(() {
      isLoading = true;
    });
    if (widget.isCommentReply) {
      final data = {
        'type': 'comment_reply_edit',
        'reply_id': widget.comment['id'].toString(),
        'text': text.text.toString(),
        'user_id': loginUserId.toString(),
      };
      await API().postData(data);

      await CommentMethods().loadCommets(
        postId: comments[0]['post_id'].toString(),
      );
    } else {
      final data = {
        'type': 'comment_edit',
        'comment_id': widget.comment['id'].toString(),
        'text': text.text.toString(),
        'user_id': loginUserId.toString(),
      };
      await API().postData(data);

      await CommentMethods().loadCommets(
        postId: comments[0]['post_id'].toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
    pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> modelUser =
        Provider.of<UserProvider>(context, listen: false).user;
    return ClipRRect(
      borderRadius: radiusOnly(
        topLeft: 10,
        topRight: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: radiusOnly(
            topLeft: 10,
            topRight: 10,
          ),
        ),
        child: Scaffold(
          body: Column(
            children: [
              Container(
                child: Container(
                  padding: spacing(horizontal: 15, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      gap(w: 35),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: grayMed,
              ),
              gap(h: 15),
              Container(
                width: width - 10,
                child: Row(
                  children: [
                    Container(
                      width: width * 0.12,
                      child: ClipRRect(
                        borderRadius: borderRadius(width),
                        child: netImage(
                          modelUser['avatar'],
                        ),
                      ),
                    ),
                    gap(w: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: grayLight,
                        borderRadius: borderRadius(width),
                        boxShadow: lightShadow,
                      ),
                      width: width * 0.83,
                      child: TextFormField(
                        controller: text,
                        decoration: InputDecoration(
                          contentPadding: spaceOnly(left: 15, right: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              gap(h: 15),
              Container(
                width: width - 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        pop(context);
                      },
                      child: Container(
                        padding: spacing(horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                          color: whiteGray,
                          boxShadow: lightShadow,
                          borderRadius: borderRadius(5),
                        ),
                        child: Text('Cancel'),
                      ),
                    ),
                    gap(w: 15),
                    isLoading
                        ? loadingSpinner()
                        : InkWell(
                            onTap: () {
                              updateComment();
                            },
                            child: Container(
                              padding: spacing(horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                color: grayLight,
                                boxShadow: lightShadow,
                                borderRadius: borderRadius(5),
                              ),
                              child: Text('Update'),
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
