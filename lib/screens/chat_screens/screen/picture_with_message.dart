import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
// ignore: must_be_immutable
class PictureSendUserMessage extends StatefulWidget {
  String? time;
  String? message;
  String? image;
  PictureSendUserMessage(this.time, this.message,this.image,{Key? key}) : super(key: key);

  @override
  State<PictureSendUserMessage> createState() => _PictureSendUserMessageState();
}

class _PictureSendUserMessageState extends State<PictureSendUserMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Container(
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFEBEFFB)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                Text(
                  widget.message.toString(),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                SizedBox(height: 8,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(widget.image.toString(),
                    fit: BoxFit.cover,
                  ),
                )
              ],),
            )
        )


      ],);
  }
}
