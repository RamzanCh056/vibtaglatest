import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:vibetag/res/colors.dart';
import '../../res/static_info.dart';
import 'comments.dart';
import 'home.dart';


class ReplyComment extends StatefulWidget {
  const ReplyComment({Key? key}) : super(key: key);

  @override
  State<ReplyComment> createState() => _ReplyCommentState();
}

class _ReplyCommentState extends State<ReplyComment> {
  final replyCommentController = TextEditingController();

  @override
  void initState() {
    print(postData);
    replyComment();
    //addComment();
    setState(() {});
    // Timer.periodic(
    //   const Duration(seconds: 2),
    //   (Timer t) => updateState(),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Reply Comment"),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, postIndex) {
                      // postIndex =Get.arguments[5];

                      return Column(
                        children: [
                          ListView.builder(
                              physics: ScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              shrinkWrap: true,
                              itemCount: 1,
                              //1

                              itemBuilder: (context, index) {
                                //index = Get.arguments[postIndex];
                                index = Get.arguments[0];
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemCount: postData[commentIndex]
                                    ['all_comments'][index]
                                    ['all_replies']
                                        .length,
                                    itemBuilder: (context, replyComment) {
                                      return Column(
                                        children: [
                                          Card(
                                            color: Colors.grey[100],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                            ),
                                            child: ListTile(
                                              leading: GestureDetector(
                                                onTap: () async {},
                                                child: Container(
                                                  height: 50.0,
                                                  width: 50.0,
                                                  decoration: new BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                      new BorderRadius.all(
                                                          Radius.circular(
                                                              50))),
                                                  child: CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage: NetworkImage(
                                                        postData[commentIndex][
                                                        'all_comments']
                                                        [index]
                                                        [
                                                        'all_replies']
                                                        [replyComment][
                                                        'publisher']['avatar']),
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                postData[commentIndex][
                                                'all_comments'][
                                                index]['all_replies']
                                                [replyComment]
                                                ['publisher']['username'],
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                postData[commentIndex]
                                                ['all_comments']
                                                [index]['all_replies']
                                                [replyComment]['text'],
                                              ),
                                              trailing: Text(
                                                DateFormat('hh:mm a').format(
                                                    DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                        int.parse(
                                                          postData[commentIndex]['all_comments']
                                                          [
                                                          index]
                                                          [
                                                          'all_replies']
                                                          [
                                                          replyComment]['time'],
                                                        ) *
                                                            1000)),
                                                style: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              }),
                        ],
                      );
                    }),
              ),
            ],
          ),
          Positioned.fill(
            //top: 40,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[100],
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              StaticInfo.getUserInfo["avatar"],
                            ),
                            //   fit: BoxFit.fill
                          ),
                        ),
                      ),
                      title: TextFormField(
                        controller: replyCommentController,
                        decoration:
                        new InputDecoration(hintText: 'Write a reply'),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        minLines: 1,
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [],
                          ),
                        ),

                        // IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_voice_rounded, color: kAppColor ,)
                        // ),
                        GestureDetector(
                          // onLongPressEnd: (LongPressEndDetailsd) {
                          //   setState(() {
                          //     _isRecording = true;
                          //     _recordingText = false;
                          //   });
                          //   stopRecord();
                          // },
                          // onLongPress: () {
                          //   startRecord();
                          //   setState(() {
                          //     _recordingText = true;
                          //   });
                          // },
                            child: Icon(
                              Icons.mic,
                              color: kAppColor,
                            )),
                        IconButton(
                            onPressed: () {
                              // getFromGallery();
                            },
                            icon: Icon(
                              Icons.image,
                              color: kAppColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.gif_rounded,
                              color: kAppColor,
                            )),
                        IconButton(
                            onPressed: () async {
                              replyComment();
                              await Future.delayed(Duration(seconds: 2));
                              replyCommentController.clear();
                            },
                            icon: Icon(
                              Icons.send,
                              color: kAppColor,
                            )),
                      ],
                    ),
                    // _isRecording
                    //     ? SizedBox(
                    //   height: 10,
                    // )
                    //     : Container(),
                    // _isRecording
                    //     ? _buildRecordingView()
                    //     : Container(),
                    // _recordingText
                    //     ? _onRecordingText()
                    //     : Container(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  replyComment() async {
    print("comment id is : ${StaticInfo.commentId}");
    print("reply comment is : ${replyCommentController.text}");
    print("user id is : ${StaticInfo.userIdLogin}");

    var headers = {
      'Cookie':
      'PHPSESSID=7fab016cf3d5719111add76e95d84cb9; _us=1665001996; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-10-04%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'comment_reply_add',
      'comment_id': StaticInfo.commentId,
      'image_url': '',
      'text': replyCommentController.text,
      'user_id': StaticInfo.userIdLogin,
    });
    // request.files.add(await http.MultipartFile.fromPath(
    //     'image', 'invoice_logo_201c8e_751421.png')
    // );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
