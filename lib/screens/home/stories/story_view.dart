// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:story_view/story_view.dart';
//
// import '../../../utils/constant.dart';
// import 'example.dart';
//
//
// class MoreStories extends StatefulWidget {
//   MoreStories(this.storydata, this.currentIndex, {Key? key}) : super(key: key);
//
//   var storydata;
//   int currentIndex = 0;
//
//   @override
//   _MoreStoriesState createState() => _MoreStoriesState();
// }
//
// class _MoreStoriesState extends State<MoreStories> {
//   final storyController = StoryController();
//   String Url = "https://vibetagspace.nyc3.digitaloceanspaces.com/";
//   bool isLoading = true;
//   bool isdeleteLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     print("sdsdsd ==${widget.storydata[widget.currentIndex]['user_id']}");
//     getStoryList();
//     //getStoryList();
//   }
//
//   @override
//   void dispose() {
//     storyController.dispose();
//     super.dispose();
//   }
//   //
//   var tempList;
//   var viewvews = [];
//
//   getStoryList() async {
//     var headers = {
//       'Cookie':
//           'PHPSESSID=a38d9342ad0c8c7b3c3183e57bdef2da; _us=1678704132; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-12%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
//     request.fields.addAll({
//       'type': 'view_story_api',
//       'sub_type': 'view_single_story',
//       'user_id': widget.storydata[widget.currentIndex]['user_id'],
//       'logged_in_user_id': loginUserId.toString()
//     });
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       // print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//       tempList = body;
//       print("temp==${tempList['story']['view_count']}");
//       tempList['story']['view_count'] == 0?  Container():
//       viewvews = tempList ['story']['story_views'];
//
//     //  print("temp==${tempList['story']['view_count']}");
//       setState(() {
//         tempList;
//       });
//       setState(() {
//         isLoading = false;
//       });
//     } else {
//       print(response.reasonPhrase);
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   deleteStory()async{
//     setState(() {
//       isdeleteLoading = true;
//     });
//     var headers = {
//       'Cookie': '_us=1679138949; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-17%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
//     request.fields.addAll({
//       'type': 'delete_story',
//       'user_id':  loginUserId.toString(),
//       'story_id': widget.storydata[widget.currentIndex]['id'],
//     });
//
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//       setState(() {
//         isdeleteLoading = false;
//       });
//       Navigator.pop(context);
//     }
//     else {
//     print(response.reasonPhrase);
//     setState(() {
//       isdeleteLoading = false;
//     });
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: GestureDetector(
//             onTap: () {
//              // print("temp==${tempList['view_count']}");
//             },
//             child: Text(
//               widget.storydata[widget.currentIndex]['user_data']['username'],
//               style: TextStyle(color: Colors.white),
//             )),
//         actions: <Widget>[
//           widget.storydata[widget.currentIndex]['user_id'] == loginUserId.toString()
//               ?
//           isdeleteLoading? Center(child: CircularProgressIndicator()):
//           IconButton(
//                   icon: const Icon(
//                     Icons.delete,
//                     color: Colors.white,
//                   ),
//                   tooltip: 'Delete',
//                   onPressed: () {
//                    // print("vi==${viewvews}");
//                    // print("temp==${tempList['story']['view_count']}");
//                    deleteStory();
//                   },
//                 )
//               : Container(),
//           IconButton(
//             icon: const Icon(
//               Icons.remove_red_eye,
//               color: Colors.white,
//             ),
//             tooltip: 'Views',
//             onPressed: () async{
//
//                viewBottomsheet(context);
//               }
//
//           )
//         ],
//         //<Widget>[]
//         backgroundColor: Colors.black,
//       //  backgroundColor: Color(0xffFF9200),
//         elevation: 50.0,
//         centerTitle: true,
//       ),
//       body:
//       isLoading
//           ? Center(child: CircularProgressIndicator())
//          :
//       StoryView(
//               storyItems: [
//                 // StoryItem.text(
//                 //   title: "I guess you'd love to see more of our food. That's great.",
//                 //   backgroundColor: Colors.blue,
//                 // ),
//                 // StoryItem.text(
//                 //   title: "Nice!\n\nTap to continue.",
//                 //   backgroundColor: Colors.red,
//                 //   textStyle: TextStyle(
//                 //     fontFamily: 'Dancing',
//                 //     fontSize: 40,
//                 //   ),
//                 // ),
//
//                 StoryItem.pageImage(
//                   url: Url+widget.storydata[widget.currentIndex]['thumbnail'],
//                   caption: "${tempList['story']['view_count']} view",
//
//                   controller: storyController,
//                 ),
//                 // StoryItem.pageImage(
//                 //     url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
//                 //     caption: "Working with gifs",
//                 //     controller: storyController),
//                 // StoryItem.pageImage(
//                 //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
//                 //   caption: "Hello, from the other side",
//                 //   controller: storyController,
//                 // ),
//                 // StoryItem.pageImage(
//                 //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
//                 //   caption: "Hello, from the other side2",
//                 //   controller: storyController,
//                 // ),
//               ],
//               onStoryShow: (s) {
//                 print("Showing a story");
//               },
//               onComplete: () {
//                 Navigator.pop(context);
//                 print("Completed a cycle");
//               },
//               progressPosition: ProgressPosition.top,
//               repeat: false,
//               controller: storyController,
//             ),
//     );
//   }
//   viewBottomsheet(context) async{
//     showModalBottomSheet(
//         context: context,
//         backgroundColor: Colors.white,
//         isScrollControlled: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(17), topLeft: Radius.circular(17)),
//         ),
//
//         builder: ( BuildContext context ) {
//           return StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               return  GestureDetector(
//                 onTap: (){
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   height: 400,
//                   width: MediaQuery.of(context).size.width,
//                   padding: const EdgeInsets.all(10),
//                   decoration: const BoxDecoration(),
//                   child: Column(
//
//                     children: [
//                       const SizedBox(height: 10,),
//                       const Text("Viewers", style: TextStyle(color: Colors.black, fontSize: 18),),
//                       const SizedBox(height: 10,),
//                     //  Text("Are you sure you want to delete the chat with ${widget.list[widget.currentIndex].rec_name.toString()}?", style: const TextStyle(fontSize: 14),
//                       //  textAlign: TextAlign.center,
//                       ListView.builder(
//                         itemCount: viewvews.length,
//                           shrinkWrap: true,
//
//                           itemBuilder: (context, index){
//                         return Column(
//                           children: [
//                             ListTile(
//                               leading: CircleAvatar(
//                                 backgroundImage: NetworkImage(viewvews[index]['avatar']),
//
//                               ),
//                               title: Text(viewvews[index]['username']),
//
//                             ),
//                             Divider(thickness: 1,)
//                           ],
//                         );
//
//
//                       }),
//
//
//
//                     ],
//                   ),
//                 ),
//               );
//             } ,
//           );
//         }
//     );
//
//   }
// }
