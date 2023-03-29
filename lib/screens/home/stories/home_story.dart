import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibetag/screens/home/stories/story_model/story_model.dart';
import 'package:vibetag/screens/home/stories/story_view.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constant.dart';
import '../../story/add_story.dart';
import 'add_story.dart';
import 'example.dart';

class AddStroy extends StatefulWidget {
  AddStroy(this.modelUser, {Key? key}) : super(key: key);
  late Map<String, dynamic> modelUser;

  @override
  State<AddStroy> createState() => _AddStroyState();
}

class _AddStroyState extends State<AddStroy> {
  List<StoryModel> story = [];
  int currentindex = 0;
  var tempList = [];
  var liststory = [];

  getstoryList() {
    showStories();
  }

  showStories() async {
    var headers = {
      'Cookie':
          'PHPSESSID=e16316c39c4f51671a67b1f88196a334; _us=1678531348; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-10%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'view_story_api',
      'sub_type': 'view_all_stories',
      'user_id': loginUserId.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      tempList = body['data'];
      setState(() {
        tempList;
      });
      setState(() {
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }

  PickedFile? imageFile;
  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.grey.shade900,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18))),
        builder: (context) {
          return Column(
            children: [
              SizedBox(
                height: 25,
              ),
              ListTile(
                onTap: () {
                  takePhoto(
                    ImageSource.camera,
                  );
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                title: Text(
                  'Camera Roll',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  takePhoto(
                    ImageSource.gallery,
                  );
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                title: Text(
                  'Chose from Gallery',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(
      source: source,
      // maxHeight: 200,
      // maxWidth: 200,
      // imageQuality: 300
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateStroyWithEdit(imageFile!.path)));
      });
    }
  }

  // File? imageFile;
  // getImageGallery() async {
  //   PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = pickedFile;
  //       print("Image file =${imageFile}");
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => CreateStroyWithEdit(
  //                     imageFile,
  //                   )));
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    //  showStories();
    getstoryList();
    //getStoryList();
  }

  String Url = "https://vibetagspace.nyc3.digitaloceanspaces.com/";
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      double width = deviceWidth(context: context);
      double height = deviceHeight(context: context);
      return Container(
        width: width,
        height: height * 0.4,
        padding: spacing(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: white,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  addStory(context: context);
                },
                child: Container(
                  width: width * 0.45,
                  margin: spacing(
                    horizontal: width * 0.01,
                    vertical: height * 0.001,
                  ),
                  padding: spacing(
                    horizontal: 2,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: orangePrimary,
                    ),
                    borderRadius: BorderRadius.circular(
                      width * 0.015,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              width * 0.015,
                            ),
                            child: Image.network(
                              widget.modelUser['avatar'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            //print("object ${ tempList['thumbnail'].toString()}");
                            // addStory(context: context);
                            //  getStoryList();
                            showBottomSheet();
                          },
                          child: Center(
                            child: Container(
                              width: width * 0.2,
                              height: width * 0.2,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(192, 255, 255, 255),
                                borderRadius: borderRadius(width),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: white,
                                  size: 44,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                stream: getstoryList(),
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
                          scrollDirection: Axis.horizontal,
                          itemCount: tempList.length,
                          shrinkWrap: true,
                          itemBuilder: stroieWidget);
                },
              ),
            ],
          ),
        ),
      );
    }));
  }

  Widget stroieWidget(BuildContext context, int index) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return InkWell(
      onTap: () {
        print("temlist ==${tempList[index]['thumbnail']}");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StroyView(tempList, index)));
      },
      child: Container(
        width: width * 0.45,
        margin: spacing(
          horizontal: width * 0.01,
          vertical: height * 0.001,
        ),
        padding: spacing(
          horizontal: 2,
          vertical: 1,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: orangePrimary,
          ),
          borderRadius: BorderRadius.circular(
            width * 0.015,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        width * 0.015,
                      ),
                      child:
                          // isLoading
                          //     ? Image.network(
                          //         widget.user.avatar!,
                          //         fit: BoxFit.cover,
                          //       )
                          // :
                          netImage(tempList[index]['thumbnail'].toString(),),),
                )),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                tempList[index]['user_data']['username'].toString(),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget userWidget(BuildContext context, int index) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return InkWell(
      onTap: () {
        addStory(context: context);
      },
      child: Container(
        width: width * 0.45,
        margin: spacing(
          horizontal: width * 0.01,
          vertical: height * 0.001,
        ),
        padding: spacing(
          horizontal: 2,
          vertical: 1,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: orangePrimary,
          ),
          borderRadius: BorderRadius.circular(
            width * 0.015,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    width * 0.015,
                  ),
                  child: Image.network(
                    widget.modelUser['avatar'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              child: InkWell(
                onTap: () {
                  //print("object ${ tempList['thumbnail'].toString()}");
                  // addStory(context: context);
                  //  getStoryList();
                  showBottomSheet();
                },
                child: Center(
                  child: Container(
                    width: width * 0.2,
                    height: width * 0.2,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(192, 255, 255, 255),
                      borderRadius: borderRadius(width),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: white,
                        size: 44,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}





// Widget HomeStory({required ModelUser user,   }) {
//   return StatefulBuilder(builder: ((context, setState) {
//     double width = deviceWidth(context: context);
//     double height = deviceHeight(context: context);
//     return Container(
//       width: width,
//       height: height * 0.4,
//       padding: spacing(
//         vertical: 15,
//       ),
//       decoration: BoxDecoration(
//         color: white,
//       ),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         shrinkWrap: true,
//         itemBuilder: (context, i) {
//           if (i < 1) {
//             return InkWell(
//               onTap: () {
//                 addStory(context: context);
//               },
//               child: Container(
//                 width: width * 0.45,
//                 margin: spacing(
//                   horizontal: width * 0.01,
//                   vertical: height * 0.001,
//                 ),
//                 padding: spacing(
//                   horizontal: 2,
//                   vertical: 1,
//                 ),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     width: 2,
//                     color: orangePrimary,
//                   ),
//                   borderRadius: BorderRadius.circular(
//                     width * 0.015,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: 0,
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Container(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                             width * 0.015,
//                           ),
//                           child: Image.network(
//                             user.avatar!,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       child: InkWell(
//                         onTap: () {
//                          // addStory(context: context);
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateStroyWithEdit()));
//                         },
//                         child: Center(
//                           child: Container(
//                             width: width * 0.2,
//                             height: width * 0.2,
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(192, 255, 255, 255),
//                               borderRadius: borderRadius(width),
//                             ),
//                             child: Center(
//                               child: Icon(
//                                 Icons.add,
//                                 color: white,
//                                 size: 44,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//
//           }
//           if (i == 1) {
//             return InkWell(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreStories()));
//               },
//               child: Container(
//                 width: width * 0.45,
//                 margin: spacing(
//                   horizontal: width * 0.01,
//                   vertical: height * 0.001,
//                 ),
//                 padding: spacing(
//                   horizontal: 2,
//                   vertical: 1,
//                 ),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     width: 2,
//                     color: orangePrimary,
//                   ),
//                   borderRadius: BorderRadius.circular(
//                     width * 0.015,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: 0,
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Container(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                             width * 0.015,
//                           ),
//                           child: Image.network(
//                             "",
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             );
//
//           }
//
//           return Stack(
//             children: [
//               Container(
//                 width: width * 0.45,
//                 height: height * 0.36,
//                 margin: spacing(
//                   horizontal: width * 0.015,
//                   vertical: height * 0.001,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     width * 0.015,
//                   ),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.white,
//                       offset: Offset.zero,
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                     )
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(
//                     width * 0.015,
//                   ),
//                   child: Image.asset(
//                     'assets/images/cover.jpg',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 left: 10,
//                 child: Container(
//                   width: width * 0.09,
//                   height: width * 0.09,
//                   decoration: BoxDecoration(
//                     borderRadius: borderRadius(width),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: borderRadius(width),
//                     child: Image.asset(
//                       'assets/images/streamer.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 right: 10,
//                 child: Container(
//                   padding: spacing(
//                     horizontal: 7,
//                     vertical: 3,
//                   ),
//                   decoration: BoxDecoration(
//                     color: red,
//                     borderRadius: borderRadius(5),
//                   ),
//                   child: Text(
//                     'Live',
//                     style: TextStyle(
//                       color: white,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }));
//
// }

// return InkWell(
// onTap: () {
// addStory(context: context);
// },
// child: Container(
// width: width * 0.45,
// margin: spacing(
// horizontal: width * 0.01,
// vertical: height * 0.001,
// ),
// padding: spacing(
// horizontal: 2,
// vertical: 1,
// ),
// decoration: BoxDecoration(
// border: Border.all(
// width: 2,
// color: orangePrimary,
// ),
// borderRadius: BorderRadius.circular(
// width * 0.015,
// ),
// ),
// child: Stack(
// children: [
// Positioned(
// top: 0,
// bottom: 0,
// left: 0,
// right: 0,
// child: Container(
// child: ClipRRect(
// borderRadius: BorderRadius.circular(
// width * 0.015,
// ),
// child: Image.network(
// widget.user.avatar!,
// fit: BoxFit.cover,
// ),
// ),
// ),
// ),
// Positioned(
// child: InkWell(
// onTap: () {
// // print("temlist ==${tempList['thumbnail']}");
// //print("object ${ tempList['thumbnail'].toString()}");
// // addStory(context: context);
// //  getStoryList();
// // showStories();
// showStories();
// print(tempList.toString(),);
//
// // getImageGallery();
// },
// child: Center(
// child: Container(
// width: width * 0.2,
// height: width * 0.2,
// decoration: BoxDecoration(
// color: Color.fromARGB(192, 255, 255, 255),
// borderRadius: borderRadius(width),
// ),
// child: Center(
// child: Icon(
// Icons.add,
// color: white,
// size: 44,
// ),
// ),
// ),
// ),
// ),
// )
// ],
// ),
// ),
// );