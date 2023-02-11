import 'package:flutter/material.dart';

import '../constants.dart';
class CallHistory extends StatefulWidget {
  const CallHistory({Key? key}) : super(key: key);

  @override
  State<CallHistory> createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  List <String> callerName = [
    "Ramzanchaudhary",
    "waqas butt",
    "umair ch",
    "ali zaib",
    "mubeen khan",
    "jaswindar bhla",
    "miss call"
  ];
  List <String> callStatus = [
    "10:34 mint",
    "Missed call",
    "Missed call",
    "10:44 mint",
    "Missed call",
    "Missed call",
    "11:44 mint"
  ];
  List <String> callDay = [
    "Just now",
    "2 days ago",
    "Yesterday",
    "2 days ago",
    "Yesterday",
    "2 days ago",
    "2 days ago"
  ];


  List<Icon> callerIcons =[
    const Icon(Icons.call,color: Color(0xff00FF19), size: 38,),
    const Icon(Icons.call,color: Color(0xffFF0000), size: 38,),
    const Icon(Icons.call,color: Color(0xffFF0000), size: 38,),
    const Icon(Icons.call,color: Color(0xff00FF19), size: 38,),
    const Icon(Icons.call,color: Color(0xffFF0000), size: 38,),
    const Icon(Icons.call,color: Color(0xffFF0000), size: 38,),
    const Icon(Icons.call,color: Color(0xff00FF19), size: 38,),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: txtColor,
        automaticallyImplyLeading: true,
        toolbarHeight: 100,
        title:  const Text(
          "Call History",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        centerTitle: true,

      ),
      body: ListView.builder(
        physics: const ScrollPhysics(),
        itemBuilder: buildListItem,
        itemCount: callerName.length,
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 15),
      )

    );
  }
  Widget buildListItem(BuildContext context, int index) {
    return InkWell(
        child: Card(
          elevation: 0,
          color: const Color(0xFFF1F4FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const SizedBox(height: 17,),
              Row(children: [
                callerIcons[index],
                //const Icon(Icons.call, color: Color(0xff00FF19), size: 38,),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                  Text(callerName[index].toString(), style: const TextStyle(color: Colors.black),),
                  const SizedBox(height: 5,),

                  Text(callStatus[index], style: const TextStyle(color: Color(0xff7D8CAC)),)
                ],),
                const Expanded(
                    child: Text("")),
                 Text(callDay[index], style: const TextStyle(color: Color(0xff7D8CAC)),)
              ],),
              const SizedBox(height: 17,),

            ],),
          ),

        ),

    );
  }
}
