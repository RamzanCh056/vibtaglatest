import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vab_tag/chat_screens/screen/profile_screen.dart';

import '../../res/static_info.dart';
import '../../screens/chat/audio_player.dart';
import '../../screens/chat/model/show_list_message_model.dart';
import '../constants.dart';
import '../widgets/reusable_listtile.dart';

class PrivateMessageScreen extends StatefulWidget {
  PrivateMessageScreen(this.list, this.currentIndex, {key});

  List<MessageList> list;
  int currentIndex;

  @override
  State<PrivateMessageScreen> createState() => _PrivateMessageScreenState();
}

class _PrivateMessageScreenState extends State<PrivateMessageScreen> {
  List<MessageList> User = [];
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
    Color(0xff4C9CF6),
    Color(0xff00D9C7),
    Color(0xffFF635B),
    Color(0xff7169ED),
    Color(0xffFF834E),
    Color(0xffF5BF00),
    Color(0xff7CFF67),
    Color(0xffFB7DFE),
    Color(0xff59CDFF),
  ];
  late GoogleMapController _googleMapController;
  final Set<Marker> markers = Set();
  var showLocation;
  String? addres;
  String? pickedAddres;

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
    super.initState();
  }

  @override
  void dispose() {
    // _pageManager.dispose();
    super.dispose();
  }

  bool isLoading = true;

  getMessageList() {
    getMessage();
  }

  bool pause = false;
  AudioPlayer audioPlayer = AudioPlayer();

  sendMessage() async {
    var headers = {
      'Cookie':
          'PHPSESSID=90e40ddd3b2b744419153f3f747c2560; _us=1673018056; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-01-05%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'messages',
      'sub_type': 'send_message',
      'sender_id': StaticInfo.userIdLogin.toString(),
      'rec_id': StaticInfo.userIdLogin != widget.list[widget.currentIndex].rec_id
          ? widget.list[widget.currentIndex].rec_id.toString()
          : widget.list[widget.currentIndex].sen_id.toString(),
      'page_id': '',
      'group_id': '',
      'user_or_group': 'user',
      'chatSticker': '',
      'is_reply': '',
      'is_multi_reply': '',
      'msg': message.text,
      'search_location': pickedAddres.toString(),
      'lat': latitude.toString(),
      'lng': longitude.toString(),
      'files_array': ''
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());

      message.text = "";
    } else {
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
      'user_id': StaticInfo.userIdLogin.toString(),
      'msg_userid': StaticInfo.userIdLogin != widget.list[widget.currentIndex].rec_id
          ? widget.list[widget.currentIndex].rec_id.toString()
          : widget.list[widget.currentIndex].sen_id.toString(),
      'user_or_group': 'user',
      'msg_pageid': '',
      'page_random': ''
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      List tempList = body['messages'];
      final todo = tempList?.map((dynamic item) => MessageList.fromJson(item)).toList() ?? [];
      todo;
      User = todo;
      setState(() {
        isLoading = false;
      });
      print("user message == $User");
      setState(() {
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, screenHeightSize(80, context)),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            //backgroundColor: highShadeOrangeColor,
            flexibleSpace: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [Color(0xFFC107), Colors.yellow]),
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
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  StaticInfo.userIdLogin != widget.list[widget.currentIndex].rec_id
                                      ? widget.list[widget.currentIndex].rec_pic.toString()
                                      : widget.list[widget.currentIndex].sen_pic.toString(),
                                  height: 45,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              // backgroundColor: Colors.white10,
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
                              StaticInfo.userIdLogin != widget.list[widget.currentIndex].rec_id
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
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    color: orangeColor.withOpacity(0.03),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1, color: Colors.white)),
                                child: SvgPicture.asset(
                                  'assets/images/Video-2.svg',
                                )),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: orangeColor.withOpacity(0.03),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 1, color: Colors.white)),
                                child: SvgPicture.asset(
                                  'assets/images/Fill 6-8.svg',
                                )),
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
                                    "Mute Notification",
                                    "Delete Chat",
                                    "Block",
                                    "Report",
                                  ];
                                  return items
                                      .map((e) => PopupMenuItem(
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
            Container(
              child: StreamBuilder(
                stream: getMessageList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error Occured"));
                  }
                  return isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: User.length,
                              itemBuilder: (context, index) {
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
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(),
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
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      children: [
                                        StaticInfo.userIdLogin != User[index].rec_id
                                            ? Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                elevation: 3,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(vertical: 5),
                                                  width: 280,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xEBEFFB),
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      User[index].attachment_url == "" && User[index].is_map != "1"
                                                          ? Center(
                                                              child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: User[index].message != ""
                                                                      ? Text(User[index].message.toString())
                                                                      : Image.network(
                                                                          Url + User[index].attachment_url.toString(),
                                                                        ),
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
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                              ],
                                                            ))
                                                          : Center(
                                                              child: Row(
                                                              children: [
                                                                SizedBox(
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
                                                                            SizedBox(
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
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                              ],
                                                            )),
                                                      User[index].attachment_type == "audio/mp4"
                                                          ? AudioPlay(
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
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                margin: EdgeInsets.symmetric(vertical: 5),
                                                width: 220,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffFF9200),
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    User[index].attachment_url == ""
                                                        ? Center(
                                                            child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                child: User[index].message != ""
                                                                    ? Text(
                                                                        User[index].message.toString(),
                                                                        style: TextStyle(
                                                                          color: Colors.white,
                                                                        ),
                                                                      )
                                                                    : Image.network(
                                                                        Url + User[index].attachment_url.toString(),
                                                                      ),
                                                              ),
                                                              Text(
                                                                DateFormat('hh:mm a').format(
                                                                    DateTime.fromMillisecondsSinceEpoch(int.parse(
                                                                          User[index].sent_time.toString(),
                                                                        ) *
                                                                        1000)),
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 12.0,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          ))
                                                        : Center(
                                                            child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  children: [
                                                                    Image.network(
                                                                        Url + User[index].attachment_url.toString()),
                                                                    SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    Text(
                                                                      User[index].message.toString(),
                                                                      style: TextStyle(
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
                                                                          style: TextStyle(
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
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          )),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                },
              ),
            ),
            Container(
              height: 60,
              color: Color(0xffF5F5F5),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _AddModalBottomSheet(context);
                      },
                      icon: Icon(
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
                          decoration: InputDecoration(
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
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xffFF9200),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              sendMessage();
                              // Future.delayed(const Duration(seconds: 2), () {
                              //   message.text = "";
                              // });
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      size: 35,
                      color: Color(0xff9E9E9E),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void _AddModalBottomSheet(context) {
    showModalBottomSheet(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height / 2),
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(17), topLeft: Radius.circular(17)),
        ),
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setState) => Container(
              height: MediaQuery.of(context).size.height - 360,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
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
                          onTap: () {
                            if (index == 4) {
                              showPlacePicker();
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
}
