
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:intl/intl.dart';
import '../../../utils/constant.dart';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../widgets/navbar.dart';
import '../../header/header.dart';


class UpdateEvetns extends StatefulWidget {
  UpdateEvetns(this.events, this.currentIndex,{super.key});
  var events = [];
  int currentIndex;

  @override
  State<UpdateEvetns> createState() => _UpdateEvetnsState();
}

class _UpdateEvetnsState extends State<UpdateEvetns> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController starDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();
  TextEditingController description = TextEditingController();
  String? imageCover;
  double? longitude;
  double? latitude;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  LatLng addressLatLng = const LatLng(31.5204, 74.3587);
  showPlacePicker() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PlacePicker(
            apiKey: Platform.isAndroid
                ? 'AIzaSyC-DzQ5xVOl3ZPBMJ1ags_AczrUHFMEVMU'
                : "AIzaSyC-DzQ5xVOl3ZPBMJ1ags_AczrUHFMEVMU",
            hintText: "Select Location",
            searchingText: "Please wait ...",
            selectText: "Select place",
            outsideOfPickAreaText: "Place is not in area",
            initialPosition: addressLatLng,
            selectInitialPosition: true,
            onPlacePicked: (result) {
              location.text = result.formattedAddress!;
              addressLatLng = LatLng(result.geometry!.location.lat, result.geometry!.location.lng);
              latitude = result.geometry!.location.lat;
              longitude = result.geometry!.location.lng;
              Navigator.of(context).pop();
              setState(() {});
            },
          );
        },
      ),
    );
    setState(() {});
  }
  File? imageFile;
  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("image file is ==${imageFile}");
      });
    }
  }
  createEvent()async{
    //print("image file is ==${imageFile!.path}");
    print("event name is ${name.text}");
    print("event loc is ${location.text}");
    print("event dec is ${description.text}");
    print("event start time ${startTime.text}");
    print("event end time ${endTime.text}");
    print("event start date ${starDate.text}");
    print("event end date ${endDate.text}");
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'DO-LB="MTAuMTA2LjAuMzo0NDM="; PHPSESSID=os01tpe7v3hpe1pvs225sksgc1; _us=1681731365; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-16%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'update_event',
      'event_id': widget.events[widget.currentIndex]['id'],
      'user_id':  loginUserId.toString(),
      'event-name': name.text,
      'event-locat': location.text,
      'event-description': description.text,
      'event-start-date': starDate.text,
      'event-start-time': startTime.text,
      'event-end-date': endDate.text,
      'event-end-time':  endTime.text,
    });
    request.files.add(await http.MultipartFile.fromPath('event-cover', imageFile !=null? imageFile!.path: imageCover.toString() ));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message =body['api_text'];
      Fluttertoast.showToast(msg: message);
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


   getDataFunc(){
    name.text = widget.events[widget.currentIndex]['name'];
    imageCover = widget.events[widget.currentIndex]['cover'];
    location.text = widget.events[widget.currentIndex]['location'];
    description.text = widget.events[widget.currentIndex]['description'];
        starDate.text = widget.events[widget.currentIndex]['start_date'];
        endDate.text = widget.events[widget.currentIndex]['end_date'];
        startTime.text =  widget.events[widget.currentIndex]['start_time'];
        endTime.text= widget.events[widget.currentIndex]['end_time'];
  }


  @override
  void initState() {
    getDataFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return SafeArea(

      child: Scaffold(
        body: SingleChildScrollView(

          child: Column(
            children: [
              Column(
                children: [
                  NavBar(),
                  Header(),
                ],
              ),
              Container(
                height: height * 0.99,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        gap(h: 15),
                        Container(
                          width: width * 0.2,
                          height: 5,
                          decoration: BoxDecoration(
                            color: grayMed,
                            borderRadius: borderRadius(width),
                          ),
                        ),
                        gap(h: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Cover Image", style: TextStyle(color: Colors.black, fontSize: 16),),
                                Text("Recommend ratio is 12.9", style: TextStyle(color: Colors.grey.shade400, fontSize: 12),),

                              ],),
                            Expanded(child: SizedBox(width: 0,)),

                            GestureDetector(
                              onTap: (){
                                getFromCamera();
                              },
                              child: Container(
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xffC8D1E5).withOpacity(0.3),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera_alt),
                                    SizedBox(width: 5,),
                                    Text("Cover Image", style: TextStyle(color: Colors.black, fontSize: 12),),
                                  ],),
                              ),
                            ),
                            SizedBox(width: 5,),
                          ],),
                        SizedBox(height: 5,),
                        //imageFile != null?
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 130,
                          //padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: (imageFile != null)
                                  ? FileImage(imageFile!) as ImageProvider
                                  :  NetworkImage(
                                imageCover.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.grey.shade50, Colors.grey],
                            ),

                          ),

                        ),
                            //:Container(),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Name", style: TextStyle( fontSize: 14),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffC8D1E5)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            controller: name,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: InputBorder.none,
                                hintText: 'Enter Name',
                                hintStyle: TextStyle( fontSize: 13)
                            ),
                            validator: (val){
                              if (val!.isEmpty) {
                                return 'This is required field';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Location", style: TextStyle( fontSize: 14),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            showPlacePicker();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffC8D1E5)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              enabled: false,
                              controller: location,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  border: InputBorder.none,
                                  hintText: 'Select',
                                  hintStyle: TextStyle( fontSize: 13)
                              ),
                              validator: (val){
                                if (val!.isEmpty) {
                                  return 'This is required field';
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Start Date", style: TextStyle( fontSize: 14),),
                            SizedBox(width: 100,),
                            Text("Start Time", style: TextStyle( fontSize: 14),),
                          ],
                        ),
                        Column(children: [
                          Row(
                            children: [
                              Flexible(

                                child: GestureDetector(
                                  onTap: (){
                                    selectDate(context, 0);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xffC8D1E5)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      controller: starDate,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: InputBorder.none,
                                          hintText: 'Select',
                                          hintStyle: TextStyle( fontSize: 13)
                                      ),
                                      validator: (val){
                                        if (val!.isEmpty) {
                                          return 'This is required field';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Flexible(
                                child: GestureDetector(
                                  onTap: (){
                                    selectDate(context, 2);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xffC8D1E5)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      controller: startTime,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: InputBorder.none,
                                          hintText: 'Select',
                                          hintStyle: TextStyle( fontSize: 13)
                                      ),
                                      validator: (val){
                                        if (val!.isEmpty) {
                                          return 'This is required field';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],),
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("End Date", style: TextStyle( fontSize: 14),),
                            SizedBox(width: 100,),
                            Text("End Time", style: TextStyle( fontSize: 14),),
                          ],
                        ),
                        Column(children: [
                          Row(
                            children: [
                              Flexible(

                                child: GestureDetector(
                                  onTap: (){
                                    selectDate(context, 1);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xffC8D1E5)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      controller: endDate,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: InputBorder.none,
                                          hintText: 'Select',
                                          hintStyle: TextStyle( fontSize: 13)
                                      ),
                                      validator: (val){
                                        if (val!.isEmpty) {
                                          return 'This is required field';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Flexible(
                                child: GestureDetector(
                                  onTap: (){
                                    selectDate(context, 3);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xffC8D1E5)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextFormField(
                                      enabled: false,
                                      controller: endTime,
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: InputBorder.none,
                                          hintText: 'Select',
                                          hintStyle: TextStyle( fontSize: 13)
                                      ),
                                      validator: (val){
                                        if (val!.isEmpty) {
                                          return 'This is required field';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],),

                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Description", style: TextStyle( fontSize: 14),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffC8D1E5)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            maxLines: 3,
                            controller: description,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: InputBorder.none,
                                hintText: 'Enter Description',
                                hintStyle: TextStyle( fontSize: 13)
                            ),
                            validator: (val){
                              if (val!.isEmpty) {
                                return 'This is required field';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.35,
                                decoration: BoxDecoration(
                                  color: Color(0xffF1F4FB),
                                  borderRadius: borderRadius(10),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            isLoading? const CircularProgressIndicator():
                            GestureDetector(
                              onTap: (){

                                if(formKey.currentState!.validate()){
                                  //addBlog();
                                  createEvent();
                                }
                              },
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.35,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: borderRadius(10),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            )
                          ],)



                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  selectDate(BuildContext context, int index) async {
    DateTime? selectDate;
    await DatePicker.showDateTimePicker(context,
        showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
          selectDate = date;
        }, currentTime: DateTime.now());
    if (selectDate != null) {
      setState(() {
        if (index == 0) {
          starDate.text = DateFormat('yyyy-MM-dd').format(selectDate!);

        }
        if (index == 1) {
          endDate.text = DateFormat('yyyy-MM-dd').format(selectDate!);

        }
        if (index == 2) {
          startTime.text = DateFormat('h:mm').format(selectDate!);

        }
        if (index == 3) {
          endTime.text = DateFormat('h:mm').format(selectDate!);

        }

      });
    }
  }
}
