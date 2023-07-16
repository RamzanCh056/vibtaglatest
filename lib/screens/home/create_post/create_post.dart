import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/AddProductScreen/add_product_screen.dart';
import 'package:vibetag/screens/home/create_post/create_poll.dart';
import 'package:vibetag/screens/home/create_post/post_audience.dart';
import 'package:vibetag/screens/home/create_post/post_category.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';
import '../../../utils/constant.dart';
import 'dart:convert';
import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import '../../../model/colorspost_model.dart';
import '../../product_screen/create_product.dart';

class CreatePost extends StatefulWidget {
  CreatePost(this.userImage, this.userName, {super.key});
  var userImage;
  var userName;

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  List<Map<String, dynamic>> createPost = [
    {'name': 'Go Live', 'Icon': 'assets/icons/create_post/golive.png'},
    {'name': 'Image', 'Icon': 'assets/icons/create_post/image.png'},
    {'name': 'Video', 'Icon': 'assets/icons/create_post/video.png'},
    {'name': 'Location', 'Icon': 'assets/icons/create_post/location.png'},
    {'name': 'Feelings', 'Icon': 'assets/icons/create_post/feeling.png'},
    {'name': 'Sell', 'Icon': 'assets/icons/create_post/sell.png'},
    {'name': 'Tag', 'Icon': 'assets/icons/create_post/tag.png'},
    {'name': 'Recording', 'Icon': 'assets/icons/create_post/record.png'},
    {'name': 'Poll', 'Icon': 'assets/icons/create_post/poll.png'},
    {'name': 'Gif', 'Icon': 'assets/icons/create_post/gif.png'},
    {'name': 'File', 'Icon': 'assets/icons/create_post/file.png'},
    {'name': 'Audio', 'Icon': 'assets/icons/create_post/Audio.png'},
  ];
  DateTime? TimeDate;
  final postController = TextEditingController();
  double? longitude;
  double? latitude;
  final location = TextEditingController();
  final poll = TextEditingController();
  final pollAnswer = TextEditingController();
  List<ColorsPostModel> colorsPostId = [];
  int maxSelectedCards = 1;
  int currentSelectedCards = 0;
  var selectedColor;
  var selectedId;
  var selectedImage;
  var textColor;
  bool textFieldSize = false;
  File? _video;
  File? _cameraVideo;
  VideoPlayerController? _videoPlayerController;
  ChewieController? chewieController;
  VideoPlayerController? _cameraVideoPlayerController;
  LatLng addressLatLng = const LatLng(31.5204, 74.3587);
  late GoogleMapController _googleMapController;
  bool isLoad = false;
  File? imageFile;
  bool _isShow = false;
  bool _isShowColor = false;
  PlatformFile? file;
  String? docName;
  String? docPath;
  String? musicName;
  String? musicPath;
  String? videoName;
  String? videoPath;

  Future selectVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['video', 'mp4'],
    );
    if (result == null) return;
    file = result.files.first;
    //   final path = result.files.single.path!;
    print(file!.name);
    print(file!.path);

    setState(() {
      videoName = file!.name;
      videoPath = file!.path;
    });
  }

  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result == null) return;
    file = result.files.first;
    //   final path = result.files.single.path!;
    print(file!.name);
    print(file!.path);

    setState(() {
      docName = file!.name;
      docPath = file!.path;
    });
  }

  Future selectMusicFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );
    if (result == null) return;
    file = result.files.first;
    //   final path = result.files.single.path!;
    print(file!.name);
    print(file!.path);

    setState(() {
      musicName = file!.name;
      musicPath = file!.path;
    });
  }

  getColorsPost() async {
    var headers = {
      'Cookie':
          'PHPSESSID=19145fc28d16e9773332b3725c704109; _us=1675848113; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-02-07%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({'type': 'get_color_post_colors'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      List colorsPost = body;
      final todo = colorsPost
              ?.map((dynamic item) => ColorsPostModel.fromJson(item))
              .toList() ??
          [];
      todo;
      colorsPostId = todo;
      setState(() {});
      print("bodyy  == ${colorsPostId[0]}");
    } else {
      print(response.reasonPhrase);
    }
  }

  createUserPost() async {
    setState(() {
      isLoad = true;
      print("is load in api start== ${isLoad}");
    });
    var headers = {
      'Cookie':
          'PHPSESSID=f473f28ca40b056fd1a23e624a61bccc; _us=1667727587; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-11-05%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'new_post',
      'user_id': loginUserId.toString(),
      'post_category': '3',
      'postText': postController.text,
      'page_id': '',
      'event_id': '',
      'group_id': '',
      'postPrivacy': '',
      'postMap': location.text,
      'lat_': latitude.toString(),
      'lng_': longitude.toString(),
      'album_name': '',
      'feeling_type': '',
      'feeling': '',
      'postSticker': stickerUrl.toString() == '' ? '' : stickerUrl.toString(),
      'post_color': selectedId != null ? selectedId.toString() : "",
      'postRecord': '',
      'answer': pollAnswer.text ?? '',
    });
    if (imageFile != null) {
      // setState(() {
      //   isLoad = false;
      // });
      request.files
          .add(await http.MultipartFile.fromPath('postFile', imageFile!.path));
      print("image file woth path is ${imageFile!.path}");
    }
    if (_video != null) {
      request.files
          .add(await http.MultipartFile.fromPath('postVideo', _video!.path));
      print("video path is ${_video!.path}");
    }
    if (docPath != null && docPath != "") {
      request.files.add(
          await http.MultipartFile.fromPath('postFile', docPath.toString()));
      print("doc path is ${docPath}");
    }
    if (musicPath != null && musicPath != "") {
      request.files.add(
          await http.MultipartFile.fromPath('postMusic', musicPath.toString()));
    }
    if (videoPath != null && videoPath != "") {
      request.files.add(
          await http.MultipartFile.fromPath('postVideo', videoPath.toString()));
      print("video path is ${videoPath}");
    }
    //  request.files.add(await http.MultipartFile.fromPath('postFile', '/path/to/file'));
    //  request.files.add(await http.MultipartFile.fromPath('postVideo', '/path/to/file'));
    // request.files.add(await http.MultipartFile.fromPath('postMusic', '/path/to/file'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      //var msg = body['api_text'];
      Fluttertoast.showToast(msg: "successfully uploaded");
      setState(() {
        isLoad = false;
      });
      Navigator.pop(context);
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoad = false;
      });
    }
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
      //  print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      stickerData = body['data'];
      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  showSticker(
    context,
  ) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
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
                heightFactor: 0.9,
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
                        Text(
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
                                      print("gif Link is $stickerUrl");
                                      Future.delayed(const Duration(seconds: 3),
                                          () {
                                        Navigator.pop(context);
                                      });
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
              addressLatLng = LatLng(
                  result.geometry!.location.lat, result.geometry!.location.lng);
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

  getImageGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _pickVideo() async {
    XFile? pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
      });
    chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      aspectRatio: _videoPlayerController!.value.aspectRatio,
      autoPlay: false,
      looping: true,
      materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          bufferedColor: Colors.yellow,
          //  backgroundColor: Colors.green,
          handleColor: Colors.red),
    );
  }

  @override
  void initState() {
    getColorsPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.9,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          gap(h: 25),
          Container(
            width: width * 0.2,
            height: 5,
            decoration: BoxDecoration(
              color: grayMed,
              borderRadius: borderRadius(width),
            ),
          ),
          gap(h: 25),
          Container(
            margin: spacing(horizontal: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: width * 0.075,
                  foregroundImage: NetworkImage(widget.userImage),
                ),
                gap(w: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    gap(h: 2),
                    Text(
                      '@${widget.userName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: grayMed,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          gap(h: 15),
          Container(
              height: selectedImage != null ? 190 : 100,
              width: double.infinity,
              color: selectedColor != null
                  ? HexColor(selectedColor)
                  : Colors.transparent,
              child: Stack(
                children: [
                  selectedImage != null
                      ? Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(selectedImage),
                                  fit: BoxFit.cover)),
                        )
                      : Container(),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: postController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            color: lightblue,
                          ),
                          hintText: "🤙 What\'s your Vibe?",
                          //hintStyle: TextStyle(fontSize: 18.5),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          // Container(
          //   width: double.maxFinite,
          //   margin: spacing(horizontal: 15),
          //   child: TextFormField(
          //     controller:postController,
          //     decoration: InputDecoration(
          //       hintText: '🤙 What\'s your Vibe?',
          //       border: InputBorder.none,
          //     ),
          //     maxLines: 6,
          //   ),
          // ),
          location.text != ""
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFF9200),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      Expanded(
                          child: Text(
                        location.text,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      )),
                    ],
                  ))
              : Container(),
          docPath != "" && docPath != null
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFF9200),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.file_copy_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        docName.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      )),
                    ],
                  ))
              : Container(),
          videoPath != "" && videoPath != null
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFF9200),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.file_copy_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        videoName.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      )),
                    ],
                  ))
              : Container(),
          musicPath != "" && musicPath != null
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFF9200),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.file_copy_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        musicName.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      )),
                    ],
                  ))
              : Container(),
          stickerUrl != "" && stickerUrl != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffFF9200),
                      ),
                      height: 70,
                      child: Image.network(
                        stickerUrl.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                )
              : Container(),
          imageFile != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade100,
                      ),
                      child: Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                      )),
                )
              : Container(),
          Visibility(
            visible: _isShowColor,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: colorsPostId.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedId = colorsPostId[index].id;
                                selectedColor = colorsPostId[index].color_1;
                                selectedImage = colorsPostId[index].image;
                                textColor = colorsPostId[index].text_color;
                                print("id is ==${selectedId.toString()}");
                                print(
                                    "colror is ==${selectedColor.toString()}");
                                print("colror text ==${textColor.toString()}");
                              });
                            },
                            child: Container(
                                // margin: EdgeInsets.symmetric(vertical: 5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  color: colorsPostId[index].type == "color"
                                      ? HexColor(colorsPostId[index]
                                          .color_1
                                          .toString())
                                      : Colors.transparent,
                                ),
                                child: colorsPostId[index].type == "image"
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(70),
                                        child: Image.network(
                                          colorsPostId[index].image.toString(),
                                          fit: BoxFit.cover,
                                        ))
                                    : Container()),
                          ),
                          // Positioned.fill(child: Align(
                          //   alignment: Alignment.center,
                          //   child:Theme(
                          //     data:
                          //     Theme.of(context).copyWith(
                          //       unselectedWidgetColor:
                          //       Colors.transparent,
                          //       disabledColor:
                          //       Colors.transparent,
                          //     ),
                          //     child: Checkbox(
                          //       focusColor:
                          //       Colors.transparent,
                          //       checkColor: Colors.black,
                          //       activeColor:
                          //       Colors.transparent,
                          //       value:
                          //       colorsPostId[index].isSelected!,
                          //       onChanged: (value) {
                          //         if(currentSelectedCards <= maxSelectedCards ){
                          //           setState(() {
                          //             colorsPostId[index].isSelected =
                          //             !colorsPostId[index]
                          //                 .isSelected!;
                          //             if( colorsPostId[index].isSelected!){
                          //               setState(() {
                          //                 currentSelectedCards += 1;
                          //               });
                          //               print("curent slected card ${currentSelectedCards}");
                          //             }
                          //             else{
                          //               setState(() {
                          //                 currentSelectedCards -= 1;
                          //                 !colorsPostId[index]
                          //                     .isSelected!;
                          //
                          //               });
                          //               print("curent slected card ${currentSelectedCards}");
                          //             };
                          //
                          //
                          //
                          //             setState(() {});
                          //           });
                          //         }
                          //         if(currentSelectedCards ==2){
                          //           setState(() {
                          //             colorsPostId[index].isSelected =false;
                          //             currentSelectedCards -= 1;
                          //           });
                          //
                          //
                          //
                          //           Fluttertoast.showToast(msg: "You can select max 1 ");
                          //         }
                          //
                          //
                          //
                          //       },
                          //     ),
                          //   ),
                          //
                          //   // colorsPostId[index].isSelected == true?
                          //   // Icon(
                          //   //   Icons.gpp_good_rounded, color: Colors.black,
                          //   // )
                          //   //     :Container(),
                          // ))
                        ],
                      ),
                    );
                  }),
            ),
          ),
          gap(h: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    pop(context);
                    createBottomModalSheet(
                      context: context,
                      screen: PostAudience(),
                    );
                    // print("id == ${privacyId}");
                  },
                  child: Container(
                    padding: spacing(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: grayMed,
                      ),
                      borderRadius: borderRadius(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          child: Image.asset(
                            'assets/icons/lock.png',
                          ),
                        ),
                        gap(w: 5),
                        Text(
                          'Public',
                          style: TextStyle(
                            color: grayPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        gap(w: 10),
                        Container(
                          width: 15,
                          child: Image.asset(
                            'assets/new/icons/livestream/arrow_down.png',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                gap(w: 7),
                InkWell(
                  onTap: () {
                    pop(context);
                    createBottomModalSheet(
                      context: context,
                      screen: PostCategory(),
                    );
                  },
                  child: Container(
                    padding: spacing(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: grayMed,
                      ),
                      borderRadius: borderRadius(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                            color: grayPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        gap(w: 10),
                        Container(
                          width: 15,
                          child: Image.asset(
                            'assets/new/icons/livestream/arrow_down.png',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                gap(w: 7),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isShowColor = !_isShowColor;
                    });
                  },
                  child: Container(
                    padding: spacing(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: grayMed,
                      ),
                      borderRadius: borderRadius(10),
                    ),
                    child: Container(
                      width: 15,
                      child: Image.asset(
                        'assets/images/color_pick.png',
                      ),
                    ),
                  ),
                ),
                gap(w: 7),
                Container(
                  padding: spacing(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: grayMed,
                    ),
                    borderRadius: borderRadius(10),
                  ),
                  child: Container(
                    width: 15,
                    child: Image.asset(
                      'assets/new/icons/@.png',
                    ),
                  ),
                ),
                gap(w: 7),
                Container(
                  padding: spacing(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: grayMed,
                    ),
                    borderRadius: borderRadius(10),
                  ),
                  child: Container(
                    width: 15,
                    child: Image.asset(
                      'assets/images/emoji_face.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          gap(h: 15),
          Container(
            width: double.infinity,
            height: 10,
            color: grayLight,
          ),
          gap(h: 15),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: createPost.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () async {
                    if (i == 1) {
                      getImageGallery();
                    }
                    if (i == 3) {
                      await showPlacePicker();
                    }

                    if (i == 6) {
                      pop(context);
                      createBottomModalSheet(
                        context: context,
                        screen: CreatePoll(),
                      );
                    }
                    if (i == 8) {
                      await selectFile();
                      setState(() {});
                    }
                    if (i == 9) {
                      await selectMusicFile();
                      setState(() {});
                    }
                    if (i == 7) {
                      // pop(context);

                      showSticker(
                        context,
                      );
                      setState(() {});
                    }
                    if (i == 2) {
                      await selectVideo();
                      setState(() {});
                    }
                    if (i == 4) {
                      pushRoute(
                        context: context,
                        screen: AddProductScreen(),
                        // CreateProduct(),
                        //AddNewPag(),
                      );
                    }
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          padding: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: HexColor('#FFF2E1'),
                            borderRadius: borderRadius(width),
                          ),
                          child: Image.asset(
                            createPost[i]['Icon'],
                            scale: 0.5,
                          ),
                        ),
                        gap(h: 10),
                        Text(createPost[i]['name']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          gap(h: 15),
          isLoad
              ? Center(child: CircularProgressIndicator())
              : GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   isLoad = !isLoad;
                    // });
                    createUserPost();
                  },
                  child: Container(
                    padding: spacing(
                      horizontal: width * 0.05,
                      vertical: height * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(
                        width * 0.02,
                      ),
                    ),
                    child: const Text(
                      'Publish',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
          gap(h: 10),
        ],
      ),
    );
  }
}
