import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../model/show_list_message_model.dart';

// ignore: must_be_immutable
class ForwardMessage extends StatefulWidget {
  String? message;
  String? time;
  String? replyid;
  List<MessageList> list;
  int currentIndex;

  ForwardMessage(this.message, this.time, this.replyid, this.list, this.currentIndex, {Key? key}) : super(key: key);

  @override
  State<ForwardMessage> createState() => _ForwardMessageState();
}

class _ForwardMessageState extends State<ForwardMessage> {
  func() {
    for (int i = 0; i < widget.list!.length; i++) {
      widget.replyid == widget.list[i].id ? forwarMessage = widget.list[i].message.toString() : print("nae hoya");
    };
  }

  String? forwarMessage;

  @override
  void initState() {
    func();
    print("inti works");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(
                      widget.time.toString(),
                    ) *
                    1000)),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: greyColor),
              ),
              const Spacer(),
              Icon(
                Icons.more_horiz,
                color: greyColor,
              )
            ],
          ),
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
                            Text(forwarMessage.toString())
                          ],),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [Icon(Icons.forward_10), Text(forwarMessage.toString())],
                      // ),
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
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
