import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:vibetag/screens/chat_screens/screen/picture_send.dart';
import 'package:vibetag/screens/chat_screens/screen/picture_with_message.dart';
import 'package:vibetag/screens/chat_screens/screen/profile_screen.dart';
import 'package:vibetag/screens/chat_screens/screen/send_documents.dart';
import 'package:vibetag/screens/chat_screens/screen/send_message_widget.dart';
import 'package:vibetag/screens/chat_screens/screen/view_media.dart';
import 'package:vibetag/utils/constant.dart';

import '../../../methods/api.dart';
import '../../../methods/auth_method.dart';
import '../../../provider/userProvider.dart';
import '../constants.dart';
import '../model/show_list_message_model.dart';
import '../video_call/dialing_call.dart';
import '../video_call/video_call.dart';
import '../widgets/reusable_listtile.dart';
import 'audio_player.dart';
import 'forward_message.dart';
import 'get_messages/get_location.dart';
import 'get_messages/get_message.dart';
import 'location_send.dart';

// ignore: must_be_immutable
class PrivateMessageScreen extends StatefulWidget {
  PrivateMessageScreen(this.list, this.currentIndex, {key});

  List<MessageList> list;
  int currentIndex;

  @override
  State<PrivateMessageScreen> createState() => _PrivateMessageScreenState();
}

class _PrivateMessageScreenState extends State<PrivateMessageScreen> {
  List<MessageList> User = [];
  String? comaSepread;
  var newComaSpreated;
  var coomas;
  var checker;
  bool isTapAudioCallButton = false;
  bool isTapVideoCallButton = false;

  String messageId = '';
  String? forwardMessage;
  String? forwardMessageOwner;
  bool notification = false;
  String Url = "https://vibetagspace.nyc3.digitaloceanspaces.com/";
  TextEditingController message = TextEditingController();
  List<String> names = [
    'Document',
    'Camera',
    'Gallery',
    'Audio',
    'Location',
    'Recording',
    'Gifs',
    'Stickers',
    'Chat Colors',
  ];
  List<String> iconImage = [
    'document.png',
    'camera.png',
    'gallery.png',
    'audio.png',
    'location.png',
    'recording.png',
    'gif.png',
    'sticker.png',
    'colors.png',
  ];
  List<Color> colorContainer = [
    const Color(0xff4C9CF6),
    const Color(0xff00D9C7),
    const Color(0xffFF635B),
    const Color(0xff7169ED),
    const Color(0xffFF834E),
    const Color(0xffF5BF00),
    const Color(0xff7CFF67),
    const Color(0xffFB7DFE),
    const Color(0xff59CDFF),
  ];
  List<String> report = [
    'its spam',
    'Nudity and secual content',
    'Hate speech or symbols',
    'Misleading',
    'False information',
    'Bullying or harassment',
    'Scam or fraud',
    'Intellectual property violation',
    'Something else',
  ];
  bool isLoadDelete = false;
  var friendsShow = [];
//  var reportMsg;

  //deleteChat
  deleteUserChat() async {
    setState(() {
      isLoadDelete = true;
    });
    var headers = {
      'Cookie':
          'PHPSESSID=1a6ca9532b9dbe54ed613305d5448a6d; _us=1678959434; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-15%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'delete_user_messages',
      'user_id': loginUserId.toString(),
      'id': loginUserId.toString() != widget.list[widget.currentIndex].rec_id
          ? widget.list[widget.currentIndex].rec_id.toString()
          : widget.list[widget.currentIndex].sen_id.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        isLoadDelete = false;
      });
      Navigator.pop(context);
    } else {
      setState(() {
        isLoadDelete = false;
      });
    }
  }

  starMessage() async {
    var headers = {
      'Cookie':
          'PHPSESSID=558814a9b559f9f3430937461ca16eaf; _us=1679656414; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-23%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'starred_message',
      'user_id': loginUserId.toString(),
      'id': messageId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      messageId = '';
      Fluttertoast.showToast(
        msg: "Successfully Star message",
      );
      Navigator.pop(context);
    } else {
      messageId = '';
    }
  }

  deleteSingleMessage() async {
    var headers = {
      'Cookie':
          'PHPSESSID=4b08ad7934d732a61e99022f394ece54; _us=1677931513; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-03%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'delete_message',
      'user_id': loginUserId.toString(),
      'id': messageId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      messageId = '';
      Navigator.pop(context);
    } else {
      messageId = '';
    }
  }

  var msgForReport;
  reportUser() async {
    var headers = {
      'Cookie':
          '_us=1679741950; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-24%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'reports',
      'sub_type': 'report_user',
      'logged_in_user': loginUserId.toString(),
      'user': loginUserId.toString() != widget.list[widget.currentIndex].rec_id
          ? widget.list[widget.currentIndex].rec_id.toString()
          : widget.list[widget.currentIndex].sen_id.toString(),
      'text': msgForReport.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      succedRepotBottomsheet(context);
    } else {}
  }

  blockUser() async {
    var headers = {
      'Cookie':
          'PHPSESSID=a97d64197f4baa9af5db29b603e75926; _us=1679900333; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-26%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'block_user',
      'sub_type': 'block_user',
      'user_id': loginUserId.toString(),
      'recipient_id':
          loginUserId.toString() != widget.list[widget.currentIndex].rec_id
              ? widget.list[widget.currentIndex].rec_id.toString()
              : widget.list[widget.currentIndex].sen_id.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg:
            "successfully block ${widget.list[widget.currentIndex].rec_name.toString()}",
      );
      Navigator.pop(context);
    } else {}
  }

  var followUnfollowUser;
  followUnfollow() async {
    var headers = {
      'Cookie':
          'PHPSESSID=a97d64197f4baa9af5db29b603e75926; _us=1679902906; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-26%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'follow_like_join',
      'action': 'follow_user',
      'user_id':
          loginUserId.toString() != widget.list[widget.currentIndex].rec_id
              ? widget.list[widget.currentIndex].rec_id.toString()
              : widget.list[widget.currentIndex].sen_id.toString(),
      'loggedin_user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      followUnfollowUser = body['follow_status'];
      setState(() {
        followUnfollowUser;
      });
      Fluttertoast.showToast(
        msg:
            "successfully ${followUnfollowUser} ${widget.list[widget.currentIndex].rec_name.toString()}",
      );
      Navigator.pop(context);
    } else {}
  }

  showFriends() async {
    var headers = {
      'Cookie':
          'PHPSESSID=7ee5959d740757be46a90f376da9ad94; _us=1679557919; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-22%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'get_friends_pages_groups',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      friendsShow = body['data']['friends'];
      setState(() {
        friendsShow;
      });
    } else {}
  }

  late GoogleMapController _googleMapController;
  final Set<Marker> markers = Set();
  var showLocation;
  String? addres;
  String pickedAddres = "";
  bool isLoading = true;
  bool isLoadMessage = false;
  bool isUploadFile = false;
  double? longitude;
  double? latitude;
  LatLng addressLatLng = const LatLng(31.5204, 74.3587);
  PlatformFile? file;
  String? docName;
  String? docPath;
  Map<String, dynamic> user = {};
  Map<String, dynamic> remote_User = {};

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result == null) return;
    file = result.files.first;
    //   final path = result.files.single.path!;

    setState(() {
      docName = file!.name;
      docPath = file!.path;
      if (docPath != null || docPath != "") {
        setState(() {
          uploadMessageFile();
        });
      }
    });
  }

  var reviveriD;

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
              pickedAddres = result.formattedAddress!;
              addressLatLng = LatLng(
                  result.geometry!.location.lat, result.geometry!.location.lng);
              latitude = result.geometry!.location.lat;
              longitude = result.geometry!.location.lng;
              sendMessage();
              Navigator.of(context).pop();
              setState(() {});
            },
          );
        },
      ),
    );
    setState(() {});
  }

//  late final PageManager _pageManager;

  @override
  void initState() {
    getMessage();
    showFriends();

    // _pageManager = PageManager();
    super.initState();
  }

  @override
  void dispose() {
    // _pageManager.dispose();
    super.dispose();
  }

  bool isLoad = true;

  getMessageList() {
    if (mounted) {
      getMessage();
    }
  }

  bool pause = false;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isForward = false;

  forwardMessages(reviveriD) async {
    var headers = {
      'Cookie':
          '_us=1679557919; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-22%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'forward_message',
      'user_id': loginUserId.toString(),
      'receiver_type': 'user',
      'rec_id': reviveriD.toString(),
      'page_id': '0',
      'group_id': '0',
      'msg_id': messageId.toString() == '' ? '' : messageId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        isForward = false;
      });
      Fluttertoast.showToast(
        msg: "Succefully forward message",
      );
      setState(() {
        messageId = "";
      });
      Navigator.pop(context);
    } else {
      setState(() {
        messageId = "";
      });
      setState(() {
        isForward = false;
      });
    }
  }

  sendMessage() async {
    setState(() {
      isLoadMessage = true;
    });
    var headers = {
      'Cookie':
          'PHPSESSID=90e40ddd3b2b744419153f3f747c2560; _us=1673018056; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-01-05%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'send_message',
      'sender_id': loginUserId.toString(),
      'rec_id':
          //widget.list[widget.currentIndex].rec_id.toString(),
          loginUserId.toString() != widget.list[widget.currentIndex].rec_id
              ? widget.list[widget.currentIndex].rec_id.toString()
              : widget.list[widget.currentIndex].sen_id.toString(),
      'page_id': '',
      'group_id': '',
      'user_or_group': 'user',
      'chatSticker': stickerUrl.toString() == '' ? '' : stickerUrl.toString(),
      'is_reply': messageId.toString() == '' ? '' : messageId.toString(),
      'is_multi_reply': '',
      'msg': message.text == '' ? '' : message.text,
      'search_location': pickedAddres.toString(),
      'lat': latitude == null ? '' : latitude.toString(),
      'lng': longitude == null ? '' : longitude.toString(),
      'files_array': comaSepread.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      message.text = "";

      setState(() {
        isLoadMessage = false;
      });
      setState(() {
        _isForwardMessage = false;
        _byDefaultMessage = true;
      });
      Future.delayed(const Duration(seconds: 4), () {
        imageFileList = [];
        comaSepread = '';
        docPath = null;
        messageId = '';
        stickerUrl = '';
      });
    } else {
      setState(() {
        isLoadMessage = false;
      });
    }
  }

  getMessage() async {
    var headers = {
      'Cookie':
          '_us=1672569576; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-31%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'get_messages',
      'user_id': loginUserId.toString(),
      'msg_userid':
          loginUserId.toString() != widget.list[widget.currentIndex].rec_id
              ? widget.list[widget.currentIndex].rec_id.toString()
              : widget.list[widget.currentIndex].sen_id.toString(),
      'user_or_group': 'user',
      'msg_pageid': '',
      'page_random': ''
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      List tempList = body['messages'];
      final todo = tempList
              ?.map((dynamic item) => MessageList.fromJson(item))
              .toList() ??
          [];
      todo;
      User = todo;
    } else {
      setState(() {
        isLoading = false;
      });
    }

    remote_User = await AuthMethod().getUserData(
        loginUserId != widget.list[widget.currentIndex].rec_id
            ? widget.list[widget.currentIndex].rec_id.toString()
            : widget.list[widget.currentIndex].sen_id.toString());
  }

  bool _isForwardMessage = false;
  bool _byDefaultMessage = true;
  String? orignalMessage;

  @override
  Widget build(BuildContext context) {
    String remote_user_name =
        loginUserId != widget.list[widget.currentIndex].rec_id
            ? widget.list[widget.currentIndex].rec_name.toString()
            : widget.list[widget.currentIndex].sen_name.toString();
    remote_user_id = loginUserId != widget.list[widget.currentIndex].rec_id
        ? widget.list[widget.currentIndex].rec_id.toString()
        : widget.list[widget.currentIndex].sen_id.toString();
    user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, screenHeightSize(70, context)),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            //backgroundColor: highShadeOrangeColor,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Color(0xFFC107), Colors.yellow]),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // Stack(
                        //   clipBehavior: Clip.none,
                        //   alignment: Alignment.bottomRight,
                        //   children: [
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(30),
                        //       child: Image.network(
                        //         loginUserId !=
                        //                 widget.list[widget.currentIndex].rec_id
                        //             ? widget.list[widget.currentIndex].rec_pic
                        //                 .toString()
                        //             : widget.list[widget.currentIndex].sen_pic
                        //                 .toString(),
                        //         height: 45,
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //     widget.list[widget.currentIndex].online_status ==
                        //             "online"
                        //         ? Positioned(
                        //             top: -1,
                        //             right: 3,
                        //             child: Container(
                        //               width: screenWidthSize(11, context),
                        //               height: screenHeightSize(11, context),
                        //               decoration: BoxDecoration(
                        //                   color: widget
                        //                               .list[widget.currentIndex]
                        //                               .online_status ==
                        //                           "online"
                        //                       ? lightGreenColor
                        //                       : Colors.grey,
                        //                   border: Border.all(
                        //                       width: 1, color: white),
                        //                   shape: BoxShape.circle),
                        //             ),
                        //           )
                        //         : Positioned(
                        //             bottom: -1,
                        //             right: 3,
                        //             child: Container(
                        //               width: screenWidthSize(11, context),
                        //               height: screenHeightSize(11, context),
                        //               decoration: BoxDecoration(
                        //                   color: widget
                        //                               .list[widget.currentIndex]
                        //                               .online_status ==
                        //                           "offline"
                        //                       ? Colors.grey
                        //                       : Colors.transparent,
                        //                   border: Border.all(
                        //                       width: 1, color: white),
                        //                   shape: BoxShape.circle),
                        //             ),
                        //           ),
                        //   ],
                        // ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loginUserId !=
                                      widget.list[widget.currentIndex].rec_id
                                  ? widget.list[widget.currentIndex].rec_name
                                      .toString()
                                  : widget.list[widget.currentIndex].sen_name
                                      .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: white,
                                  fontSize: screenWidthSize(15, context)),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Last Seen: ${widget.list[widget.currentIndex].last_online.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: white,
                                  fontSize: screenWidthSize(12, context)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (!isTapVideoCallButton) {
                                  isTapVideoCallButton = true;
                                  setState(() {});
                                  final result = await API().postData({
                                    'type': 'calling',
                                    'action': 'create_new_audio_call',
                                    'caller_id': loginUserId.toString(),
                                    'receiver_id': remote_user_id,
                                  });
                                  final response =
                                      jsonDecode(result.body)['data'];
                                  activeCallId = response['id'].toString();
                                  channel = getRandString(12);
                                  await API().createAlertPush(
                                    body:
                                        'New Video Call From ${remote_user_name}',
                                    title: 'New Video Call',
                                    fcm: 'Private_Call_${remote_user_id}',
                                    mapData: {
                                      'name': user['name'].toString(),
                                      'avatar': user['avatar'].toString(),
                                      'username': user['username'].toString(),
                                      'user_id': user['user_id'].toString(),
                                      'rec_id': remote_user_id.toString(),
                                      'channel': channel,
                                      'call_type': '1',
                                      'call_action': 'user',
                                      'call_id': '${activeCallId}',
                                      "click_action":
                                          "FLUTTER_NOTIFICATION_CLICK",
                                    },
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VideoCall(
                                        user_id: widget
                                            .list[widget.currentIndex].rec_id
                                            .toString(),
                                        name: remote_User['name'],
                                        avatar: remote_User['avatar'],
                                        username: remote_User['username'],
                                        id: remote_User['user_id'],
                                      ),
                                    ),
                                  );
                                  isTapVideoCallButton = false;
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    color: orangeColor.withOpacity(0.03),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1,
                                      color: isTapVideoCallButton ? blue : white,
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/Video-2.svg',
                                    color: isTapVideoCallButton ? blue : white,
                                  )),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (!isTapAudioCallButton) {
                                  isTapAudioCallButton = true;
                                  setState(() {});
                                  final result = await API().postData({
                                    'type': 'calling',
                                    'action': 'create_new_audio_call',
                                    'caller_id': loginUserId.toString(),
                                    'receiver_id': remote_user_id,
                                  });
                                  final response =
                                      jsonDecode(result.body)['data'];
                                  activeCallId = response['id'].toString();
                                  channel = getRandString(12);

                                  await API().createAlertPush(
                                    body:
                                        'New Voice Call From ${remote_user_name}',
                                    title: 'New Voice Call',
                                    fcm: 'Private_Voice_Call_${remote_user_id}',
                                    mapData: {
                                      'name': user['name'].toString(),
                                      'avatar': user['avatar'].toString(),
                                      'username': user['username'].toString(),
                                      'user_id': user['user_id'].toString(),
                                      'rec_id': remote_user_id.toString(),
                                      'call_type': '0',
                                      'channel': channel,
                                      'call_action': 'user',
                                      "click_action":
                                          "FLUTTER_NOTIFICATION_CLICK",
                                      'verified': user['verified'].toString(),
                                    },
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DailingCall(
                                        is_remote: false,
                                        name: remote_User['name'].toString(),
                                        avatar:
                                            remote_User['avatar'].toString(),
                                        username:
                                            remote_User['username'].toString(),
                                        id: remote_User['user_id'].toString(),
                                        verified: int.parse(
                                            remote_User['verified'].toString()),
                                      ),
                                    ),
                                  );
                                  isTapAudioCallButton = false;
                                }
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: orangeColor.withOpacity(0.03),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        width: 1,
                                        color: isTapAudioCallButton ? blue : white,
                                      )),
                                  child: SvgPicture.asset(
                                    'assets/images/Fill 6-8.svg',
                                    color: isTapAudioCallButton ? blue : white,
                                  )),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            // SvgPicture.asset('assets/images/Group 76594.svg'),
                            PopupMenuButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: white,
                                  size: 28,
                                ),
                                onSelected: (value) {
                                  if (value == "View Profile") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return ProfileScreen(
                                            widget.currentIndex,
                                            widget.list,
                                          );
                                        },
                                      ),
                                    );
                                  } else if (value == "View Media") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return const ViewMedia();
                                        },
                                      ),
                                    );
                                  } else if (value == "Delete Chat") {
                                    deleteChatBottomsheet(context);
                                  } else if (value == "Block") {
                                    blockUserBottomsheet(context);
                                  } else if (value == "Unfollow") {
                                    unfollowUserBottomsheet(context);
                                  } else if (value == "Follow") {
                                    unfollowUserBottomsheet(context);
                                  } else if (value == "Report") {
                                    reportUserBottomsheet(context);
                                  }
                                },
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                itemBuilder: (_) {
                                  final List items = [
                                    "View Profile",
                                    "View Media",
                                    followUnfollowUser.toString() ==
                                            'unfollowed'
                                        ? "Follow"
                                        : "Unfollow",
                                    "Delete Chat",
                                    "Block",
                                    "Report",
                                  ];
                                  return items
                                      .map((e) => PopupMenuItem(
                                            value: e.toString(),
                                            child: Text(
                                              e.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ))
                                      .toList();
                                }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder(
              stream: getMessageList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Error Occured"));
                }
                return isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: User.length,
                            itemBuilder: (context, index) {
                              // User[index].is_reply.toString() ==  User[index].id.toString() ?
                              // orignalMessage = User[index].message.toString():Text("data");
                              // checker = DateFormat('hh:mm a').format(DateTime.now());
                              // print("cheker == $checker");
                              // checker == DateFormat('hh:mm a').format(
                              //     DateTime.fromMillisecondsSinceEpoch(int.parse(
                              //       User[index].sent_time.toString(),
                              //     ) *
                              //         1000)) && loginUserId == User[index].rec_id ?
                              //
                              // AwesomeNotifications().createNotification(
                              //
                              //     content: NotificationContent(
                              //       //   autoDismissible: true,
                              //         id: 123,
                              //         channelKey: 'basic',
                              //         //set configuration wuth key "basic"
                              //         title: loginUserId != widget.list[widget.currentIndex].rec_id
                              //             ? widget.list[widget.currentIndex].rec_name.toString()
                              //             : widget.list[widget.currentIndex].sen_name.toString(),
                              //         body: User.last.message,
                              //         payload: {"name": "FlutterCampus"}
                              //
                              //     )
                              // ) : Container();
                              // Future.delayed(
                              //
                              //     const Duration(seconds: 5), () {
                              //   print("call");
                              //   checker == "u";
                              //   print("checker==$checker");
                              //
                              //   // AwesomeNotifications().dismissAllNotifications();
                              //   //AwesomeNotifications().dismiss(123);
                              // });

                              showLocation = LatLng(
                                  double.parse(
                                    User[index].lat!,
                                  ),
                                  double.parse(
                                    User[index].lng!,
                                  ));
                              addres = User[index].message.toString();
                              return GestureDetector(
                                onLongPress: () {
                                  messageId = User[index].id.toString();
                                  forwardMessageOwner = User[index].sen_name;
                                  forwardMessage =
                                      User[index].message.toString();

                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: white,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(17),
                                          topLeft: Radius.circular(17)),
                                    ),
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 440,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          children: [
                                            ReusableListTile(
                                              image:
                                                  "assets/images/Vector (3).png",
                                              title: "Reply",
                                              handler: () {
                                                setState(() {
                                                  _byDefaultMessage = false;
                                                  _isForwardMessage = true;
                                                });
                                                Navigator.pop(context);
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ReusableListTile(
                                              image:
                                                  "assets/images/Vector (4).png",
                                              title: "Forward",
                                              handler: () {
                                                forwardBottomsheet(context);
                                                //Navigator.pop(context);
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ReusableListTile(
                                              image: "assets/images/Star-3.png",
                                              title: "Star message",
                                              handler: () {
                                                starMessage();
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ReusableListTile(
                                              image: "assets/images/Union.png",
                                              title: "Copy",
                                              handler: () {
                                                Clipboard.setData(ClipboardData(
                                                        text: User[index]
                                                            .message
                                                            .toString()))
                                                    .then((_) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              'Copied to your clipboard !')));
                                                });
                                                Navigator.pop(context);
                                                messageId = "";
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ReusableListTile(
                                              image:
                                                  "assets/images/Group 77268.png",
                                              title: "Delete message",
                                              handler: () {
                                                deleteSingleMessage();
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, left: 10),
                                  child: Column(
                                    children: [
                                      loginUserId != User[index].rec_id
                                          ? Column(
                                              children: [
                                                User[index].attachment_url ==
                                                            "" &&
                                                        User[index].is_map !=
                                                            "1"
                                                    ? User[index].is_reply !=
                                                            "0"
                                                        ? ForwardMessage(
                                                            User[index]
                                                                .message
                                                                .toString(),
                                                            User[index]
                                                                .sent_time
                                                                .toString(),
                                                            User[index]
                                                                .is_reply
                                                                .toString(),
                                                            User,
                                                            index,
                                                          )
                                                        : UserSendMessage(
                                                            User[index]
                                                                .message
                                                                .toString(),
                                                            User[index]
                                                                .sent_time
                                                                .toString(),
                                                            User[index]
                                                                .starred
                                                                .toString(),
                                                            User[index]
                                                                .is_story_reply
                                                                .toString(),
                                                          )
                                                    : Column(
                                                        children: [
                                                          User[index]
                                                                          .attachment_url !=
                                                                      "" &&
                                                                  User[index]
                                                                          .message !=
                                                                      "" &&
                                                                  User[index]
                                                                          .is_map !=
                                                                      "1"
                                                              ? PictureSendUserMessage(
                                                                  User[index]
                                                                      .sent_time
                                                                      .toString(),
                                                                  User[index]
                                                                      .message
                                                                      .toString(),
                                                                  Url +
                                                                      User[index]
                                                                          .attachment_url
                                                                          .toString(),
                                                                )
                                                              : Container(),
                                                        ],
                                                      ),
                                                User[index].attachment_type ==
                                                            "image/png" ||
                                                        User[index]
                                                                .attachment_type ==
                                                            "image/jpeg" ||
                                                        User[index]
                                                                .attachment_type ==
                                                            "application/octet-stream"
                                                    ? Column(
                                                        children: [
                                                          User[index]
                                                                  .attachment_url
                                                                  .toString()
                                                                  .contains(
                                                                      ".pdf")
                                                              ? UserSendDocument(
                                                                  User[index]
                                                                      .attachment_url
                                                                      .toString(),
                                                                  User[index]
                                                                      .sent_time
                                                                      .toString(),
                                                                )
                                                              : PictureSendUser(
                                                                  User[index]
                                                                      .sent_time
                                                                      .toString(),
                                                                  Url +
                                                                      User[index]
                                                                          .attachment_url
                                                                          .toString(),
                                                                ),
                                                        ],
                                                      )
                                                    : Container(),
                                                User[index].attachment_type ==
                                                        "audio/mp4"
                                                    ? AudioPlay(
                                                        time: User[index]
                                                            .sent_time
                                                            .toString(),
                                                        pathh: Url +
                                                            User[index]
                                                                .attachment_url
                                                                .toString(),
                                                      )
                                                    : Container(),
                                                User[index].is_map == "1"
                                                    ? LocationSendUser(
                                                        User[index]
                                                            .sent_time
                                                            .toString(),
                                                        User[index].lat!,
                                                        User[index].lng!,
                                                        addres,
                                                        showLocation)
                                                    : Container(),
                                              ],
                                            )

                                          // User[index].attachment_url.toString().contains(".pdf")?
                                          // UserSendDocument(
                                          // User[index].attachment_url.toString(),
                                          // User[index].sent_time.toString(),

                                          : Column(
                                              children: [
                                                User[index].attachment_url ==
                                                            "" &&
                                                        User[index].is_map !=
                                                            "1"
                                                    ? UserGetMessage(
                                                        User[index]
                                                            .message
                                                            .toString(),
                                                        User[index]
                                                            .sent_time
                                                            .toString(),
                                                      )
                                                    : Column(
                                                        children: [
                                                          User[index]
                                                                          .attachment_url !=
                                                                      "" &&
                                                                  User[index]
                                                                          .message !=
                                                                      "" &&
                                                                  User[index]
                                                                          .is_map !=
                                                                      "1"
                                                              ? PictureSendUserMessage(
                                                                  User[index]
                                                                      .sent_time
                                                                      .toString(),
                                                                  User[index]
                                                                      .message
                                                                      .toString(),
                                                                  Url +
                                                                      User[index]
                                                                          .attachment_url
                                                                          .toString(),
                                                                )
                                                              : Container(),
                                                        ],
                                                      ),
                                                User[index].attachment_type ==
                                                            "image/png" ||
                                                        User[index]
                                                                .attachment_type ==
                                                            "application/octet-stream"
                                                    ? Column(
                                                        children: [
                                                          User[index]
                                                                  .attachment_url
                                                                  .toString()
                                                                  .contains(
                                                                      ".pdf")
                                                              ? UserSendDocument(
                                                                  User[index]
                                                                      .attachment_url
                                                                      .toString(),
                                                                  User[index]
                                                                      .sent_time
                                                                      .toString(),
                                                                )
                                                              : PictureSendUser(
                                                                  User[index]
                                                                      .sent_time
                                                                      .toString(),
                                                                  Url +
                                                                      User[index]
                                                                          .attachment_url
                                                                          .toString(),
                                                                ),
                                                        ],
                                                      )
                                                    : Container(),
                                                User[index].attachment_type ==
                                                        "audio/mp4"
                                                    ? AudioPlay(
                                                        time: User[index]
                                                            .sent_time
                                                            .toString(),
                                                        pathh: Url +
                                                            User[index]
                                                                .attachment_url
                                                                .toString(),
                                                      )
                                                    : Container(),
                                                User[index].is_map == "1"
                                                    ? LocationGetUser(
                                                        User[index]
                                                            .sent_time
                                                            .toString(),
                                                        User[index].lat!,
                                                        User[index].lng!,
                                                        addres,
                                                        showLocation)
                                                    : Container(),
                                              ],
                                            )
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.end,
                                      //   children: [
                                      //     Container(
                                      //       alignment: Alignment.topRight,
                                      //       margin: const EdgeInsets.symmetric(vertical: 5),
                                      //       width: 220,
                                      //       decoration: BoxDecoration(
                                      //         border: Border.all(color: const Color(0xffDBDEE5)),
                                      //         borderRadius: BorderRadius.circular(10),
                                      //         // color: const Color(0xFFEBEFFB)
                                      //       ),
                                      //       // decoration: BoxDecoration(
                                      //       //   color: const Color(0xffFF9200),
                                      //       //   borderRadius: BorderRadius.circular(12),
                                      //       // ),
                                      //       child: Column(
                                      //         children: [
                                      //           const SizedBox(
                                      //             height: 15,
                                      //           ),
                                      //           User[index].attachment_url == ""
                                      //               ? Center(
                                      //               child: Row(
                                      //                 children: [
                                      //                   const SizedBox(
                                      //                     width: 10,
                                      //                   ),
                                      //                   Expanded(
                                      //                     child: User[index].message != ""
                                      //                         ? Text(
                                      //                       User[index].message.toString(),
                                      //                       style: const TextStyle(
                                      //                         color: Color(0xff212121),
                                      //                       ),
                                      //                     )
                                      //                         :
                                      //                     Image.network(
                                      //                       Url + User[index].attachment_url.toString(),
                                      //                     ),
                                      //                   ),
                                      //                   Text(
                                      //                     DateFormat('hh:mm a').format(
                                      //                         DateTime.fromMillisecondsSinceEpoch(int.parse(
                                      //                           User[index].sent_time.toString(),
                                      //                         ) *
                                      //                             1000)),
                                      //                     style: const TextStyle(
                                      //                       color: Colors.grey,
                                      //                       fontSize: 12.0,
                                      //                       fontWeight: FontWeight.bold,
                                      //                     ),
                                      //                   ),
                                      //                   const SizedBox(
                                      //                     width: 10,
                                      //                   ),
                                      //                 ],
                                      //               ))
                                      //               : Center(
                                      //               child: Row(
                                      //                 children: [
                                      //                   const SizedBox(
                                      //                     width: 10,
                                      //                   ),
                                      //                   Expanded(
                                      //                     child: Column(
                                      //                       children: [
                                      //                         Image.network(
                                      //                             Url + User[index].attachment_url.toString()),
                                      //                         const SizedBox(
                                      //                           height: 10,
                                      //                         ),
                                      //                         Text(
                                      //                           User[index].message.toString(),
                                      //                           style: const TextStyle(
                                      //                             color: white,
                                      //                           ),
                                      //                         ),
                                      //                         Row(
                                      //                           mainAxisAlignment: MainAxisAlignment.end,
                                      //                           children: [
                                      //                             Text(
                                      //                               DateFormat('hh:mm a').format(DateTime
                                      //                                   .fromMillisecondsSinceEpoch(int.parse(
                                      //                                 User[index].sent_time.toString(),
                                      //                               ) *
                                      //                                   1000)),
                                      //                               style: const TextStyle(
                                      //                                 color: white,
                                      //                                 fontSize: 12.0,
                                      //                                 fontWeight: FontWeight.bold,
                                      //                               ),
                                      //                             ),
                                      //                           ],
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //                   const SizedBox(
                                      //                     width: 10,
                                      //                   ),
                                      //                 ],
                                      //               )),
                                      //           const SizedBox(
                                      //             height: 15,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
              },
            ),
            //  Expanded(child: SizedBox(height: 5,)),
            Visibility(
              visible: _isForwardMessage,
              child: Container(
                padding: spacing(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: borderRadius(7),
                  color: white,
                  boxShadow: lightShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isForwardMessage = false;
                          _byDefaultMessage = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.close),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: spacing(vertical: 7, horizontal: 7),
                      decoration: BoxDecoration(
                          color: grayLight, borderRadius: borderRadius(7)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            forwardMessageOwner.toString(),
                            style: TextStyle(
                              color: orange,
                              fontSize: 12,
                            ),
                          ),
                          gap(h: 5),
                          Text(
                            forwardMessage.toString(),
                            style: TextStyle(
                              color: grayMed,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    gap(h: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _AddModalBottomSheet(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: greyColor,
                              ),
                              child: Icon(
                                Icons.add,
                                color: white,
                                size: screenWidthSize(28, context),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: screenWidthSize(230, context),
                          child: TextField(
                            controller: message,
                            decoration: InputDecoration(
                              hintText: 'Type a message here',
                              hintStyle: TextStyle(
                                  color: fontColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            sendMessage();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: orangeColor,
                              ),
                              child: SvgPicture.asset(
                                'assets/chatfill.svg',
                                color: white,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _byDefaultMessage,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: screenHeightSize(70, context),
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-4, 0),
                        spreadRadius: 2,
                        blurRadius: 2,
                        color: Color.fromRGBO(125, 140, 172, 0.47)),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 0),
                        decoration: BoxDecoration(
                          color: HexColor('#F8F9FB'),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _AddModalBottomSheet(context);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: greyColor,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: white,
                                    size: screenWidthSize(28, context),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: screenWidthSize(200, context),
                              child: TextField(
                                controller: message,
                                decoration: InputDecoration(
                                  hintText: 'Type a message here',
                                  hintStyle: TextStyle(
                                      color: fontColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        sendMessage();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: orangeColor,
                          ),
                          child: SvgPicture.asset(
                            'assets/chatfill.svg',
                            color: white,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }

    setState(() {
      // _customProgress(context);
      if (selectedImages!.isNotEmpty) {
        uploadMessageFile();
      }
    });
  }

  void _AddModalBottomSheet(context) {
    showModalBottomSheet(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height / 2),
        context: context,
        backgroundColor: white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(17), topLeft: Radius.circular(17)),
        ),
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setState) => Container(
              height: MediaQuery.of(context).size.height - 360,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: names.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () async {
                            if (index == 4) {
                              await showPlacePicker();
                              Navigator.pop(context);
                            }
                            if (index == 0) {
                              await selectFile();
                              Navigator.pop(context);
                            }
                            if (index == 2) {
                              selectImages();
                              Navigator.pop(context);
                            }
                            if (index == 7) {
                              showSticker(context, 7);
                              //  Navigator.pop(context);
                            }
                            if (index == 6) {
                              showSticker(context, 6);
                              //  Navigator.pop(context);
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                  height: 60,
                                  width: 120,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: colorContainer[index],
                                    shape: BoxShape.circle,
                                    // borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Image.asset(
                                    'assets/images/${iconImage[index]}',
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(names[index]),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  _customProgress(context) async {
    ProgressDialog pd = ProgressDialog(context: context);

    /// show the state of preparation first.
    pd.show(
        max: 100,
        msg: isUploadFile ? 'Preparing Uploading...' : " state changed",
        progressType: ProgressType.valuable,
        backgroundColor: const Color(0xff212121),
        progressValueColor: const Color(0xff3550B4),
        progressBgColor: white,
        msgColor: white,
        valueColor: white);

    /// Added to test late loading starts
    await Future.delayed(const Duration(milliseconds: 3000));
    for (int i = 0; i <= 100; i++) {
      /// You can indicate here that the download has started.
      pd.update(value: i, msg: 'Files uploading...');
      i++;
      await Future.delayed(const Duration(milliseconds: 100));
    }
    sendMessage();
  }

  uploadMessageFile() async {
    setState(() {
      isUploadFile = true;
    });
    _customProgress(context);
    var headers = {
      'Cookie':
          'PHPSESSID=889a1b67168f738c3c7e93ce07601f99; _us=1674205168; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-01-19%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields
        .addAll({'type': 'messages', 'sub_type': 'only_upload_files'});
    // for (int i = 0; i < imageFileList!.length; i++) {
    //   request.files.add(
    //       await http.MultipartFile.fromPath('attachment[]', imageFileList![i].path));
    // }
    // request.files.add(
    //     await http.MultipartFile.fromPath('attachment[]', '/path/to/file')
    // );
    //docPath
    if (docPath != null) {
      request.files
          .add(await http.MultipartFile.fromPath('attachment[]', docPath!));
    }
    // for (int i = 0; i < imageFileList!.length; i++) {
    //   request.files.add(
    //       await http.MultipartFile.fromPath('attachment[]',  imageFileList![i].path));
    // }
    if (docPath == null) {
      for (int i = 0; i < imageFileList!.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
            'attachment[]', imageFileList![i].path));
      }
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      comaSepread = body['comma_seperated_string'];
      setState(() {
        comaSepread;
      });

      setState(() {
        isUploadFile = false;
      });

      //  coomas= comaSepread;
      // coomas.toString().split(',');
      // newComaSpreated = coomas;
      // newComaSpreated.toString().replaceFirst('application/octet-stream', 'image/png');
    } else {
      setState(() {
        isUploadFile = false;
      });
    }
  }

  Set<Marker> getmarkers() {
    //setState(() {
    markers.add(Marker(
      //add first marker
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: addres.toString(),
        snippet: addres.toString(),
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    //  });
    //setState(() {});

    return markers;
  }

  //
  reportUserBottomsheet(context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(17), topLeft: Radius.circular(17)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 620,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Report",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Why are you reporting this person?",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: report.length,
                  itemBuilder: (context, curentIndx) {
                    return GestureDetector(
                      onTap: () {
                        msgForReport = report[curentIndx];
                        reportUser();
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(report[curentIndx]),
                                ),
                                const Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  succedRepotBottomsheet(context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(17), topLeft: Radius.circular(17)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text("Thanks for letting us know"),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your feedback is important in helping us keep the community safe.",
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffFF9200),
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: white,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffFF9200)),
                  child: Center(
                    child: Text(
                      'Okay',
                      style: TextStyle(color: white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  unfollowUserBottomsheet(context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(17), topLeft: Radius.circular(17)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              followUnfollowUser.toString() == "unfollowed"
                  ? Text("Follow")
                  : Text("Unfollow"),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Are you sure you want to ${followUnfollowUser.toString()} ${widget.list[widget.currentIndex].rec_name.toString()}?",
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/unfollowuser.png"),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey)),
                        child: const Center(child: Text('Cancle')),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        followUnfollow();
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xffFD4585)),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(color: white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  blockUserBottomsheet(context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(17), topLeft: Radius.circular(17)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text("Block Person"),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Are you sure you want to block ${widget.list[widget.currentIndex].rec_name.toString()}?",
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/block.png"),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey)),
                        child: const Center(child: Text('Cancle')),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        blockUser();
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xffFD4585)),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(color: white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  forwardBottomsheet(context) async {
    showModalBottomSheet(
        // constraints: BoxConstraints(
        //      minHeight: MediaQuery.of(context).size.height / 2),
        context: context,
        backgroundColor: white,
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
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Friends",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //  Text("Are you sure you want to delete the chat with ${widget.list[widget.currentIndex].rec_name.toString()}?", style: const TextStyle(fontSize: 14),
                      //  textAlign: TextAlign.center,
                      ListView.builder(
                          itemCount: friendsShow.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          friendsShow[index]['avatar']),
                                    ),
                                    title: Text(friendsShow[index]['username']),
                                    trailing: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isForward = true;
                                          });
                                          reviveriD =
                                              friendsShow[index]['user_id'];
                                          forwardMessages(reviveriD.toString());
                                        },
                                        child: friendsShow[index]['user_id'] ==
                                                reviveriD.toString()
                                            ? Container(
                                                height: 40,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffFF9200)),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  // color: const Color(0xFFEBEFFB)
                                                ),
                                                child: isForward
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                    : Center(
                                                        child: Text(
                                                          "Send",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffFF9200)),
                                                        ),
                                                      ))
                                            : Container(
                                                height: 40,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffFF9200)),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  // color: const Color(0xFFEBEFFB)
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Send",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFF9200)),
                                                  ),
                                                )))),
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

  deleteChatBottomsheet(context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(17), topLeft: Radius.circular(17)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Delete this chat?"),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Are you sure you want to delete the chat with ${widget.list[widget.currentIndex].rec_name.toString()}?",
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/trash.png"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            //  Navigator.pop(context);
                          },
                          child: Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Colors.grey)),
                            child: const Center(child: Text('Cancle')),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      isLoadDelete
                          ? Center(child: CircularProgressIndicator())
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLoadDelete = !isLoadDelete;
                                });
                              },
                              child: Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    deleteUserChat();
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: const Color(0xffFD4585)),
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(color: white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  showSticker(context, int index) {
    showModalBottomSheet(
        backgroundColor: white,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (ctx) {
          return Container(
              //color: Colors.grey[600],
              padding: EdgeInsets.all(15),
              child: FractionallySizedBox(
                heightFactor: 0.88,
                child: Column(
                  children: [
                    //Icon and Read by
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            // initState();
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF1F1F1)),
                            child: Icon(Icons.keyboard_arrow_down_sharp),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        index == 7
                            ? Text(
                                "Sticker",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )
                            : Text(
                                "Gif",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: stikerKeyWork,
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(
                            color: Colors.redAccent, fontSize: 15),
                        filled: true,
                        fillColor: Colors.grey[300],
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter gif';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future: getSticker(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else {
                            return GridView.builder(
                                itemCount: stickerData.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                //gifData.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  // crossAxisSpacing: 4.0,
                                  // mainAxisSpacing: 4.0
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80.0,
                                          child: Image.network(
                                            stickerData[index],
                                            width: 75,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      stickerUrl = stickerData[index];
                                      sendMessage();
                                      // Future.delayed(const Duration(seconds: 3), () {
                                      //  Navigator.pop(context);
                                      // });
                                      //Navigator.pop(context);
                                      //    initState();
                                      setState(() {});
                                    },
                                  );
                                });
                          }
                        }),

                    SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ));
        });
  }

  var stickerData = [];
  var stickerUrl = '';
  TextEditingController stikerKeyWork = TextEditingController();
  getSticker() async {
    var headers = {
      'Cookie':
          'PHPSESSID=a97d64197f4baa9af5db29b603e75926; _us=1679908978; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-03-26%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'search_gifs_stickers',
      'sub_type': 'get_stickers',
      'keyword': stikerKeyWork.text,
      '': ''
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      stickerData = body['data'];
      setState(() {});
    } else {}
  }
}
