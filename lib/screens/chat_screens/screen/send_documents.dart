import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/screens/chat_screens/screen/pages/pdf_view.dart';

import '../constants.dart';
// ignore: must_be_immutable
class UserSendDocument extends StatefulWidget {
  String? document;
  String? time;
  UserSendDocument(this.document,this.time,{Key? key}) : super(key: key);

  @override
  State<UserSendDocument> createState() => _UserSendDocumentState();
}

class _UserSendDocumentState extends State<UserSendDocument> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                print( "document");
                print(widget.document.toString(),);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DocumentView(widget.document.toString())));
              },
              child: Container(
                //  width: double.infinity,
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
                      Row(children: [

                        Text(
                          "Document Views",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.file_copy_rounded),
                      ],),

                    ],)
              ),
            ),
          ],
        )
      ],
    );
  }
}
