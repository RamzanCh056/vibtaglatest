import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/screens/chat_screens/screen/pages/page_message.dart';
import '../../../utils/constant.dart';
import '../constants.dart';
import '../model/page_model.dart';
import 'package:http/http.dart' as http;
class PageChatShow extends StatefulWidget {
  const PageChatShow({Key? key}) : super(key: key);

  @override
  State<PageChatShow> createState() => _PageChatShowState();
}

class _PageChatShowState extends State<PageChatShow> {
  List<PageList> list = [];

  int id = 0;
  @override
  void initState() {
    super.initState();
    messageList();
  }
  bool isLoading = true;

  messageList() {
    getListPages();
  }

  getListPages() async {
    var headers = {
      'Cookie':
      'PHPSESSID=fb614e82451085d2a0596fec403bb161; _us=1672490664; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-30%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'update_messages_list',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      List tempList = body['page_messages'];
      final todo = tempList?.map((dynamic item) => PageList.fromJson(item)).toList() ?? [];
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
    return   Container(
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
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
              physics: const ScrollPhysics(), itemCount: list.length, shrinkWrap: true, itemBuilder: (context, index){




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
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightGrey,
                      ),
                      child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageMessage(
                                        list ,index
                                    ))
                            );
                          },
                          minVerticalPadding: 0,
                          leading: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                  list[index].page_avatar.toString(),
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

                              Text(
                                list[index].page_name.toString(),
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
    );
  }
}
