import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import 'full_image.dart';
// ignore: must_be_immutable
class PictureSendUser extends StatefulWidget {
  String? time;
  String? image;
  String? lastSceen;
  String? profileImage;
  String? userName;

   PictureSendUser(this.time, this.image,this.lastSceen, this.profileImage, this.userName,{Key? key}) : super(key: key);

  @override
  State<PictureSendUser> createState() => _PictureSendUserState();
}

class _PictureSendUserState extends State<PictureSendUser> {
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
      GestureDetector(
        onTap: (){
          print("${widget.profileImage}");
          Navigator.push(context, MaterialPageRoute(builder: (context) =>FullImageSender(widget.image, widget.lastSceen, widget.profileImage,widget.userName)));
        },
        child: Container(
          width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFEBEFFB)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(widget.image.toString(),
                fit: BoxFit.cover,
              ),
            )
        ),
      )


    ],);
  }
}
