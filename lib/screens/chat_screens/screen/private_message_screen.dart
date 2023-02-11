import 'dart:convert';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:vibetag/screens/chat_screens/screen/profile_screen.dart';
import 'package:vibetag/screens/chat_screens/screen/view_media.dart';
import 'package:vibetag/utils/constant.dart';
import '../constants.dart';
import '../model/show_list_message_model.dart';
import '../model/upload_file.dart';
import '../video_call/dialing_call.dart';
import '../video_call/video_call.dart';
import '../widgets/reusable_listtile.dart';
import 'audio_player.dart';

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
              addressLatLng = LatLng(result.geometry!.location.lat, result.geometry!.location.lng);
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

    // _pageManager = PageManager();
    print(loginUserId);
    print("${widget.list[widget.currentIndex].rec_id}");
    print(longitude);
    print('message text == ${message.text}');
    super.initState();
  }

  @override
  void dispose() {
    // _pageManager.dispose();
    super.dispose();
  }

  bool isLoad = true;

  getMessageList() {
    getMessage();
  }

  bool pause = false;
  AudioPlayer audioPlayer = AudioPlayer();

  sendMessage() async {
    setState(() {
      isLoadMessage = true;
    });
    var headers = {
      'Cookie':
      'PHPSESSID=90e40ddd3b2b744419153f3f747c2560; _us=1673018056; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-01-05%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
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
      'chatSticker': '',
      'is_reply': '',
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
      print(await response.stream.bytesToString());

      message.text = "";

      setState(() {
        isLoadMessage = false;
      });
      Future.delayed(const Duration(seconds: 4), () {
        imageFileList = [];
        comaSepread = '';
      });
    } else {
      setState(() {
        isLoadMessage = false;
      });
      print(response.reasonPhrase);
    }
  }

  getMessage() async {
    var headers = {
      'Cookie':
      '_us=1672569576; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-31%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
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
      final todo = tempList?.map((dynamic item) => MessageList.fromJson(item)).toList() ?? [];
      todo;
      User = todo;

      print("user messages == $User");
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, screenHeightSize(70, context)),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            //backgroundColor: highShadeOrangeColor,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFC107), Colors.yellow]),
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
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                loginUserId != widget.list[widget.currentIndex].rec_id
                                    ? widget.list[widget.currentIndex].rec_pic.toString()
                                    : widget.list[widget.currentIndex].sen_pic.toString(),
                                height: 45,
                                fit: BoxFit.fill,
                              ),
                            ),
                            widget.list[widget.currentIndex].online_status == "online"
                                ? Positioned(
                              top: -1,
                              right: 3,
                              child: Container(
                                width: screenWidthSize(11, context),
                                height: screenHeightSize(11, context),
                                decoration: BoxDecoration(
                                    color: widget.list[widget.currentIndex].online_status == "online"
                                        ? lightGreenColor
                                        : Colors.grey,
                                    border: Border.all(width: 1, color: Colors.white),
                                    shape: BoxShape.circle),
                              ),
                            )
                                : Positioned(
                              top: -1,
                              right: 3,
                              child: Container(
                                width: screenWidthSize(11, context),
                                height: screenHeightSize(11, context),
                                decoration: BoxDecoration(
                                    color: widget.list[widget.currentIndex].online_status == "offline"
                                        ? Colors.grey
                                        : Colors.transparent,
                                    border: Border.all(width: 1, color: Colors.white),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ],

                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loginUserId != widget.list[widget.currentIndex].rec_id
                                  ? widget.list[widget.currentIndex].rec_name.toString()
                                  : widget.list[widget.currentIndex].sen_name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: screenWidthSize(15, context)),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Last Seen: ${widget.list[widget.currentIndex].last_online.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: screenWidthSize(12, context)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoCall()));
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      color: orangeColor.withOpacity(0.03),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(width: 1, color: Colors.white)),
                                  child: SvgPicture.asset(
                                    'assets/images/Video-2.svg',
                                  )),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const DailingCall()));
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: orangeColor.withOpacity(0.03),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(width: 1, color: Colors.white)),
                                  child: SvgPicture.asset(
                                    'assets/images/Fill 6-8.svg',
                                  )),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            // SvgPicture.asset('assets/images/Group 76594.svg'),
                            PopupMenuButton(
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                                onSelected: (value) {
                                  if (value == "View Profile") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return const ProfileScreen();
                                        },
                                      ),
                                    );
                                  }
                                  else if (value == "View Media") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return const ViewMedia();
                                        },
                                      ),
                                    );



                                  }
                                  else if (value == "Delete Chat") {
                                    deleteChatBottomsheet(context);


                                  }
                                  else if (value == "Block") {
                                 blockUserBottomsheet(context);


                                  }
                                  else if (value == "Unfollow") {
                                    unfollowUserBottomsheet(context);


                                  }
                                  else if (value == "Report") {
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
                                    "Unfollow",
                                    "Delete Chat",
                                    "Block",
                                    "Report",
                                  ];
                                  return items
                                      .map((e) =>
                                      PopupMenuItem(
                                        value: e.toString(),
                                        child: Text(
                                          e.toString(),
                                          style: const TextStyle(fontWeight: FontWeight.w500),
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
                return

                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                    child: ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: User.length,
                        itemBuilder: (context, index) {
                          checker = DateFormat('hh:mm a').format(DateTime.now());
                          print("cheker == $checker");
                          checker == DateFormat('hh:mm a').format(
                              DateTime.fromMillisecondsSinceEpoch(int.parse(
                                User[index].sent_time.toString(),
                              ) *
                                  1000)) && loginUserId == User[index].rec_id ?

                          AwesomeNotifications().createNotification(

                              content: NotificationContent(
                                //   autoDismissible: true,
                                  id: 123,
                                  channelKey: 'basic',
                                  //set configuration wuth key "basic"
                                  title: loginUserId != widget.list[widget.currentIndex].rec_id
                                      ? widget.list[widget.currentIndex].rec_name.toString()
                                      : widget.list[widget.currentIndex].sen_name.toString(),
                                  body: User.last.message,
                                  payload: {"name": "FlutterCampus"}

                              )
                          ) : Container();
                          Future.delayed(

                              const Duration(seconds: 5), () {
                            print("call");
                            checker == "u";
                            print("checker==$checker");

                            // AwesomeNotifications().dismissAllNotifications();
                            //AwesomeNotifications().dismiss(123);
                          });


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
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(17), topLeft: Radius.circular(17)),
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 440,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      children: [
                                        ReusableListTile(
                                          image: "assets/images/Vector (3).png",
                                          title: "Reply",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ReusableListTile(
                                          image: "assets/images/Vector (4).png",
                                          title: "Forward",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ReusableListTile(
                                          image: "assets/images/Star-3.png",
                                          title: "Star message",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ReusableListTile(
                                          image: "assets/images/Union.png",
                                          title: "Copy",
                                          handler: () {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ReusableListTile(
                                          image: "assets/images/Group 77268.png",
                                          title: "Delete message",
                                          handler: () {},
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
                              padding: const EdgeInsets.only(right: 10.0, left: 10),
                              child: Column(

                                children: [
                                  loginUserId != User[index].rec_id
                                      ? Row(

                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        elevation: 3,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(vertical: 5),
                                          width: 280,
                                          decoration: BoxDecoration(
                                            color: const Color(0xEBEFFB),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              User[index].attachment_url == ""
                                                  ? Center(
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                          child:
                                                          // User[index].message != ""
                                                          //     ?
                                                          Text(User[index].message.toString())


                                                      ),
                                                      Text(
                                                        DateFormat('hh:mm a').format(
                                                            DateTime.fromMillisecondsSinceEpoch(int.parse(
                                                              User[index].sent_time.toString(),
                                                            ) *
                                                                1000)),
                                                        style: TextStyle(
                                                          color: Colors.grey.shade400,
                                                          fontSize: 12.0,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ))
                                                  : Center(
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      User[index].attachment_url != "" &&
                                                          User[index].message != "" &&
                                                          User[index].is_map != "1"
                                                          ? Expanded(
                                                        child: Column(
                                                          children: [
                                                            Image.network(Url +
                                                                User[index].attachment_url.toString()),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(User[index].message.toString()
                                                              // style: TextStyle(color: Colors.grey),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: [
                                                                Text(
                                                                  DateFormat('hh:mm a').format(DateTime
                                                                      .fromMillisecondsSinceEpoch(
                                                                      int.parse(
                                                                        User[index]
                                                                            .sent_time
                                                                            .toString(),
                                                                      ) *
                                                                          1000)),
                                                                  style: TextStyle(
                                                                    color: Colors.grey.shade400,
                                                                    fontSize: 12.0,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                          : Container(),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  )),
                                              User[index].attachment_type == "audio/mp4" ?
                                              AudioPlay(
                                                time: User[index].sent_time.toString(),
                                                pathh: Url + User[index].attachment_url.toString(),
                                              )
                                                  : Container(),
                                              User[index].is_map == "1"
                                                  ? Container(
                                                height: 300.0,
                                                width: double.infinity,
                                                alignment: Alignment.center,
                                                child: GoogleMap(
                                                  zoomGesturesEnabled: false,
                                                  initialCameraPosition: CameraPosition(
                                                    target: LatLng(
                                                        double.parse(
                                                          User[index].lat!,
                                                        ),
                                                        double.parse(
                                                          User[index].lng!,
                                                        )),
                                                    //showLocation,

                                                    zoom: 15.151926040649414, //initial zoom level
                                                  ),
                                                  markers: getmarkers(), //Icon for Marker

                                                  onMapCreated: (controller) =>
                                                  _googleMapController = controller,
                                                ),
                                              )
                                                  : Container(),
                                              const SizedBox(height: 10,),
                                              User[index].attachment_type == "image/png" ||
                                                  User[index].attachment_type == "application/octet-st" ?
                                              Image.network(
                                                Url + User[index].attachment_url.toString(),
                                              ) : Container(),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                      :


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.topRight,
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFF9200),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            User[index].attachment_url == ""
                                                ? Center(
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: User[index].message != ""
                                                          ? Text(
                                                        User[index].message.toString(),
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                          :
                                                      Image.network(
                                                        Url + User[index].attachment_url.toString(),
                                                      ),
                                                    ),
                                                    Text(
                                                      DateFormat('hh:mm a').format(
                                                          DateTime.fromMillisecondsSinceEpoch(int.parse(
                                                            User[index].sent_time.toString(),
                                                          ) *
                                                              1000)),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                ))
                                                : Center(
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Image.network(
                                                              Url + User[index].attachment_url.toString()),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            User[index].message.toString(),
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                DateFormat('hh:mm a').format(DateTime
                                                                    .fromMillisecondsSinceEpoch(int.parse(
                                                                  User[index].sent_time.toString(),
                                                                ) *
                                                                    1000)),
                                                                style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 12.0,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                )),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          );
                        }),
                  );
              },
            ),
            // SizedBox(height: 70,),

            Container(
              height: 60,
              color: const Color(0xffF5F5F5),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _AddModalBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 25,
                        color: Color(0xffFFBB60),
                      )),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          controller: message,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.emoji_emotions),
                            hintText: 'Write message here...',
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //  isLoadMessage?const CircularProgressIndicator():
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF9200),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              sendMessage();
                              // Future.delayed(const Duration(seconds: 2), () {
                              //   message.text = "";
                              // });
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            )),

                      ],
                    ),
                  ),
                  const SizedBox(width: 10,)

                ],
              ),

            ),
          ],
        )
    );
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await
    imagePicker.pickMultiImage();

    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());


    setState(() {
      // _customProgress(context);
      if (selectedImages!.isNotEmpty) {
        uploadMessageFile();
      }
    });
  }

  void _AddModalBottomSheet(context) {
    showModalBottomSheet(
        constraints: BoxConstraints(minHeight: MediaQuery
            .of(context)
            .size
            .height / 2),
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(17), topLeft: Radius.circular(17)),
        ),
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setState) =>
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 360,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                if (index == 2) {
                                  selectImages();
                                  Navigator.pop(context);
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
        progressBgColor: Colors.white70,
        msgColor: Colors.white,
        valueColor: Colors.white);

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

  // pictureShow(context) async{
  //
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return StatefulBuilder(builder: (BuildContext
  //         context,
  //             void Function(void Function()) setState)  {
  //           return Dialog(
  //             backgroundColor: Colors.white,
  //             insetPadding: const EdgeInsets.all(12),
  //             shape: RoundedRectangleBorder(
  //               borderRadius:
  //               BorderRadius.circular(15.0),
  //             ),
  //             child: Container(
  //               padding: const EdgeInsets.symmetric(
  //                   horizontal: 14.0,
  //                   vertical: 10.0),
  //               width: double.infinity,
  //               child: Stack(
  //                 children: [
  //                   GridView.builder(
  //                       shrinkWrap: true,
  //                       itemCount: imageFileList!.length,
  //                       gridDelegate:
  //                       const SliverGridDelegateWithFixedCrossAxisCount(
  //                           crossAxisSpacing: 15,
  //                           mainAxisSpacing: 15,
  //                           crossAxisCount: 3),
  //                       itemBuilder: (BuildContext context, int index) => isUploadFile? CircularProgressIndicator():
  //                         Image.file(
  //                         File(imageFileList![index].path),
  //                         fit: BoxFit.cover,
  //                         )),
  //                   Positioned(
  //                     right: 10,
  //                     top: 5,
  //                     child: GestureDetector(
  //                       onTap: () {
  //                         setState(
  //                               () {
  //                                 for (int i = 0; i < imageFileList!.length; i++) {
  //                                   imageFileList![i].path == "";
  //                               }
  //                           },
  //                         );
  //                        // Navigator.pop(context);
  //                       },
  //                       child: Container(
  //
  //
  //                         padding: EdgeInsets.all(3),
  //                         height: 50,
  //                         width: 50,
  //                         decoration: BoxDecoration(
  //                           color: Colors.blue
  //                               .withOpacity(0.2),
  //                           shape: BoxShape.circle,
  //                         ),
  //                         child:  const Center(
  //                             child: Icon(Icons.close, color: Colors.white,)
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //
  //                 ],
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }
  uploadMessageFile() async {
    setState(() {
      isUploadFile = true;
    });
    _customProgress(context);
    var headers = {
      'Cookie': 'PHPSESSID=889a1b67168f738c3c7e93ce07601f99; _us=1674205168; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-01-19%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'only_upload_files'
    });
    // for (int i = 0; i < imageFileList!.length; i++) {
    //   request.files.add(
    //       await http.MultipartFile.fromPath('attachment[]', imageFileList![i].path));
    // }
    // request.files.add(
    //     await http.MultipartFile.fromPath('attachment[]', '/path/to/file')
    // );
    for (int i = 0; i < imageFileList!.length; i++) {
      request.files.add(
          await http.MultipartFile.fromPath('attachment[]', imageFileList![i].path));
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      comaSepread = body['comma_seperated_string'];
      setState(() {
        isUploadFile = false;
      });


      //  coomas= comaSepread;
      // coomas.toString().split(',');
      // newComaSpreated = coomas;
      // newComaSpreated.toString().replaceFirst('application/octet-stream', 'image/png');

      print("user message double  == ${comaSepread.toString()}");
    }
    else {
      print(response.reasonPhrase);
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
  reportUserBottomsheet(context) async{
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
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
              const SizedBox(height: 10,),
              const Text("Report", style: TextStyle(fontSize: 18),),
              const SizedBox(height: 10,),
              const Text("Why are you reporting this person?", style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,

              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: report.length,
                  itemBuilder: (context, curentIndx){
                return GestureDetector(
                  onTap: (){
                    succedRepotBottomsheet(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Row(children: [
                        Expanded(child: Text(report[curentIndx]),
                        ),

                        const Icon(Icons.arrow_forward_ios),

                      ],),
                      const Divider(color: Colors.grey,)

                    ],),
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


  succedRepotBottomsheet(context) async{
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
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
              const SizedBox(height: 10,),
              const Text("Thanks for letting us know"),
              const SizedBox(height: 10,),
              Text("Your feedback is important in helping us keep the community safe.", style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,

              ),
              const SizedBox(
                height: 15,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffFF9200),

                child: Center(child: Icon(Icons.done, color: Colors.white,size: 28,),),

              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffFF9200)
                  ),
                  child: const Center(child: Text('Okay', style: TextStyle(color: Colors.white),),),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
  unfollowUserBottomsheet(context) async{
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
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
              const SizedBox(height: 10,),
              const Text("Unfollow"),
              const SizedBox(height: 10,),
              Text("Are you sure you want to Unfollow ${widget.list[widget.currentIndex].rec_name.toString()}?", style: const TextStyle(fontSize: 14),
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
                  const SizedBox(width: 5,),
                  Expanded(

                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: const Center(child: Text('Cancle')),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffFD4585)
                      ),
                      child: const Center(child: Text('Yes', style: TextStyle(color: Colors.white),),),
                    ),
                  ),
                  const SizedBox(width: 5,),


                ],)

            ],
          ),
        );
      },
    );
  }
  blockUserBottomsheet(context) async{
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
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
              const SizedBox(height: 10,),
              const Text("Block Person"),
              const SizedBox(height: 10,),
               Text("Are you sure you want to block ${widget.list[widget.currentIndex].rec_name.toString()}?", style: const TextStyle(fontSize: 14),
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
                  const SizedBox(width: 5,),
                  Expanded(

                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: const Center(child: Text('Cancle')),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffFD4585)
                      ),
                      child: const Center(child: Text('Yes', style: TextStyle(color: Colors.white),),),
                    ),
                  ),
                  const SizedBox(width: 5,),


                ],)

            ],
          ),
        );
      },
    );
  }

  deleteChatBottomsheet(context) async{
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
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
              const SizedBox(height: 10,),
              const Text("Delete this chat?"),
              const SizedBox(height: 10,),
               Text("Are you sure you want to delete the chat with ${widget.list[widget.currentIndex].rec_name.toString()}?", style: const TextStyle(fontSize: 14),
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
                  const SizedBox(width: 5,),
                  Expanded(

                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: const Center(child: Text('Cancle')),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffFD4585)
                      ),
                      child: const Center(child: Text('Yes', style: TextStyle(color: Colors.white),),),
                    ),
                  ),
                  const SizedBox(width: 5,),


                ],)

            ],
          ),
        );
      },
    );
  }
}
