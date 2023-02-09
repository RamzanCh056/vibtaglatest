import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/screens/chat_screens/screen/profile_screen.dart';
import 'package:vibetag/screens/chat_screens/screen/view_media.dart';
import 'package:vibetag/utils/constant.dart';
import '../../constants.dart';
import '../../model/group_model.dart';
import '../../model/show_group_model.dart';
import 'package:http/http.dart' as http;

import '../../widgets/reusable_listtile.dart';
import '../audio_player.dart';
class GroupTypeMessage extends StatefulWidget {
   GroupTypeMessage(this.list,this.currentIndex,{key});
  List<ShowGroup> list;
  int currentIndex;

  @override
  State<GroupTypeMessage> createState() => _GroupTypeMessageState();
}

class _GroupTypeMessageState extends State<GroupTypeMessage> {
  String Url = "https://vibetagspace.nyc3.digitaloceanspaces.com/";
  List<GroupModelList> group = [];
  TextEditingController message = TextEditingController();
  bool isLoading = true;
  getGroupMessageList() {
    getGroupMessage();
  }
  @override
  void initState() {
    getGroupMessageList();
    print("my group id == ${ widget.list[widget.currentIndex].group_id.toString()}");
    super.initState();
  }
  sendGroupMessage()async{
    var headers = {
      'Cookie': 'PHPSESSID=d42e0993178c0413072e5c5757e7f5da; _us=1675947886; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-02-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'send_message',
      'sender_id': loginUserId.toString(),
      'page_id': '',
      'group_id': widget.list[widget.currentIndex].group_id.toString(),
      'user_or_group': 'group',
      'chatSticker': '',
      'is_reply': '',
      'is_multi_reply': '',
      'msg':  message.text =='' ? '' : message.text,
      'search_location': '',
      'lat': '',
      'lng': '',
      'files_array': ''
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      message.text = "";
    }
    else {
      print(response.reasonPhrase);
    }

  }
    getGroupMessage()async{

      var headers = {
        'Cookie': 'PHPSESSID=d42e0993178c0413072e5c5757e7f5da; _us=1675940843; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-02-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
      request.fields.addAll({
        'type': 'messages',
        'sub_type': 'get_messages',
        'user_id': loginUserId.toString(),
        'msg_userid': '1',
        'user_or_group': 'group',
        'msg_pageid':
        //'74',

        widget.list[widget.currentIndex].group_id.toString(),
        'page_random': ''
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {

        //print(await response.stream.bytesToString());
        var res = await response.stream.bytesToString();
        var body = jsonDecode(res);
        List tempList = body['messages'];
        final todo = tempList?.map((dynamic item) => GroupModelList.fromJson(item)).toList() ?? [];
        todo;
        group = todo;
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, screenHeightSize(70, context)),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: highShadeOrangeColor,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                  "$Url${ widget.list[widget.currentIndex].avatar.toString()}",
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                            // backgroundColor: Colors.white10,
                          ),
                          Positioned(
                            top: -1,
                            right: 3,
                            child: Container(
                              width: screenWidthSize(11, context),
                              height: screenHeightSize(11, context),
                              decoration: BoxDecoration(
                                  color: lightGreenColor,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.list[widget.currentIndex].group_name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: screenWidthSize(15, context)),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Last Seen: Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: screenWidthSize(12, context)),
                            ),
                          ],
                        ),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  color: orangeColor.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: SvgPicture.asset(
                                'assets/images/Video-2.svg',
                              )),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: orangeColor.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: SvgPicture.asset(
                                'assets/images/Fill 6-8.svg',
                              )),
                          const SizedBox(
                            width: 7,
                          ),
                          // SvgPicture.asset('assets/images/Group 76594.svg'),
                          PopupMenuButton(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              onSelected: (value) {
                                if (value == "View Profile") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return const ProfileScreen();
                                      },
                                    ),
                                  );
                                } else if (value == "View Media") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return const ViewMedia();
                                      },
                                    ),
                                  );
                                }
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              itemBuilder: (_) {
                                final List items = [
                                  "View Profile",
                                  "View Media",
                                  "Mute Notification",
                                  "Delete Chat",
                                  "Block",
                                  "Report",
                                ];
                                return items
                                    .map((e) => PopupMenuItem(
                                          value: e.toString(),
                                          child: Text(
                                            e.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ))
                                    .toList();
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        body:  Column(
          children: [

            StreamBuilder(

              stream: getGroupMessageList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Error Occured"));
                }
                return

                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                    child: ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: group.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(17), topLeft: Radius.circular(17)),
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 440,
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      children: [
                                        ReusableListTile(
                                          image: "assets/images/Vector (3).png",
                                          title: "Reply",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ReusableListTile(
                                          image: "assets/images/Vector (4).png",
                                          title: "Forward",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ReusableListTile(
                                          image: "assets/images/Star-3.png",
                                          title: "Star message",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ReusableListTile(
                                          image: "assets/images/Union.png",
                                          title: "Copy",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ReusableListTile(
                                          image: "assets/images/Group 77268.png",
                                          title: "Delete message",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children:  [

                                      Text(
                                        DateFormat('hh:mm a').format(
                                            DateTime.fromMillisecondsSinceEpoch(int.parse(
                                              group[index].sent_time.toString(),
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
                                  const SizedBox(height: 5,),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFFEBEFFB)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        Text(
                                          group[index].sen_name.toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          group[index].message.toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )

                          );

                        }),
                  );
              },
            ),
            // SizedBox(height: 70,),
            Container(

              height: 60,
              color: const Color(0xffF5F5F5),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        //_AddModalBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 25,
                        color: Color(0xffFFBB60),
                      )),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          controller: message,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.emoji_emotions),
                            hintText: 'Write message here...',
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //  isLoadMessage?const CircularProgressIndicator():
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF9200),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              sendGroupMessage();
                              // Future.delayed(const Duration(seconds: 2), () {
                              //   message.text = "";
                              // });
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,)
                ],
              ),
            ),

          ],
        )


      ),
    );
  }
}
