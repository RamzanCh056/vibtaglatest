import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
// ignore: must_be_immutable
class UserGetMessage extends StatefulWidget {
  String? message;
  String? time;
  UserGetMessage(this.message,this.time,{Key? key}) : super(key: key);

  @override
  State<UserGetMessage> createState() => _UserGetMessageState();
}

class _UserGetMessageState extends State<UserGetMessage> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children:  [

            Text(
              DateFormat('hh:mm a').format(
                  DateTime.fromMillisecondsSinceEpoch(int.parse(
                    widget.time.toString(),
                  ) *
                      1000)),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: greyColor),
            ),
            const Spacer(),
            Icon(Icons.more_horiz,color: greyColor,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ChatBubble(
            //   clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
            //   alignment: Alignment.topRight,
            //   margin: EdgeInsets.only(top: 20),
            //   backGroundColor: const Color(0xffDBDEE5),
            //   child: Container(
            //     // constraints: BoxConstraints(
            //     //   maxWidth: MediaQuery.of(context).size.width * 0.7,
            //     // ),
            //     child: Text(
            //      widget.message.toString(),
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),
            Container(
              //  width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffDBDEE5)),
                  borderRadius: BorderRadius.circular(10),
                  // color: const Color(0xFFEBEFFB)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text(
                      widget.message.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    SizedBox(height: 5,),
                  ],)
            ),
            SizedBox(width: 5,),
            Icon(Icons.done_all, size: 20,color: greyColor),
          ],
        )
      ],
    );
  }
}
