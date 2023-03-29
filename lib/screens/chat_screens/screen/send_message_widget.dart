import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../constants.dart';
// ignore: must_be_immutable
class UserSendMessage extends StatefulWidget {
  String? message;
  String? time;
  String? star;
  String? story;

  UserSendMessage(this.message,this.time,this.star,this.story,{Key? key}) : super(key: key);

  @override
  State<UserSendMessage> createState() => _UserSendMessageState();
}

class _UserSendMessageState extends State<UserSendMessage> {
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
            widget.star !=""?
            Row(children: [
              Icon(Icons.star,color: Colors.yellow,),
              Icon(Icons.star,color: Colors.yellow),
              Icon(Icons.star,color: Colors.yellow),
            ],):
            Icon(Icons.more_horiz,color: greyColor,)
          ],
        ),
        widget.story.toString() !="0"?
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //  width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFEBEFFB)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 155,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("you", style: TextStyle(color: Colors.yellow),),
                            //  SizedBox(height: 5,),
                            Text("Reply on story")
                          ],),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.message.toString(),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ],
        ):
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
             width:200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFEBEFFB)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 5,),
    ReadMoreText(
      widget.message.toString(),
    trimLines: 2,
    colorClickableText: Colors.blueAccent,
   trimMode: TrimMode.Line,
    trimCollapsedText: 'Read more',
    trimExpandedText: 'Read less',
    style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: Colors.black),
    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
                // Text(
                //   widget.message.toString(),
                //   style: const TextStyle(
                //       fontSize: 12,
                //       fontWeight: FontWeight.w300,
                //       color: Colors.black),
                // ),
                // SizedBox(height: 5,),
              ],)
            ),
          ],
        ),
        SizedBox(height: 5,),
      ],
    );
  }
}
