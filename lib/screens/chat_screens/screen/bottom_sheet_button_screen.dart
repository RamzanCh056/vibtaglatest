import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:vab_tag/chat_screens/screen/private_message_screen.dart';
import '../../res/static_info.dart';
import '../../screens/chat/model/show_list_message_model.dart';
import '../constants.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/reusable_listtile.dart';
import 'package:http/http.dart' as http;

import 'group_type_message.dart';

class BottomSheetButtonScreen extends StatefulWidget {
  @override
  _BottomSheetButtonScreenState createState() =>
      _BottomSheetButtonScreenState();
}

class _BottomSheetButtonScreenState extends State<BottomSheetButtonScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<MessageList> list = [];
  @override
  void initState() {
    super.initState();
    messageList();
    _tabController = TabController(vsync: this, length: 3);
  }
  bool isLoading = true;

  messageList() {
    getListMessage();
  }

  getListMessage() async {
    var headers = {
      'Cookie':
      'PHPSESSID=fb614e82451085d2a0596fec403bb161; _us=1672490664; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-30%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'update_messages_list',
      'user_id': StaticInfo.userIdLogin.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      List tempList = body['user_messages'];
      final todo = tempList?.map((dynamic item) => MessageList.fromJson(item)).toList() ?? [];
      todo;
      list = todo;
      setState(() {
        isLoading = false;
      });
      print("user message == $list");
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height / 2),
                      context: context,
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(17),
                            topLeft: Radius.circular(17)),
                      ),
                      builder: (BuildContext bc) {

                        return StatefulBuilder(
                          builder: (context, setState) => Container(
                            height: MediaQuery.of(context).size.height - 150,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.symmetric(
                                          horizontal: BorderSide(
                                              color: greyColor, width: 0.6))),
                                  child: Wrap(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TabBar(
                                              padding: EdgeInsets.zero,
                                              indicatorColor: orangeColor,
                                              unselectedLabelColor: txtColor,
                                              unselectedLabelStyle: TextStyle(
                                                  fontSize:
                                                      screenWidthSize(16, context),
                                                  fontWeight: FontWeight.w700),
                                              labelColor: orangeColor,
                                              labelStyle: TextStyle(
                                                  fontSize:
                                                      screenWidthSize(16, context),
                                                  fontWeight: FontWeight.w700),
                                              controller: _tabController,
                                              tabs: const [
                                                Tab(
                                                  text: 'Chats',
                                                ),
                                                Tab(
                                                  text: 'Groups',
                                                ),
                                                Tab(
                                                  text: 'Pages',
                                                ),
                                              ]),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        Container(
                                          child: StreamBuilder(
                                            stream: messageList(),
                                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return const Center(child: CircularProgressIndicator());
                                              }
                                              if (snapshot.hasError) {
                                                return const Center(child: Text("Error Occured"));
                                              }
                                              return isLoading
                                                  ? Center(child: CircularProgressIndicator())
                                                  : ListView.builder(
                                                  physics: ScrollPhysics(), itemCount: list.length, shrinkWrap: true, itemBuilder: (context, index){
                                                    return Slidable(
                                                      key: const ValueKey(0),
                                                      endActionPane: ActionPane(
                                                        motion: const ScrollMotion(),
                                                        extentRatio: 0.13,
                                                        children: [
                                                          SlidableAction(
                                                            onPressed:
                                                                (BuildContext context) {
                                                              setState(() {
                                                                list
                                                                    .removeAt(index);
                                                              });
                                                              print(index);
                                                            },
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                            backgroundColor:
                                                            const Color(0xFFFD4F87),
                                                            foregroundColor:
                                                            Colors.white,
                                                            padding:
                                                            const EdgeInsets.only(
                                                                right: 10,
                                                                top: 10,
                                                                left: 10),
                                                            icon: Icons.delete,
                                                          ),
                                                        ],
                                                      ),

                                                      // The child of the Slidable is what the user sees when the
                                                      // component is not dragged.
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5.5),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                color: lightGrey,
                                                              ),
                                                              child: ListTile(
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => PrivateMessageScreen(
                                                                                list ,index
                                                                            ))
                                                                    );
                                                                  },
                                                                  minVerticalPadding: 0,
                                                                  leading: Stack(
                                                                    clipBehavior: Clip.none,
                                                                    alignment: Alignment.topRight,
                                                                    children: [
                                                                      StaticInfo.userIdLogin != list[index].rec_id
                                                                          ?
                                                                      Container(
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(30),
                                                                          child: Image.network(
                                                                            list[index].rec_pic.toString(),
                                                                            height: 55,
                                                                            fit: BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                        // backgroundColor: Colors.white10,
                                                                      ):
                                                                      Container(
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(30),
                                                                          child: Image.network(
                                                                            list[index].sen_pic.toString(),
                                                                            height: 55,
                                                                            fit: BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                        // backgroundColor: Colors.white10,
                                                                      ),

                                                                      list[index].online_status == "offline"?
                                                                      Positioned(
                                                                        top: -1,
                                                                        right: 3,
                                                                        child: Container(
                                                                          width: screenWidthSize(11, context),
                                                                          height: screenHeightSize(11, context),
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.grey,
                                                                              border: Border.all(width: 1, color: Colors.white),
                                                                              shape: BoxShape.circle),
                                                                        ),
                                                                      ): Positioned(
                                                                        top: -1,
                                                                        right: 3,
                                                                        child: Container(
                                                                          width: screenWidthSize(11, context),
                                                                          height: screenHeightSize(11, context),
                                                                          decoration: BoxDecoration(

                                                                              color: cyanGreenColor,
                                                                              border: Border.all(width: 1, color: Colors.white),
                                                                              shape: BoxShape.circle),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  subtitle: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      list[index].message != ""
                                                                          ?
                                                                      Text(
                                                                        list[index].message!.length >20
                                                                            ? (list[index].message!.substring(0, 20) + '...'.toString())
                                                                            : list[index].message!.toString(),
                                                                        style: TextStyle(
                                                                          fontWeight: FontWeight.w400,
                                                                          color: txtColor,
                                                                        ),
                                                                      ):Text(
                                                                        "Received",
                                                                        style: TextStyle(
                                                                          fontWeight: FontWeight.w400,
                                                                          color: txtColor,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                          alignment: Alignment.center,
                                                                          width: screenWidthSize(15, context),
                                                                          height: screenHeightSize(15, context),
                                                                          decoration: BoxDecoration(
                                                                            color: orangeColor,
                                                                            shape: BoxShape.circle,
                                                                          ),
                                                                          child: Text(
                                                                            '1',
                                                                            style: TextStyle(
                                                                                fontSize: screenWidthSize(10, context),
                                                                                color: Colors.white),
                                                                          )),
                                                                    ],
                                                                  ),
                                                                  title: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      StaticInfo.userIdLogin != list[index].rec_id
                                                                          ?
                                                                      Text(
                                                                        list[index].rec_name.toString(),
                                                                        style: TextStyle(
                                                                          fontSize: screenWidthSize(17, context),
                                                                          fontWeight: FontWeight.w500,
                                                                          color: fontColor,
                                                                        ),
                                                                      ):Text(
                                                                        list[index].sen_name.toString(),
                                                                        style: TextStyle(
                                                                          fontSize: screenWidthSize(17, context),
                                                                          fontWeight: FontWeight.w500,
                                                                          color: fontColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(
                                                                          list[index].sent_time.toString(),
                                                                        ) *
                                                                            1000)
                                                                        ),
                                                                        style: TextStyle(
                                                                          fontSize: screenWidthSize(13, context),
                                                                          fontWeight: FontWeight.w600,
                                                                          color: txtColor,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )),
                                                            ),























                                                          ],
                                                        ),
                                                      ),
                                                    );
                                              });
                                            },
                                          ),
                                        ),
                                        ListView.builder(
                                            itemCount: 10,
                                            itemBuilder: (_, index) {
                                              return GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (_){
                                                    return const GroupTypeMessage();
                                                  },),);
                                                },
                                                child: Card(
                                                  elevation: 0,
                                                  margin: const EdgeInsets.symmetric(
                                                      horizontal: 15, vertical: 5.5),
                                                  color: const Color(0xFFF1F4FB),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 80,
                                                                  decoration: const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      image: DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image: AssetImage(
                                                                              "assets/images/Ellipse 333.png"))),
                                                                ),
                                                                Positioned(
                                                                  bottom: -1,
                                                                  right: 0,
                                                                  child: Container(
                                                                    height: 35,
                                                                    width: 35,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            shape: BoxShape
                                                                                .circle,
                                                                            border:
                                                                                Border
                                                                                    .all(
                                                                              color: Colors
                                                                                  .white,
                                                                              width:
                                                                                  2,
                                                                            ),
                                                                            image: const DecorationImage(
                                                                                image:
                                                                                    AssetImage("assets/images/Ellipse 2 (3).png"))),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: const [
                                                                    Text(
                                                                      "UI/UX Designer Group",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 31,),
                                                                    Text(
                                                                      "3:02 PM",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w500,
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                const Text(
                                                                  "Have a good one!",
                                                                  style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        Colors.grey,
                                                                    fontSize: 14,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              children: [
                                                                Container(
                                                                  height: 40,
                                                                  width: 40,
                                                                  margin: EdgeInsets.only(left: 90),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          border:
                                                                              Border
                                                                                  .all(
                                                                            color: Colors
                                                                                .white,
                                                                            width: 2,
                                                                          ),
                                                                          image: const DecorationImage(
                                                                              image: AssetImage(
                                                                                  "assets/images/Ellipse 2 (3).png"))),
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: 40,
                                                                  margin: EdgeInsets.only(left: 60),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          border:
                                                                              Border
                                                                                  .all(
                                                                            color: Colors
                                                                                .white,
                                                                            width: 2,
                                                                          ),
                                                                          image: const DecorationImage(
                                                                              image: AssetImage(
                                                                                  "assets/images/Ellipse 2 (3).png"))),
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: 40,
                                                                  margin: EdgeInsets.only(left: 30),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          border:
                                                                              Border
                                                                                  .all(
                                                                            color: Colors
                                                                                .white,
                                                                            width: 2,
                                                                          ),
                                                                          image: const DecorationImage(
                                                                              image: AssetImage(
                                                                                  "assets/images/Ellipse 2 (3).png"))),
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          border:
                                                                              Border
                                                                                  .all(
                                                                            color: Colors
                                                                                .white,
                                                                            width: 2,
                                                                          ),
                                                                          image: const DecorationImage(
                                                                              image: AssetImage(
                                                                                  "assets/images/Ellipse 2 (3).png"))),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(width: 10,),
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              alignment:
                                                                  Alignment.center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape:
                                                                    BoxShape.circle,
                                                                border: Border.all(
                                                                  color: Colors.grey,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              child: const Text(
                                                                "3+",
                                                                style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight.w400,
                                                                  color: Colors.grey
                                                                ),
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            Container(
                                                              alignment: Alignment.center,
                                                              width: screenWidthSize(15, context),
                                                              height: screenHeightSize(15, context),
                                                              decoration: BoxDecoration(
                                                                color: orangeColor,
                                                                shape: BoxShape.circle,
                                                              ),
                                                              child: Text(
                                                                "2",
                                                                style: TextStyle(
                                                                    fontSize: screenWidthSize(10, context),
                                                                    color: Colors.white),
                                                              )),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                        const Center(
                                          child: Text('tabbar 2'),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Text('Chat')),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(17),
                            topLeft: Radius.circular(17)),
                      ), builder: (BuildContext context) {
                        return Container(
                          height: 440,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(),
                          child: Column(
                            children: [
                              ReusableListTile(
                                image: "assets/images/Vector (3).png",
                                title: "Reply",
                                handler: (){},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ReusableListTile(
                                image: "assets/images/Vector (4).png",
                                title: "Forward",
                                handler: (){},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ReusableListTile(
                                image: "assets/images/Star-3.png",
                                title: "Star message",
                                handler: (){},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ReusableListTile(
                                image: "assets/images/Union.png",
                                title: "Copy",
                                handler: (){},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ReusableListTile(
                                image: "assets/images/Group 77268.png",
                                title: "Delete message",
                                handler: (){},
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                        );
                  },);
                },
                child: const Text('chat 2')),
          ],
        ),
      ),
    );
  }
  // Widget buildListItem(BuildContext context, int index) {
  //   return Slidable(
  //       key: const ValueKey(0),
  //       endActionPane: ActionPane(
  //         motion: const ScrollMotion(),
  //         extentRatio: 0.13,
  //         children: [
  //           SlidableAction(
  //             onPressed:
  //                 (BuildContext context) {
  //               setState(() {
  //                 list
  //                     .removeAt(index);
  //               });
  //               print(index);
  //             },
  //             borderRadius:
  //             BorderRadius.circular(
  //                 12),
  //             backgroundColor:
  //             const Color(0xFFFD4F87),
  //             foregroundColor:
  //             Colors.white,
  //             padding:
  //             const EdgeInsets.only(
  //                 right: 10,
  //                 top: 10,
  //                 left: 10),
  //             icon: Icons.delete,
  //           ),
  //         ],
  //       ),
  //
  //       // The child of the Slidable is what the user sees when the
  //       // component is not dragged.
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Stack(
  //           children: [
  //             Container(
  //               margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5.5),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 color: lightGrey,
  //               ),
  //               child: ListTile(
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => PrivateMessageScreen(
  //                                 list ,index
  //                             ))
  //                     );
  //                   },
  //                   minVerticalPadding: 0,
  //                   leading: Stack(
  //                     clipBehavior: Clip.none,
  //                     alignment: Alignment.topRight,
  //                     children: [
  //                       StaticInfo.userIdLogin != list[index].rec_id
  //                           ?
  //                       Container(
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(30),
  //                           child: Image.network(
  //                             list[index].rec_pic.toString(),
  //                             height: 55,
  //                             fit: BoxFit.fill,
  //                           ),
  //                         ),
  //                         // backgroundColor: Colors.white10,
  //                       ):
  //                       Container(
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(30),
  //                           child: Image.network(
  //                             list[index].sen_pic.toString(),
  //                             height: 55,
  //                             fit: BoxFit.fill,
  //                           ),
  //                         ),
  //                         // backgroundColor: Colors.white10,
  //                       ),
  //
  //                       list[index].online_status == "offline"?
  //                       Positioned(
  //                         top: -1,
  //                         right: 3,
  //                         child: Container(
  //                           width: screenWidthSize(11, context),
  //                           height: screenHeightSize(11, context),
  //                           decoration: BoxDecoration(
  //                               color: Colors.grey,
  //                               border: Border.all(width: 1, color: Colors.white),
  //                               shape: BoxShape.circle),
  //                         ),
  //                       ): Positioned(
  //                         top: -1,
  //                         right: 3,
  //                         child: Container(
  //                           width: screenWidthSize(11, context),
  //                           height: screenHeightSize(11, context),
  //                           decoration: BoxDecoration(
  //
  //                               color: cyanGreenColor,
  //                               border: Border.all(width: 1, color: Colors.white),
  //                               shape: BoxShape.circle),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   subtitle: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       list[index].message != ""
  //                           ?
  //                       Text(
  //                         list[index].message!.length >20
  //                             ? (list[index].message!.substring(0, 20) + '...'.toString())
  //                             : list[index].message!.toString(),
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.w400,
  //                           color: txtColor,
  //                         ),
  //                       ):Text(
  //                         "Received",
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.w400,
  //                           color: txtColor,
  //                         ),
  //                       ),
  //                       Container(
  //                           alignment: Alignment.center,
  //                           width: screenWidthSize(15, context),
  //                           height: screenHeightSize(15, context),
  //                           decoration: BoxDecoration(
  //                             color: orangeColor,
  //                             shape: BoxShape.circle,
  //                           ),
  //                           child: Text(
  //                             '1',
  //                             style: TextStyle(
  //                                 fontSize: screenWidthSize(10, context),
  //                                 color: Colors.white),
  //                           )),
  //                     ],
  //                   ),
  //                   title: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       StaticInfo.userIdLogin != list[index].rec_id
  //                           ?
  //                       Text(
  //                         list[index].rec_name.toString(),
  //                         style: TextStyle(
  //                           fontSize: screenWidthSize(17, context),
  //                           fontWeight: FontWeight.w500,
  //                           color: fontColor,
  //                         ),
  //                       ):Text(
  //                         list[index].sen_name.toString(),
  //                         style: TextStyle(
  //                           fontSize: screenWidthSize(17, context),
  //                           fontWeight: FontWeight.w500,
  //                           color: fontColor,
  //                         ),
  //                       ),
  //                       Text(
  //                         DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(
  //                           list[index].sent_time.toString(),
  //                         ) *
  //                             1000)
  //                         ),
  //                         style: TextStyle(
  //                           fontSize: screenWidthSize(13, context),
  //                           fontWeight: FontWeight.w600,
  //                           color: txtColor,
  //                         ),
  //                       ),
  //                     ],
  //                   )),
  //             ),
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //           ],
  //         ),
  //       ),
  //   );
  //
  //
  //
  //
  //
  //
  // }


}
