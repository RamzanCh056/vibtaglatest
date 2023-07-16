import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:http/http.dart' as http;

class CreateAlbum extends StatefulWidget {
  const CreateAlbum({super.key});

  @override
  State<CreateAlbum> createState() => _CreateAlbumState();
}

class _CreateAlbumState extends State<CreateAlbum> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  TextEditingController albumName = TextEditingController();
  File? imageFile;
  bool isLoading = false;
  createAlbum()async{
    setState(() {
      isLoading= true;
    });
    var headers = {
      'Cookie': 'DO-LB="MTAuMTA2LjAuNDo0NDM="; PHPSESSID=vjrgt9vu26u6i7keuqt66au4bf; _us=1686130213; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-06-06%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'create_album',
      'action': 'create_album',
      'user_id': loginUserId,
      'album_name': albumName.text,
    });
    request.files.add(await http.MultipartFile.fromPath('postPhotos[]', imageFile!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

    //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var status = body ['status'];
      status == 200?
      Fluttertoast.showToast(msg:"Album created" ): Fluttertoast.showToast(msg:"Error Occurred" );
    setState(() {
      isLoading= false;
    });
    }
    else {
    print(response.reasonPhrase);
    setState(() {
      isLoading= false;
    });
    }

  }

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
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NavBar(),
                    Header(
                    
                    ),
                  ],
                ),

                Container(
                  width: width,
                  height: height * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * 0.08,
                          width: width,
                          child: Card(
                            child: Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: spacing(
                                              horizontal: 7,
                                              vertical: 7,
                                            ),
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius:
                                                  borderRadius(width * 0.1),
                                            ),
                                            child: Icon(
                                              Icons.waving_hand_rounded,
                                              color: white,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Create Album',
                                            style: TextStyle(
                                              fontSize: textMed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 15, ),
                         child: Column(children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text("Album Name"),
                             ],
                           ),
                           SizedBox(height: 5,),
                           TextFormField(
                              controller: albumName,
                             decoration: InputDecoration(
                               hintText: 'My family tour',
                               contentPadding: const EdgeInsets.only(
                                 top: 0,
                                 left: 10,
                                 bottom: 0,
                               ),
                               hintStyle: TextStyle(
                                 fontSize: 12,
                                 color: lightblue,
                               ),
                               border: OutlineInputBorder(
                                 borderSide: BorderSide(
                                   width: 1,
                                   color: lightGrayNew,
                                 ),
                                 borderRadius: borderRadius(12),
                               ),
                             ),
                           ),
                           SizedBox(height: 15,),
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
                           SizedBox(height: 15,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             height: 130,
                             //padding: const EdgeInsets.symmetric(vertical: 20),
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: (imageFile != null)
                                     ? FileImage(imageFile!) as ImageProvider
                                     : const AssetImage(
                                   "assets/images/groupc.png",
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

                           // TextFormField(
                           //   //  controller: title,
                           //   decoration: InputDecoration(
                           //     hintText: 'Enter location',
                           //     contentPadding: const EdgeInsets.only(
                           //       top: 0,
                           //       left: 10,
                           //       bottom: 0,
                           //     ),
                           //     hintStyle: TextStyle(
                           //       fontSize: 12,
                           //       color: lightblue,
                           //     ),
                           //     border: OutlineInputBorder(
                           //       borderSide: BorderSide(
                           //         width: 1,
                           //         color: lightGrayNew,
                           //       ),
                           //       borderRadius: borderRadius(12),
                           //     ),
                           //   ),
                           // ),
                           // SizedBox(height: 10,),
                           // TextFormField(
                           //   //  controller: title,
                           //   decoration: InputDecoration(
                           //     hintText: 'Enter Salery',
                           //     contentPadding: const EdgeInsets.only(
                           //       top: 0,
                           //       left: 10,
                           //       bottom: 0,
                           //     ),
                           //     hintStyle: TextStyle(
                           //       fontSize: 12,
                           //       color: lightblue,
                           //     ),
                           //     border: OutlineInputBorder(
                           //       borderSide: BorderSide(
                           //         width: 1,
                           //         color: lightGrayNew,
                           //       ),
                           //       borderRadius: borderRadius(12),
                           //     ),
                           //   ),
                           // ),
                           // SizedBox(height: 10,),
                           // Row(
                           //   mainAxisAlignment: MainAxisAlignment.start,
                           //   children: [
                           //     Text("Gender"),
                           //   ],
                           // ),
                           // Row(children: [
                           //   Container(
                           //     height:35,
                           //     width: 80,
                           //
                           //     decoration: BoxDecoration(
                           //         borderRadius: BorderRadius.circular(50),
                           //        color: Colors.grey.shade200,
                           //
                           //
                           //     ),
                           //
                           //     child: Center(
                           //     child: Text('Both/Any'),
                           //   ),),
                           //   SizedBox(width: 10,),
                           //   Container(
                           //     height:35,
                           //     width: 80,
                           //
                           //
                           //
                           //     decoration: BoxDecoration(
                           //
                           //         borderRadius: BorderRadius.circular(50),
                           //         border: Border.all(color: Color(0xffFFC107))
                           //
                           //     ),
                           //     child: Center(
                           //       child: Text('Male', style: TextStyle(color:  Color(0xffFFC107)),),
                           //     ),),
                           //   SizedBox(width: 10,),
                           //   Container(
                           //     height:35,
                           //     width: 80,
                           //
                           //     decoration: BoxDecoration(
                           //       borderRadius: BorderRadius.circular(50),
                           //       color: Colors.grey.shade200,
                           //
                           //
                           //     ),
                           //
                           //     child: Center(
                           //       child: Text('Female'),
                           //     ),),
                           // ],),
                           // SizedBox(height: 10,),
                           // Row(
                           //   mainAxisAlignment: MainAxisAlignment.start,
                           //   children: [
                           //     Text("JOb Type"),
                           //   ],
                           // ),
                           // Row(children: [
                           //   Container(
                           //     height:35,
                           //     width: 80,
                           //
                           //     decoration: BoxDecoration(
                           //       borderRadius: BorderRadius.circular(50),
                           //       color: Colors.grey.shade200,
                           //
                           //
                           //     ),
                           //
                           //     child: Center(
                           //       child: Text('Part-Time'),
                           //     ),),
                           //   SizedBox(width: 10,),
                           //   Container(
                           //     height:35,
                           //     width: 80,
                           //
                           //
                           //
                           //     decoration: BoxDecoration(
                           //
                           //         borderRadius: BorderRadius.circular(50),
                           //         border: Border.all(color: Color(0xffFFC107))
                           //
                           //     ),
                           //     child: Center(
                           //       child: Text('Full Time', style: TextStyle(color:  Color(0xffFFC107)),),
                           //     ),),
                           //   SizedBox(width: 10,),
                           //   Container(
                           //     height:35,
                           //     width: 80,
                           //
                           //     decoration: BoxDecoration(
                           //       borderRadius: BorderRadius.circular(50),
                           //       color: Colors.grey.shade200,
                           //
                           //
                           //     ),
                           //
                           //     child: Center(
                           //       child: Text('Frelancer'),
                           //     ),),
                           // ],),
                           // SizedBox(height: 10,),
                           //
                           // TextFormField(
                           //   //  controller: title,
                           //   decoration: InputDecoration(
                           //     hintText: 'Enter Opening',
                           //     contentPadding: const EdgeInsets.only(
                           //       top: 0,
                           //       left: 10,
                           //       bottom: 0,
                           //     ),
                           //     hintStyle: TextStyle(
                           //       fontSize: 12,
                           //       color: lightblue,
                           //     ),
                           //     border: OutlineInputBorder(
                           //       borderSide: BorderSide(
                           //         width: 1,
                           //         color: lightGrayNew,
                           //       ),
                           //       borderRadius: borderRadius(12),
                           //     ),
                           //   ),
                           // ),
                           //
                           // SizedBox(height: 10,),
                           // TextFormField(
                           //   maxLines: 3,
                           //   //  controller: title,
                           //   decoration: InputDecoration(
                           //     hintText: 'Description',
                           //
                           //     hintStyle: TextStyle(
                           //       fontSize: 12,
                           //       color: lightblue,
                           //     ),
                           //     border: OutlineInputBorder(
                           //       borderSide: BorderSide(
                           //         width: 1,
                           //         color: lightGrayNew,
                           //       ),
                           //       borderRadius: borderRadius(12),
                           //     ),
                           //   ),
                           // ),
                           SizedBox(height: 10,),
                         ],),
                       ),
                        const SizedBox(
                          height: 30,
                        ),

                        Container(
                          width: width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: blue,
                                    ),
                                    Text(
                                      'Go Back',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              isLoading?Center(child: CircularProgressIndicator()):
                              GestureDetector(
                                onTap: (){
                                  createAlbum();
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
