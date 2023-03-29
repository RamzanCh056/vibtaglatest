import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:story_viewer/customizer.dart';
import 'package:story_viewer/models/story_item.dart';
import 'package:story_viewer/models/user.dart';
import 'package:story_viewer/viewer.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constant.dart';

class StroyView extends StatefulWidget {
  StroyView(this.storydata, this.currentIndex, {Key? key}) : super(key: key);

  var storydata;
  int currentIndex = 0;
  @override
  _StroyViewState createState() => _StroyViewState();
}

class _StroyViewState extends State<StroyView> {
  bool isLoading = true;
  bool isdeleteLoading = false;
  var totalViews;

  @override
  void initState() {
    super.initState();
    print("sdsdsd ==${widget.storydata[widget.currentIndex]['user_id']}");
    getStoryList();
    print("init");
    //getStoryList();
  }

  @override
  void dispose() {
    super.dispose();
  }
  //

  getStoryList() async {
    var headers = {
      'Cookie':
          'PHPSESSID=a38d9342ad0c8c7b3c3183e57bdef2da; _us=1678704132; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-12%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'view_story_api',
      'sub_type': 'view_single_story',
      'user_id': widget.storydata[widget.currentIndex]['user_id'],
      'logged_in_user_id': loginUserId.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      tempList = body;
      print("temp==${tempList['story']['view_count']}");
      tempList['story']['view_count'] == 0
          ? Container()
          : viewvews = tempList['story']['story_views'];
      totalViews = tempList['story']['view_count'];

      //  print("temp==${tempList['story']['view_count']}");
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

  replyStory(messageStory) async {
    var headers = {
      'Cookie':
          'PHPSESSID=3ca580f3788b5b39167f039dfaf68664; _us=1679741296; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-24%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'view_story_api',
      'sub_type': 'reply_story',
      'user_id': loginUserId.toString(),
      'story_id': widget.storydata[widget.currentIndex]['id'],
      'reply': messageStory.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
        msg: "Story successfully sended",
      );
      messageStory = "";
      Navigator.pop(context);
    } else {
      print(response.reasonPhrase);
    }
  }

  deleteStory() async {
    setState(() {
      isdeleteLoading = true;
    });
    var headers = {
      'Cookie':
          '_us=1679138949; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-17%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'delete_story',
      'user_id': loginUserId.toString(),
      'story_id': widget.storydata[widget.currentIndex]['id'],
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      setState(() {
        isdeleteLoading = false;
      });
      //   Navigator.pop(context);
    } else {
      print(response.reasonPhrase);
      setState(() {
        isdeleteLoading = false;
      });
    }
  }

  var tempList;
  var viewvews = [];
  String Url = "https://vibetagspace.nyc3.digitaloceanspaces.com/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: widget.storydata[widget.currentIndex]['user_id'] ==
                loginUserId.toString()
            ? GestureDetector(
                onTap: () {
                  // print("temp==${tempList['view_count']}");
                },
                child: Text(
                  'Total Views ${totalViews != null ? totalViews.toString() : ""}',
                  style: TextStyle(color: Colors.white),
                ))
            : gap(),
        actions: <Widget>[
          widget.storydata[widget.currentIndex]['user_id'] ==
                  loginUserId.toString()
              ? isdeleteLoading
                  ? Center(child: CircularProgressIndicator())
                  : IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      tooltip: 'Delete',
                      onPressed: () {
                        // print("vi==${viewvews}");
                        // print("temp==${tempList['story']['view_count']}");
                        deleteStory();
                      },
                    )
              : Container(),
          widget.storydata[widget.currentIndex]['user_id'] ==
                  loginUserId.toString()
              ? IconButton(
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    viewBottomsheet(context);
                  })
              : gap(),
        ],
        //<Widget>[]
        backgroundColor: Colors.black,
        //  backgroundColor: Color(0xffFF9200),
        elevation: 50.0,
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : StoryViewer(
              padding: EdgeInsets.all(8),
              backgroundColor: Colors.green,
              //  ratio: StoryRatio.r16_9,
              stories: [
                StoryItemModel(
                    imageProvider: NetworkImage(Url +
                        widget.storydata[widget.currentIndex]['thumbnail'])),
              ],
              mediaFit: BoxFit.cover,
              setupCustomWidgets: ({StoryViewer? viewer, viewerController}) {
                print("viewer, ${viewer}");
              },
              customValues: Customizer(
                replyPlaceholder: "Reply",
                infoIcon: Icons.padding,
              ),
              titleStyle: TextStyle(color: Colors.white),
              trusted: true,
              displayerUserID: "user id",
              hasReply: true,
              // heroTag: "heroo",
              showSource: false,
              // getAdditionalLayersBeforeMedia: ({StoryViewer? viewer, StoryViewerController? viewerController}) {
              //   return [
              //     Container(
              //       color: Colors.black.withOpacity(0.5),
              //       child: Center(
              //         child: Text(
              //           'Additional Layer',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ];
              // },

              userModel: UserModel(
                username: widget.storydata[widget.currentIndex]['user_data']
                    ['username'],
                profilePicture: NetworkImage(
                  widget.storydata[widget.currentIndex]['user_data']['avatar'],
                ),
              ),
              onStoryReplied: (
                  {String? message, String? storyID, viewerController}) {
                print('Message: $message, Story ID: $storyID');
                replyStory(message);
              }),
    );
  }

  viewBottomsheet(context) async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(17), topLeft: Radius.circular(17)),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Viewers",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //  Text("Are you sure you want to delete the chat with ${widget.list[widget.currentIndex].rec_name.toString()}?", style: const TextStyle(fontSize: 14),
                      //  textAlign: TextAlign.center,
                      ListView.builder(
                          itemCount: viewvews.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(viewvews[index]['avatar']),
                                  ),
                                  title: Text(viewvews[index]['username']),
                                ),
                                Divider(
                                  thickness: 1,
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
