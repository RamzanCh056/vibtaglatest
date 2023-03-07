import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../../utils/constant.dart';
import 'package:http/http.dart' as http;

class YouNudge extends StatefulWidget {
  const YouNudge({Key? key}) : super(key: key);

  @override
  State<YouNudge> createState() => _YouNudgeState();
}

class _YouNudgeState extends State<YouNudge> {
  var data =[];
  var message ;
  getNudge()async{
    var headers = {
      'Cookie': 'PHPSESSID=288ebdafe331b5a837fde5bb40995888; _us=1671626884; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-20%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'nudge',
      'action': 'get',
      'user_id': '34099'
      // '34099'
      //loginUserId.toString(),
      //my user id //34099
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      body.toString().contains('message') ?
      message = body['message']
          : data = body['data'];
      body.toString().contains('data') ?
      data = body['data']:
      message = body['message'];

      print(" data is $data");
      print(" message is $message");

    }
    else {
      print(response.reasonPhrase);
    }

  }
  void initState() {
    getNudge();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F1F4FB'),
      body:   FutureBuilder(
          future: getNudge(),
          builder: (context,AsyncSnapshot snapshot) {
            if ( snapshot.connectionState == ConnectionState.waiting) {
              return
                const Center(
                  child: CircularProgressIndicator(),
                );

            } else {
              return
                message != "" && message !=null?  Center(child: Text(message.toString(), style: const TextStyle(fontSize: 22),)):
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount:
                    data.length,//photoList.length,
                    itemBuilder: (context, index) {
                      return

                        Container(
                          padding: spacing(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          margin: spacing(
                            horizontal: 5,
                            vertical: 5,
                          ),

                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(
                                10,
                              )),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 17,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xffFFDBBA),
                                    backgroundImage: NetworkImage(data[index]['avatar']),
                                    radius: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: data[index]['username'],
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 16),
                                            children: <TextSpan>[
                                              TextSpan(text: DateFormat(' h:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(
                                                  data[index]['lastseen']
                                              ) *
                                                  1000)
                                              ),
                                                style: TextStyle(
                                                    color: Color(0xff7D8CAC) ,fontSize: 12),

                                              )
                                            ]
                                        ),
                                      ),

                                      // Text(
                                      //   'Gwen Stacy',
                                      //   style: TextStyle(
                                      //     fontSize: textSm,
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          getNudge();
                                        },
                                        child: Text(
                                          "you Nudge",
                                          style: const TextStyle(color: Color(0xff485470)),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                            ],
                          ),
                        );

                    });
            }
          }),


      // ListView.builder(
      //   physics: const ScrollPhysics(),
      //   itemBuilder: buildListItem,
      //   itemCount: 10,
      //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      // ),
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      padding: spacing(
        horizontal: 5,
        vertical: 5,
      ),
      margin: spacing(
        horizontal: 5,
        vertical: 5,
      ),

      decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius(
            10,
          )),
      child: Column(
        children: [
          const SizedBox(
            height: 17,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffFFDBBA),
                radius: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Gwen Stacy ',
                        style: TextStyle(
                            color: Colors.black, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(text: '1hr ago',
                            style: TextStyle(
                                color: Color(0xff7D8CAC) ,fontSize: 12),

                          )
                        ]
                    ),
                  ),

                  // Text(
                  //   'Gwen Stacy',
                  //   style: TextStyle(
                  //     fontSize: textSm,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: (){
                      getNudge();
                    },
                    child: Text(
                      "Nudge you!",
                      style: const TextStyle(color: Color(0xff485470)),
                    ),
                  )
                ],
              ),
              const Expanded(child: Text("")),
              Container(
                height: height * 0.05,
                width: width * 0.30,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: borderRadius(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Nodge Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
        ],
      ),
    );
  }
}
