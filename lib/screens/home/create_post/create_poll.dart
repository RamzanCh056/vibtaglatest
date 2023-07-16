import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vibetag/screens/home/create_post/audience_option.dart';
import 'package:vibetag/screens/home/create_post/category_option.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:http/http.dart' as http;

class CreatePoll extends StatefulWidget {
  const CreatePoll({super.key});

  @override
  State<CreatePoll> createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {
  bool isSwitch = true;
  bool isLoad = false;
  TextEditingController pollQuestion = TextEditingController();
  TextEditingController pollAnswerOne = TextEditingController();
  TextEditingController pollAnswerTwo = TextEditingController();

  createUserPost() async {
    print("poll one${pollAnswerOne.text}");
    print("poll two${pollAnswerTwo.text}");
    setState(() {
      isLoad = true;
      print("is load in api start== ${isLoad}");
    });

    var headers = {
      'Cookie':
      'PHPSESSID=f473f28ca40b056fd1a23e624a61bccc; _us=1667727587; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-11-05%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({

    'type': 'new_post',
    'user_id': loginUserId.toString(),
    'post_category': '1',
    'postText':  pollQuestion.text,
    'page_id': '',
    'event_id': '',
    'group_id': '',
    'postPrivacy': '',
    'postMap': '',
    'lat_': '',
    'lng_': '',
    'album_name': '',
    'feeling_type': '',
    'feeling': '',
    'postSticker': '',
    'post_color': '',
    'postRecord': '',
    'answer': '${pollAnswerOne.text}|${pollAnswerTwo.text}',
  });

    //  request.files.add(await http.MultipartFile.fromPath('postFile', '/path/to/file'));
    //  request.files.add(await http.MultipartFile.fromPath('postVideo', '/path/to/file'));
    // request.files.add(await http.MultipartFile.fromPath('postMusic', '/path/to/file'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      print("my body ==${body}");
      //var msg = body['api_text'];
      Fluttertoast.showToast(msg: "successfully uploaded");
      setState(() {
        isLoad = false;
      });
      Navigator.pop(context);

    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoad = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.9,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: spacing(
                horizontal: 25,
              ),
              child: Container(
                padding: spacing(
                  vertical: 20,
                ),
                child: Text(
                  'Create Poll',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              width: double.maxFinite,
              color: grayMed,
            ),
            gap(h: 15),
            Column(
              children: [
                Container(
                  margin: spacing(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Question',
                          style: TextStyle(
                            color: blackPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      gap(h: 7),
                      Container(
                        height: height * 0.05,
                        child: TextFormField(
                          controller:pollQuestion ,
                          decoration: InputDecoration(
                            hintText: 'Write your question',
                            hintStyle: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                gap(h: 30),
                Container(
                  height: 10,
                  width: double.maxFinite,
                  color: grayLight,
                ),
                gap(h: 30),
                Container(
                  margin: spacing(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Expiration',
                          style: TextStyle(
                            color: blackPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      gap(h: 7),
                      DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime(2000).toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        selectableDayPredicate: (date) {
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }
                          return true;
                        },
                        style: TextStyle(
                          color: grayMed,
                        ),
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                      gap(h: 30),
                      Container(
                        height: 10,
                        width: double.maxFinite,
                        color: grayLight,
                      ),
                      gap(h: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Option'),
                          Text(
                            '+ Add Option',
                            style: TextStyle(
                              color: orange,
                            ),
                          ),
                        ],
                      ),
                      gap(h: 7),
                      Container(
                        height: height * 0.05,
                        child: TextFormField(
                          controller: pollAnswerOne,
                          decoration: InputDecoration(
                            hintText: 'Write Option 1',
                            hintStyle: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(10),
                            ),
                          ),
                        ),
                      ),
                      gap(h: 12),
                      Container(
                        height: height * 0.05,
                        child: TextFormField(
                          controller: pollAnswerTwo,
                          decoration: InputDecoration(
                            hintText: 'Write Option 2',
                            hintStyle: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(10),
                            ),
                          ),
                        ),
                      ),
                      gap(h: 30),
                      Container(
                        height: 10,
                        width: double.maxFinite,
                        color: grayLight,
                      ),
                      gap(h: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Allow selecting mulitple option'),
                          Switch(
                            value: isSwitch,
                            onChanged: (value) {
                              setState(() {
                                isSwitch = value;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            gap(h: 30),
            Container(
              margin: spacing(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.35,
                    padding: spacing(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(10),
                      color: grayLight,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: grayMed,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  gap(w: 10),
                  isLoad?Center(child: CircularProgressIndicator()):
                  GestureDetector(
                    onTap: (){
                      createUserPost();
                    },
                    child: Container(
                      width: width * 0.35,
                      padding: spacing(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(10),
                        gradient: gradient,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
