import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constant.dart';
class EventsGoing extends StatefulWidget {
  const EventsGoing({Key? key}) : super(key: key);

  @override
  State<EventsGoing> createState() => _EventsGoingState();
}

class _EventsGoingState extends State<EventsGoing> {
  var events = [];
  var isLoading = true;
  var isLoadJoin = false;



  getEvents()async{

    var headers = {
      'Cookie': 'DO-LB="MTAuMTA2LjAuMzo0NDM="; PHPSESSID=olit0bao631m3teu0ctts7pn9j; _us=1682598182; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-26%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'go_to_event',
      'action': 'get_going_events',
      'user_id':loginUserId.toString(),
      'offset': '100',
      'limit': '10'
    });


    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      events =body['data'];
      print("event == ${events}");
      setState(() {
        events;
      });
      setState(() {
        isLoading = false;
      });
    }
    else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  void initState() {
    getEvents();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return isLoading?Center(child: CircularProgressIndicator()):
    ListView.builder(
      itemCount: events.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(13),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 196,
                      child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10),),
                          child: Image.network(events[index]['cover'],fit: BoxFit.cover,))),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          events[index]['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFF4E5),
                            ),
                            child: Image.asset("assets/images/Calendar.png"),
                          ),
                          title: Text(
                            events[index]['start_date'],
                            style: TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            events[index]['end_date'],
                            style: TextStyle(
                                color: Color(0xFF747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFF4E5),
                            ),
                            child: Image.asset("assets/images/location.png"),
                          ),
                          title: Text(
                            events[index]['location'],
                            style: TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "36 Rot street, Los angeles",
                            style: TextStyle(
                                color: Color(0xFF747688),
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // events[index]['poster_id'] != loginUserId.toString() ?
                        //
                        // Column(children: [
                        //   isLoadJoin?Center(child: CircularProgressIndicator()):
                        //   GestureDetector(
                        //     onTap: (){
                        //       joinEvent( events[index]['id']);
                        //
                        //     },
                        //     child: Container(
                        //       height: 42,
                        //       width: double.infinity,
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         gradient: LinearGradient(colors: [
                        //           Color(0xFFFFC107),
                        //           Color(0xFFFF8205),
                        //         ],),
                        //       ),
                        //       child: Text("Join Now",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                        //     ),
                        //   ),
                        //   const SizedBox(
                        //     height: 10,
                        //   ),
                        //   GestureDetector(
                        //     onTap: (){
                        //       //   joinEvent( events[index]['id']);
                        //
                        //     },
                        //     child: Container(
                        //       height: 42,
                        //       width: double.infinity,
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         gradient: LinearGradient(colors: [
                        //           Color(0xFFFFC107),
                        //           Color(0xFFFF8205),
                        //         ],),
                        //       ),
                        //       child: Text("Intersted",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                        //     ),
                        //   )
                        // ],) : Container(),
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
