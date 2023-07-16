import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:http/http.dart' as http;


class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController starDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();
  TextEditingController description = TextEditingController();
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
      });
    }
  }
  createEvent()async{
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'DO-LB="MTAuMTA2LjAuMzo0NDM="; PHPSESSID=os01tpe7v3hpe1pvs225sksgc1; _us=1681731365; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-16%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'create_event',
      'user_id':  loginUserId.toString(),
      'event-name': name.text,
      'event-locat': location.text,
      'event-description': description.text,
      'event-start-date': starDate.text,
      'event-start-time': startTime.text,
      'event-end-date': endDate.text,
      'event-end-time': endTime.text,
    });
    request.files.add(await http.MultipartFile.fromPath('event-cover', imageFile.toString()));
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
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return   Container(
      height: height * 0.8,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width * 0.95,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: borderRadius(10),
                ),
                padding: spacing(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Name",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                  filled: true,
                                  //fillColor: Colors.white,
                                  hintText: 'Enter name here',
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                  hintStyle: const TextStyle(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Location",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              showPlacePicker();
                            },
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                enabled: false,
                                controller: location,
                                decoration: InputDecoration(
                                    filled: true,
                                    //fillColor: Colors.white,
                                    hintText: 'Select Location',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                    hintStyle: const TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Start Date",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              selectDate(context, 0);
                            },
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                enabled: false,
                                controller: starDate,
                                decoration: InputDecoration(
                                    filled: true,
                                    //fillColor: Colors.white,
                                    hintText: 'Enter Start Date',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                    hintStyle: const TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "End Date",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              selectDate(context, 1);
                            },
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                enabled: false,
                                controller: endDate,
                                decoration: InputDecoration(
                                    filled: true,
                                    //fillColor: Colors.white,
                                    hintText: 'Enter end Date',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                    hintStyle: const TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Start Time",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              selectDate(context, 2);
                            },
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                enabled: false,
                                controller: startTime,
                                decoration: InputDecoration(
                                    filled: true,
                                    //fillColor: Colors.white,
                                    hintText: 'Enter Start Time',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                    hintStyle: const TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "End Time",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              selectDate(context, 3);
                            },
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                enabled: false,
                                controller: endTime,
                                decoration: InputDecoration(
                                    filled: true,
                                    //fillColor: Colors.white,
                                    hintText: 'Enter End Time',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                    hintStyle: const TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLines: 3,
                            controller: description,
                            decoration: InputDecoration(
                                filled: true,
                                //fillColor: Colors.white,
                                hintText: 'Enter description',
                                //contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                hintStyle: const TextStyle(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                            },
                          ),


                          const SizedBox(
                            height: 20,
                          ),

                        ],
                      ),
                    ),


                    GestureDetector(
                      onTap: (){
                        getFromCamera();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: (imageFile != null)
                                ? FileImage(imageFile!) as ImageProvider
                                : const NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4e2w7sqLN7wNvah3rnc3RbSILIsG7Bfdwa7haC-mEzRmj8bqeseg0241dzcF1W4yGkoU&usqp=CAU",
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [

                            Text(
                              'Drop Image Here or Browse to upload',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: width * 0.9,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  size: 32,
                                  color: accent,
                                ),
                                Text(
                                  'Go Back',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: accent,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                'Publish',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
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
          startTime.text = DateFormat('KK:MM a').format(selectDate!);

        }
        if (index == 3) {
          endTime.text = DateFormat('KK:MM a').format(selectDate!);

        }

      });
    }
  }
}
