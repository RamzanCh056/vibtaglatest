// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:record_mp3/record_mp3.dart';
// import 'package:vab_tag/controller/comments_controller.dart';
// import 'package:vab_tag/res/static_info.dart';
// import 'package:vab_tag/screens/home/reply_comments.dart';
//
// import '../../common/colors.dart';
// import '../../common/custom_buttons.dart';
// import 'home_page.dart';
//
// var commentIndex;
//
// class CommentsScreen extends StatefulWidget {
//   const CommentsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CommentsScreen> createState() => _CommentsScreenState();
// }
//
// class _CommentsScreenState extends State<CommentsScreen> {
//   Timer? _timer;
//   @override
//   void initState() {
//     print(postData);
//     //commentApi();
//     // getGif();
//     //addComment();
//     setState(() {
//
//     });
//     _timer = new  Timer.periodic(
//       const Duration(seconds: 1),
//           (Timer t) => updateState(),
//     );
//     super.initState();
//   }
//
//
//   @override
//   void dispose() {
//     _timer!.cancel();
//     super.dispose();
//
//   }
//   final commentController = TextEditingController();
//   final replyCommentController = TextEditingController();
//   final gifController = TextEditingController();
//   AudioPlayer audioPlayer = AudioPlayer();
//
//   bool _isRecording = false;
//   bool _recordingText = false;
//   String statusText = "";
//   bool isComplete = false;
//   bool isImage = false;
//   bool isAudio = false;
//   bool pause = false;
//   bool isLoading = false;
//   String audioFileUrl = '';
//   var urlAudio;
//   File? imageFile;
//   String audioBaseUrl = "https://vibetagspace.nyc3.digitaloceanspaces.com/";
//   bool reply = false;
//   var commentId;
//   var  gifData = [];
//   var gifLink;
//
//
//   // var commentId;
//   var check = Get.arguments[1];
//
//   getFromGallery() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//       Fluttertoast.showToast(msg: "Image selected");
//     }
//   }
//
//   updateState() {
//     print("calling get home from controller");
//     setState(() {
//       controller.getHomeData();
//     });
//   }
//
//   CommentsController controller = Get.put(CommentsController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       appBar: AppBar(
//
//         title: Text("Comments"),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: 1,
//                     shrinkWrap: true,
//                     physics: ScrollPhysics(),
//                     itemBuilder: (context, postIndex) {
//                       postIndex = Get.arguments[0];
//                       return Column(
//                         children: [
//                           ListView.builder(
//                               physics: ScrollPhysics(),
//
//                               padding:
//                               EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                               shrinkWrap: true,
//                               itemCount: postData[postIndex]['all_comments'].length,
//                               itemBuilder: (context, index) {
//
//                                 StaticInfo.PostId = postData[postIndex]['post_id'];
//                                 //  for (int index = 0; index < postData[postIndex]['all_comments'].length; )
//                                 // for (int i = 0; i < postData[postIndex]['all_comments'].length; i++){
//                                 //
//                                 // }
//                                 //  StaticInfo.commentId
//                                 commentId  =
//                                 postData[postIndex]['all_comments'];
//
//
//                                 urlAudio = postData[postIndex]['all_comments'][index];
//
//                                 return
//                                   isLoading
//                                       ? const Center(
//                                     child: SizedBox(
//                                         width: 80,
//                                         child: LoadingIndicator(
//                                             indicatorType: Indicator.ballBeat,
//                                             colors: [Colors.indigo],
//                                             strokeWidth: 2,
//                                             pathBackgroundColor: Colors.indigo)),
//                                   ):
//                                   Column(
//                                     children: [
//                                       postData[postIndex]['all_comments'][index]
//                                       ['record'] !=
//                                           ""
//                                           ?
//
//                                       Column(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.center,
//                                         children: [
//                                           Card(
//                                             color: Colors.grey[100],
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(15),
//                                             ),
//                                             child: Column(
//                                               children: [
//                                                 ListTile(
//                                                   leading: GestureDetector(
//                                                     onTap: () async {
//                                                       print(
//                                                           "audio url is ====  ${audioBaseUrl + postData[postIndex]['all_comments'][index]['record']}");
//                                                       urlAudio = audioBaseUrl +
//                                                           postData[postIndex]
//                                                           ['all_comments']
//                                                           [index]['record'];
//                                                       playAudio();
//                                                       setState(() {
//                                                         isAudio = !isAudio;
//                                                       });
//                                                     },
//                                                     child: isAudio
//                                                         ? Icon(Icons.pause)
//                                                         : Icon(Icons
//                                                         .play_circle_outline),
//                                                   ),
//                                                   title: Text(
//                                                     postData[postIndex]
//                                                     ['all_comments'][index]
//                                                     ['publisher']['username'],
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight.bold),
//                                                   ),
//                                                   // subtitle: Text(
//                                                   //   postData[postIndex]['all_comments'][index]
//                                                   //   ['text'],
//                                                   // ),
//                                                   trailing: Text(
//                                                     DateFormat('hh:mm a').format(
//                                                         DateTime
//                                                             .fromMillisecondsSinceEpoch(
//                                                             int.parse(
//                                                               postData[postIndex]
//                                                               [
//                                                               'all_comments']
//                                                               [
//                                                               index]['time'],
//                                                             ) *
//                                                                 1000)),
//                                                     style: TextStyle(
//                                                       color: Colors.grey.shade400,
//                                                       fontSize: 15.0,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Expanded(
//                                                       child: Column(
//                                                         children: [],
//                                                       ),
//                                                     ),
//                                                     GestureDetector(
//                                                         onTap: () {
//                                                           print("Comment Id for this one is = ${commentId[index]['id']}");
//                                                           StaticInfo.commentId = commentId[index]['id'];
//                                                           var replyComment = postData[postIndex]
//                                                           ['all_comments'][index]['all_replies']
//                                                               .isNotEmpty;
//                                                           Get.to(ReplyComment(),
//                                                               arguments: [index, replyComment]
//                                                           );
//                                                         },
//                                                         child: Text("Reply")),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     GestureDetector(
//                                                         onTap:(){
//                                                           //print("index is = $index");
//                                                         },
//                                                         child: Text("Edit")),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     GestureDetector(
//
//                                                         onTap: () {
//                                                           print("Comment Id for this one is = ${commentId[index]['id']}");
//
//
//                                                           controller.deleteComment(commentId[index]['id']);
//
//                                                           //  controller.deleteComment();
//                                                         },
//
//                                                         child: Icon(
//                                                           Icons.delete,
//                                                           color: kAppColor,
//                                                         )),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                           : Container(),
//                                       postData[postIndex]['all_comments'][index]
//                                       ['text'] !=
//                                           ""
//                                           ? Card(
//                                           color: Colors.grey[100],
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(15),
//                                           ),
//                                           child: Column(children: [
//                                             ListTile(
//                                               leading: GestureDetector(
//                                                 onTap: () async {
//                                                   //   print(i);
//                                                   // Display the image in large form.
//                                                   print("Comment Clicked");
//                                                 },
//                                                 child: Container(
//                                                   height: 50.0,
//                                                   width: 50.0,
//                                                   decoration: new BoxDecoration(
//                                                       color: Colors.blue,
//                                                       borderRadius:
//                                                       new BorderRadius.all(
//                                                           Radius.circular(50))),
//                                                   child: CircleAvatar(
//                                                     radius: 50,
//                                                     backgroundImage: NetworkImage(
//                                                       postData[postIndex]
//                                                       ['all_comments']
//                                                       [index]['publisher']
//                                                       ['avatar'],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               title: Text(
//                                                 postData[postIndex]['all_comments']
//                                                 [index]['publisher']
//                                                 ['username'],
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.bold),
//                                               ),
//                                               subtitle: Text(
//                                                 postData[postIndex]['all_comments']
//                                                 [index]['text'],
//                                               ),
//                                               trailing: Text(
//                                                 DateFormat('hh:mm a').format(
//                                                     DateTime
//                                                         .fromMillisecondsSinceEpoch(
//                                                         int.parse(
//                                                           postData[postIndex]
//                                                           [
//                                                           'all_comments']
//                                                           [
//                                                           index]['time'],
//                                                         ) *
//                                                             1000)),
//                                                 style: TextStyle(
//                                                   color: Colors.grey.shade400,
//                                                   fontSize: 15.0,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Column(
//                                                     children: [],
//                                                   ),
//                                                 ),
//                                                 GestureDetector(
//                                                     onTap: () {
//                                                       print("Comment Id for this one is = ${commentId[index]['id']}");
//                                                       StaticInfo.commentId = commentId[index]['id'];
//                                                       var replyComment = postData[postIndex]
//                                                       ['all_comments'][index]['all_replies']
//                                                           .isNotEmpty;
//                                                       Get.to(ReplyComment(),
//                                                           arguments: [index, replyComment]
//                                                       );
//                                                     },
//                                                     child: Text("Reply")),
//                                                 SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 Text("Edit"),
//                                                 SizedBox(
//                                                   width: 10,
//                                                 ),
//                                                 GestureDetector(
//                                                     onTap: () {
//                                                       print("Comment Id for this one is = ${commentId[index]['id']}");
//
//
//                                                       controller.deleteComment(commentId[index]['id']);
//
//                                                       //  controller.deleteComment();
//                                                     },
//                                                     child: Icon(
//                                                       Icons.delete,
//                                                       color: kAppColor,
//
//                                                     )),
//                                               ],
//                                             ),
//                                           ]))
//                                           : Container(),
//                                       postData[postIndex]['all_comments'][index]
//                                       ['c_file'] !=
//                                           ""
//                                           ? Card(
//                                           elevation: 5,
//                                           color: Colors.grey[100],
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(15),
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 15, vertical: 10),
//                                             child: Column(
//                                               children: [
//                                                 Row(children: [
//                                                   Text(
//                                                     postData[postIndex]
//                                                     ['all_comments'][index]
//                                                     ['publisher']['username'],
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                         FontWeight.bold),
//                                                   ),
//                                                   SizedBox(width: 15),
//                                                   Text(
//                                                     DateFormat('hh:mm a').format(
//                                                         DateTime
//                                                             .fromMillisecondsSinceEpoch(
//                                                             int.parse(
//                                                               postData[postIndex]
//                                                               [
//                                                               'all_comments']
//                                                               [
//                                                               index]
//                                                               ['time'],
//                                                             ) *
//                                                                 1000)),
//                                                     style: TextStyle(
//                                                       color: Colors.grey.shade400,
//                                                       fontSize: 15.0,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ]),
//                                                 SizedBox(height: 15),
//                                                 Container(
//                                                   height: 220,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                       BorderRadius.circular(20),
//                                                       color: Colors.grey.shade100,
//                                                       image: DecorationImage(
//                                                         image: NetworkImage(
//                                                           audioBaseUrl +
//                                                               postData[postIndex][
//                                                               'all_comments']
//                                                               [index]['c_file'],
//                                                         ),
//                                                         fit: BoxFit.cover,
//                                                       )),
//                                                 ),
//                                               ],
//                                             ),
//                                           ))
//                                           : Container(),
//                                     ],
//                                   );
//
//                               }),
//
//
//
//                         ],
//                       );
//                     }),
//
//               ),
//               SizedBox(height: 200,),
//             ],
//           ),
//
//           Positioned.fill(
//
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//
//                 elevation: 5,
//                 child: Container(
//                   height: 173,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                   ),
//                   width: double.infinity,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 5,
//                       ),
//                       ListTile(
//                         leading: Container(
//                           height: 50,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.amberAccent,
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                 getUserInfo["avatar"],
//                               ),
//                               //   fit: BoxFit.fill
//                             ),
//                           ),
//                         ),
//                         title: TextFormField(
//                           controller: commentController,
//                           decoration: new InputDecoration(
//                               hintText: 'Write a Comment'),
//                           keyboardType: TextInputType.multiline,
//                           textInputAction: TextInputAction.newline,
//                           minLines: 1,
//                           ///  maxLines: 5,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 imageFile != null
//                                     ? Container(
//                                   height: 45,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colors.grey,
//                                           width: 1),
//                                       borderRadius:
//                                       BorderRadius.circular(40),
//                                       color: Colors.grey.shade100,
//                                       image: DecorationImage(
//                                         image: FileImage(imageFile!),
//                                         fit: BoxFit.cover,
//                                       )),
//                                 )
//                                     : Container(),
//                               ],
//                             ),
//                           ),
//
//                           // IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_voice_rounded, color: kAppColor ,)
//                           // ),
//                           GestureDetector(
//                               onLongPressEnd: (LongPressEndDetailsd) {
//                                 setState(() {
//                                   _isRecording = true;
//                                   _recordingText = false;
//                                 });
//                                 stopRecord();
//                               },
//                               onLongPress: () {
//                                 startRecord();
//                                 setState(() {
//                                   _recordingText = true;
//                                 });
//                               },
//                               child: Icon(Icons.mic)),
//                           IconButton(
//                               onPressed: () {
//
//                                 getFromGallery();
//                               },
//                               icon: Icon(
//                                 Icons.image,
//                                 color: kAppColor,
//                               )),
//                           IconButton(
//                               onPressed: () {
//                                 _timer!.cancel();
//                                 // getGif();
//
//                                 showModalBottomSheet(
//                                     backgroundColor: Colors.white,
//                                     context: context,
//                                     isScrollControlled: true,
//                                     shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(25.0),
//                                       ),
//                                     ),
//                                     builder: (ctx) {
//                                       return Container(
//                                         //color: Colors.grey[600],
//                                           padding: EdgeInsets.all(15),
//                                           child: FractionallySizedBox(
//                                             heightFactor: 0.88,
//                                             child: Column(
//                                               children: [
//                                                 //Icon and Read by
//                                                 Row(
//                                                   children: [
//                                                     InkWell(
//                                                       onTap: (){
//
//                                                         Navigator.pop(context);
//                                                         initState();
//                                                       },
//                                                       child: Container(
//                                                         height: 35,
//                                                         width: 35,
//                                                         decoration: BoxDecoration(
//                                                             borderRadius: BorderRadius.circular(10),
//                                                             color: Color(0xFFF1F1F1)),
//                                                         child: Icon(Icons.keyboard_arrow_down_sharp),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 100,
//                                                     ),
//                                                     Text(
//                                                       "Gif",
//                                                       style: TextStyle(
//                                                           fontSize: 18, fontWeight: FontWeight.w500),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 20,
//                                                 ),
//                                                 TextFormField(
//                                                   controller:  gifController,
//                                                   onChanged: (value) {
//                                                     //Do something with the user input.
//                                                   },
//                                                   decoration: InputDecoration(
//                                                     errorStyle:
//                                                     const TextStyle(color: Colors.redAccent, fontSize: 15),
//                                                     filled: true,
//                                                     fillColor: Colors.grey[300],
//                                                     hintText: 'Search',
//                                                     suffixIcon: Icon(Icons.search),
//                                                     contentPadding:
//                                                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                                                     border: OutlineInputBorder(
//                                                       borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                                                     ),
//                                                     enabledBorder: OutlineInputBorder(
//                                                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                                                       borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                                                     ),
//                                                     focusedBorder: OutlineInputBorder(
//                                                       borderSide: BorderSide(color: Colors.grey, width: 2.0),
//                                                       borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                                                     ),
//                                                   ),
//                                                   validator: (value) {
//                                                     if (value == null || value.isEmpty) {
//                                                       return 'Please Enter UserName';
//                                                     }
//                                                     return null;
//                                                   },
//                                                 ),
//
//
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 FutureBuilder(
//                                                     future: getGif(),
//                                                     builder: (context, AsyncSnapshot snapshot) {
//                                                       if (snapshot.connectionState == ConnectionState.waiting) {
//                                                         return   CircularProgressIndicator();
//                                                       }
//                                                       else{
//                                                         return GridView.builder(
//                                                             itemCount:gifData.length,
//                                                             shrinkWrap: true,
//                                                             physics: ScrollPhysics(),
//                                                             //gifData.length,
//                                                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                                               crossAxisCount: 4,
//                                                               // crossAxisSpacing: 4.0,
//                                                               // mainAxisSpacing: 4.0
//                                                             ),
//                                                             itemBuilder: (context, index){
//
//                                                               return InkWell(
//                                                                 child: Column(
//                                                                   children: [
//                                                                     Container(
//                                                                       height: 80.0,
//                                                                       child:
//
//                                                                       Image.network(
//                                                                         gifData[index],
//                                                                         width: 75,
//
//                                                                         fit: BoxFit.cover,
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                                 onTap: () {
//                                                                   gifLink =gifData[index];
//                                                                   print("gif Link is $gifLink");
//                                                                   commentApi();
//                                                                   Navigator.pop(context);
//                                                                   initState();
//                                                                   setState(() {});
//                                                                 },
//                                                               );
//                                                             }
//
//                                                         );
//
//                                                       }
//                                                     }
//
//                                                 ),
//
//
//
//                                                 SizedBox(
//                                                   height: 70,
//                                                 )
//                                               ],
//                                             ),
//                                           ));
//                                     });
//                               },
//                               icon: Icon(
//                                 Icons.gif_rounded,
//                                 color: kAppColor,
//                               )),
//                           IconButton(
//                               onPressed: ()async {
//                                 commentApi();
//                                 await Future.delayed(Duration(seconds: 2));
//                                 commentController.clear();
//                               },
//                               icon: Icon(
//                                 Icons.send,
//                                 color: kAppColor,
//                               )),
//                         ],
//                       ),
//                       _isRecording
//                           ? SizedBox(
//                         height: 1,
//                       )
//                           : Container(),
//                       _isRecording ? _buildRecordingView() : Container(),
//                       _recordingText ? _onRecordingText() : Container(),
//                       SizedBox(
//                         height: 1,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//   getGif() async {
//     var headers = {
//       'Cookie': 'PHPSESSID=8e1f6cd0238282d3515f58e9aec9e7e3; _us=1665393821; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-10-09%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse(StaticInfo.baseUrl));
//     request.fields.addAll({
//       'type': 'get_gifs',
//       'user_id': StaticInfo.userIdLogin,
//       'keyword': gifController.text,
//     });
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       //print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//       gifData = body['data'];
//       print("the data of gif is $gifData");
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//
//   }
//   commentApi() async {
//     isLoading = true;
//     setState(() {});
//     print("post id in Api Function ${postData[commentIndex]['post_id']}");
//     print("User Id in api  ${StaticInfo.userIdLogin}");
//     print("the image url  ${imageFile}");
//     var headers = {
//       'Cookie':
//       'PHPSESSID=44fc1b63422c96d3a6aab2dfa07719f6; _us=1664551070; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-29%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse(StaticInfo.baseUrl));
//     request.fields.addAll({
//       'type': 'comment_add',
//       'post_id': postData[commentIndex]['post_id'].toString(),
//       'image_url': gifLink.toString(),
//       'text': commentController.text,
//       'user_id': StaticInfo.userIdLogin,
//     });
//     if (imageFile != null) {
//       request.files
//           .add(await http.MultipartFile.fromPath('image', imageFile!.path));
//       print("image file woth path is ${imageFile!.path}");
//     }
//     if (recordFilePath != "") {
//       request.files
//           .add(await http.MultipartFile.fromPath('audio', recordFilePath));
//     }
//     // request.files.add(await http.MultipartFile.fromPath('audio','path/to/file'));
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//
//       print(await response.stream.bytesToString());
//       setState(() {
//         isLoading = false;
//       });
//     } else {
//       print(response.reasonPhrase);
//       Fluttertoast.showToast(msg: "Something Wrong try again");
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   Widget _onRecordingText() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: kAppColor,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Center(
//           child: Text(
//             "Recoding Audio.....",
//             style: TextStyle(
//               fontSize: 15.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRecordingView() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: kAppColor,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             statusText,
//             style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                   child: CustButton(
//                     onTap: play,
//                     title: 'Play',
//                     fontSize: 14,
//                     height: 38,
//                   )),
//               SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                   child: CustButton(
//                     onTap: () {
//                       _isRecording = false;
//                       play(pause: true);
//                       recordFilePath = '';
//                       setState(() {});
//                     },
//                     title: 'Cancel',
//                     fontSize: 14,
//                     height: 38,
//                   )),
//               SizedBox(
//                 width: 10,
//               ),
//               statusText == "Record complete"
//                   ? Expanded(
//                   child: CustButton(
//                     onTap: () async {
//                       print("recording path $recordFilePath");
//                       commentApi();
//                       Fluttertoast.showToast(msg: "Voice send successfully");
//
//                       //    Get.to(MyHomePage());
//                       // await _postMessage();
//                     },
//                     title: 'Send',
//                     fontSize: 14,
//                     height: 38,
//                   ))
//                   : Container(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<bool> checkPermission() async {
//     if (!await Permission.microphone.isGranted) {
//       PermissionStatus status = await Permission.microphone.request();
//       if (status != PermissionStatus.granted) {
//         return false;
//       }
//     }
//     return true;
//   }
//
//   void startRecord() async {
//     bool hasPermission = await checkPermission();
//     if (hasPermission) {
//       statusText = "Recording...";
//       recordFilePath = await getFilePath();
//       isComplete = false;
//       RecordMp3.instance.start(recordFilePath, (type) {
//         statusText = "Record error--->$type";
//         setState(() {});
//       });
//       _isRecording = false;
//     } else {
//       statusText = "No microphone permission";
//     }
//     print(recordFilePath);
//     setState(() {});
//   }
//
//   void pauseRecord() {
//     if (RecordMp3.instance.status == RecordStatus.PAUSE) {
//       bool s = RecordMp3.instance.resume();
//       if (s) {
//         statusText = "Recording...";
//         setState(() {});
//       }
//     } else {
//       bool s = RecordMp3.instance.pause();
//       if (s) {
//         statusText = "Recording pause...";
//         setState(() {});
//       }
//     }
//   }
//
//
//
//
//
//
//   void stopRecord() {
//     bool s = RecordMp3.instance.stop();
//     if (s) {
//       statusText = "Record complete";
//       isComplete = true;
//       setState(() {});
//     }
//   }
//
//   void resumeRecord() {
//     bool s = RecordMp3.instance.resume();
//     if (s) {
//       statusText = "Recording...";
//       setState(() {});
//     }
//   }
//
//   String recordFilePath = "";
//
//   void play({bool pause = false}) {
//     if (recordFilePath != null && File(recordFilePath).existsSync()) {
//       if (pause) {
//         audioPlayer.pause();
//       } else {
//         audioPlayer.play(
//           UrlSource(recordFilePath),
//         );
//       }
//     }
//   }
//
//   void playAudio() {
//     print("url in function is =  $urlAudio");
//     if (urlAudio != null) {
//       if (pause) {
//         audioPlayer.pause();
//       } else {
//         audioPlayer.play(
//           UrlSource(urlAudio),
//         );
//       }
//     }
//   }
//
//   Future<String> getFilePath() async {
//     Directory storageDirectory = await getApplicationDocumentsDirectory();
//     String sdPath = storageDirectory.path + "/record";
//     var d = Directory(sdPath);
//     if (!d.existsSync()) {
//       d.createSync(recursive: true);
//     }
//     return sdPath + "/test_.mp3";
//   }
//
// }