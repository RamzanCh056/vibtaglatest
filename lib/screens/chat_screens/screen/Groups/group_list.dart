import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/utils/constant.dart';

import '../../constants.dart';
import '../../model/show_group_model.dart';
import 'group_type_message.dart';
import 'package:http/http.dart' as http;
class GroupShow extends StatefulWidget {
  const GroupShow({Key? key}) : super(key: key);

  @override
  State<GroupShow> createState() => _GroupShowState();
}

class _GroupShowState extends State<GroupShow> {
  List<ShowGroup> list = [];
  String Url = "https://vibetagspace.nyc3.digitaloceanspaces.com/";

  @override
  void initState() {
    getGroupList();
    super.initState();
  }

  bool isLoading = true;
  getGroupList() async{
    var headers = {
      'Cookie': 'PHPSESSID=fb614e82451085d2a0596fec403bb161; _us=1672490664; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-30%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'update_messages_list',
      'user_id': loginUserId.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body =  jsonDecode(res);
      var tempList = body['groups_messages'];
      for (int i = 0; i < tempList.length; i++) {
        ShowGroup getList = ShowGroup.fromJson(tempList[i]);
        list.add(getList);
      }
      setState(() {
        isLoading = false;
      });
      print ("user message == $list");
    }
    else {
      print(response.reasonPhrase);
    }


  }
  @override
  Widget build(BuildContext context) {

    return
      isLoading? const Center(child: CircularProgressIndicator()):
      ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroupTypeMessage(
                          list ,index
                      ))
              );

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
                              decoration:  BoxDecoration(
                                  shape: BoxShape
                                      .circle,
                                  image:  DecorationImage(
                                      image: NetworkImage(
                                        Url+list[index].avatar.toString(),
                                      )
                                  )
                              ),
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
                                    image:  DecorationImage(
                                        image: NetworkImage(
                                          Url+list[index].avatar.toString(),
                                        )
                                    )
                                ),
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
                              children:  [
                                Text(
                                  list[index].group_name.toString(),
                                  style:
                                  const TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                  ),
                                ),
                                const SizedBox(width: 14,),
                                Text(
                                  DateFormat('hh:mm a')
                                      .format(DateTime
                                      .fromMillisecondsSinceEpoch(
                                      int.parse(
                                        list[index].last_seen.toString(),
                                      ) *
                                          1000),),
                                  style: const TextStyle(
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                      color: Colors
                                          .black,
                                      fontSize:
                                      10),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Text(
                              list[index].message.toString(),
                              style: const TextStyle(
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
                              margin: const EdgeInsets.only(left: 90),
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
                                  image:  DecorationImage(
                                      image: NetworkImage(

                                        Url+list[index].avatar.toString(),

                                      )
                                  )
                              )
                              ,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.only(left: 60),
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
                                  image:  DecorationImage(
                                      image: NetworkImage(
                                        Url+list[index].avatar.toString(),
                                      )
                                  )
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.only(left: 30),
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
                                  image:  DecorationImage(
                                      image: NetworkImage(
                                        Url+list[index].avatar.toString(),
                                      )
                                  )
                              ),
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
                                  image:  DecorationImage(
                                      image: NetworkImage(
                                        Url+list[index].avatar.toString(),
                                      )
                                  )
                              ),
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
        });
  }
}
