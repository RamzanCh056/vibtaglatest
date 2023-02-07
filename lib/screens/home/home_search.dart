import 'dart:convert';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:vibetag/model/user.dart';
import 'package:video_player/video_player.dart';

import '../../utils/constant.dart';
import '../../widgets/post_option.dart';
import 'catagories/catagories_home.dart';
import 'catagories/explore_catagorie.dart';

class createPost extends StatefulWidget {
  createPost(this.user, {Key? key}) : super(key: key);
  late ModelUser user;

  @override
  State<createPost> createState() => _createPostState();
}

class _createPostState extends State<createPost> {
  final List<Widget> postOptions = [
    postOption(
      title: 'Upload Image',
      icon: 'assets/svg/post/image.svg',
      iconColor: HexColor('#5A92ED'),
    ),
    postOption(
      title: 'Upload Video',
      icon: 'assets/svg/post/video-camera.svg',
      iconColor: HexColor('#1EC722'),
    ),
    postOption(
      title: 'GIF',
      icon: 'assets/svg/post/plate.svg',
      iconColor: HexColor('#E5758F'),
    ),
    postOption(
      title: 'Upload Recording',
      icon: 'assets/svg/post/microphone.svg',
      iconColor: HexColor('#32C0D9'),
    ),
    postOption(
      title: 'Feelings',
      icon: 'assets/svg/post/smile.svg',
      iconColor: HexColor('#F5BC2B'),
    ),
    postOption(
      title: 'Upload Files',
      icon: 'assets/svg/post/folder.svg',
      iconColor: HexColor('#8D70DB'),
    ),
    postOption(
      title: 'Sell Products',
      icon: 'assets/svg/post/shopping-cart.svg',
      iconColor: HexColor('#FF9200'),
    ),
    postOption(
      title: 'Create Poll',
      icon: 'assets/svg/post/poll.svg',
      iconColor: HexColor('#868686'),
    ),
    postOption(
      title: 'Location',
      icon: 'assets/svg/post/maps-and-flags.svg',
      iconColor: HexColor('#77300A'),
    ),
    postOption(
      title: 'Audio Upload',
      icon: 'assets/svg/post/headphone.svg',
      iconColor: HexColor('#000000'),
    ),
  ];

  DateTime? TimeDate;
  final postController = TextEditingController();

  //final Set<Marker> markers = Set();
  double? longitude;
  double? latitude;

  // LatLng? longitude;
  // LatLng? longitude;

  final location = TextEditingController();
  final poll = TextEditingController();
  final pollAnswer = TextEditingController();

  // var youLoc;

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

  createPost() async {
    setState(() {
      isLoad = true;
      print("is load in api start== ${isLoad}");
    });
    var headers = {
      'Cookie':
          'PHPSESSID=f473f28ca40b056fd1a23e624a61bccc; _us=1667727587; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-11-05%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
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
      'postSticker': '',
      'post_color': '',
      'postRecord': '',
      'answer[]': poll.text ?? '',
      //'answer[]': pollAnswer.text?? '',
    });
    if (imageFile != null) {
      // setState(() {
      //   isLoad = false;
      // });
      request.files.add(await http.MultipartFile.fromPath('postFile', imageFile!.path));
      print("image file woth path is ${imageFile!.path}");
    }
    if (_video != null) {

      request.files.add(await http.MultipartFile.fromPath('postVideo', _video!.path));
      print("video path is ${_video!.path}");
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
              addressLatLng = LatLng(result.geometry!.location.lat, result.geometry!.location.lng);
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
    XFile? pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);

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
  Widget build(BuildContext context) {
    return HomeSearchBar(user: widget.user);
  }

  Widget HomeSearchBar({
    required ModelUser user,
  }) {
    return StatefulBuilder(builder: (context, setState) {

      double width = deviceWidth(context: context);
      double height = deviceHeight(context: context);
      return Container(
        margin: spacing(
          vertical: 10,
        ),
        padding: spacing(
          vertical: 10,
          horizontal: 10,
        ),
        width: double.maxFinite,
        color: white,
        height: height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * 0.12,
              height: width * 0.12,
              padding: EdgeInsets.all(
                width * 0.01,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/new/images/border.png',
                  ),
                ),
              ),
              child: CircleAvatar(
                radius: width * 0.055,
                foregroundImage: NetworkImage(
                  user.avatar.toString(),
                ),
              ),
            ),
            Container(
              width: width * 0.65,
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(width),
              ),
              child: SingleChildScrollView(

                child: GestureDetector(
                  onTap: () {
                  //
                    showDialog(
                        context: context,
                        builder: (_) {
                          return StatefulBuilder(
                              builder: (BuildContext context, void Function(void Function()) setState) {

                            return Dialog(
                              // clipBehavior: Clip.none,
                              backgroundColor: Colors.white,
                              insetPadding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    // height: MediaQuery.of(context).size.height * 0.92,
                                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                                    width: double.infinity,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(15.0),
                                    // ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 17.0,
                                          ),
                                          TextFormField(
                                            controller: postController,
                                            maxLines: 3,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: "What\'s happening",
                                              hintStyle: TextStyle(fontSize: 18.5),
                                            ),
                                          ),
                                          _video != null
                                              ?
                                              // _videoPlayerController!.value.initialized
                                              SizedBox(
                                                  height: 350,
                                                  width: double.infinity,
                                                  child: Chewie(
                                                    controller: chewieController!,
                                                  ))
                                              : Container(),
                                          imageFile != null
                                              ? Container(
                                                  height: 300,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),

                                                    color: Colors.grey.shade100,
                                                    // image: DecorationImage(
                                                    //   image: FileImage(imageFile!),
                                                    //   fit: BoxFit.fill,
                                                    // )
                                                  ),
                                                  child: Image.file(
                                                    imageFile!,
                                                    fit: BoxFit.cover,
                                                  ))
                                              : Container(),
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
                                          //   poll.text != ""?
                                          Visibility(
                                            visible: _isShow,
                                            child: Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: Colors.grey.shade300,
                                                  ),
                                                  height: 55,
                                                  child: TextFormField(
                                                    controller: poll,
                                                    maxLines: 3,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderSide: BorderSide.none,
                                                      ),
                                                      hintText: "Answer",
                                                      hintStyle: TextStyle(fontSize: 18.5),
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(height: 5,),
                                                // Container(
                                                //   decoration:
                                                //   BoxDecoration(
                                                //     borderRadius:
                                                //     BorderRadius
                                                //         .circular(
                                                //         20),
                                                //     color: Colors.grey.shade300,
                                                //   ),
                                                //   height: 55,
                                                //   child: TextFormField(
                                                //     controller: pollAnswer,
                                                //     maxLines: 3,
                                                //     decoration: const InputDecoration(
                                                //       border:
                                                //       OutlineInputBorder(
                                                //         borderSide:
                                                //         BorderSide.none,
                                                //       ),
                                                //       hintText:
                                                //       "Answer",
                                                //       hintStyle: TextStyle(
                                                //           fontSize: 18.5),
                                                //     ),
                                                //   ),
                                                // )
                                              ],
                                            ),
                                          ),
                                          //:Container(),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        print("vido link is $_video");
                                                      },
                                                      child: const Image(
                                                        image: AssetImage('assets/images/color_pick.png'),
                                                        width: 23,
                                                        height: 23,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 6.0,
                                                    ),
                                                    Container(
                                                      // height: 30.0,
                                                      // width: MediaQuery.of(context).size.width * 0.235,
                                                      padding: const EdgeInsets.symmetric(
                                                        vertical: 6,
                                                        horizontal: 6,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        color: Colors.grey.withOpacity(0.5),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            height: 14,
                                                            width: 14,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(50),
                                                              image: const DecorationImage(
                                                                image: AssetImage("assets/images/eveyone.png"),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 4.0,
                                                          ),
                                                          const Text(
                                                            'Everyone',
                                                            style: TextStyle(fontSize: 11.0, color: Colors.black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 6.0,
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => CatagoriesHome()));
                                                      },
                                                      child: Container(
                                                        // height: 25.0,
                                                        padding: const EdgeInsets.symmetric(
                                                          vertical: 5,
                                                          horizontal: 5,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                          color: Colors.grey.withOpacity(0.5),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            const Text(
                                                              'Categories',
                                                              style: TextStyle(fontSize: 11.0, color: Colors.black),
                                                            ),
                                                            const SizedBox(
                                                              width: 8.0,
                                                            ),
                                                            Container(
                                                              color: Colors.grey.withOpacity(0.5),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    alignment: Alignment.center,
                                                                    height: 7.0,
                                                                    width: 10.0,
                                                                    color: Colors.grey.withOpacity(0.5),
                                                                    child: const Image(
                                                                      image: AssetImage('assets/images/arrow-up.png'),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 2.5,
                                                                  ),
                                                                  Container(
                                                                    alignment: Alignment.center,
                                                                    height: 7.0,
                                                                    width: 10.0,
                                                                    color: Colors.grey.withOpacity(0.5),
                                                                    child: const Image(
                                                                      image: AssetImage('assets/images/arrow-down.png'),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: const [
                                                    Text(
                                                      '#',
                                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      width: 8.0,
                                                    ),
                                                    Text(
                                                      '@',
                                                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      width: 8.0,
                                                    ),
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage('assets/images/emoji.png'),
                                                      radius: 9.0,
                                                      backgroundColor: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Container(
                                            height: 1.0,
                                            width: double.infinity,
                                            color: Colors.black.withOpacity(0.3),
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            height: height * 0.45,
                                            padding: spacing(
                                              horizontal: width * 0.01,
                                              vertical: 0,
                                            ),
                                            child: GridView.builder(
                                              itemCount: 10,
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                                childAspectRatio: 6 / 2,
                                              ),
                                              itemBuilder: (context, i) {



                                                return GestureDetector(
                                                  onTap: ()async{
                                                    if (i == 0)  {
                                                      await getImageGallery();
                                                      setState(() {});
                                                    }
                                                    if (i == 1) {
                                                      await _pickVideo();
                                                      setState(() {});
                                                    }
                                                    if (i == 7) {
                                                      setState(() {
                                                           _isShow = !_isShow;
                                                      });
                                                    }
                                                    if (i == 8) {
                                                      print("is load in dilouge == ${isLoad}");
                                                      // await    showPlacePicker();
                                                      // setState(() {});
                                                    }

                                                  },
                                                    child: postOptions[i]);
                                              },
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 25.0,
                                          ),
                                          isLoad
                                              ? const Center(child:  CircularProgressIndicator()):
                                          GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                isLoad = !isLoad;
                                              });

                                              print("click");
                                              await createPost();
                                              print("is load in dilaouge click == ${isLoad}");
                                              // setState(() {
                                              //  // Navigator.pop(context);
                                              //   postController.clear();
                                              //   imageFile = null;
                                              //   _video = null;
                                              //   _videoPlayerController!.dispose();
                                              //   location.text = "";
                                              // });
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                child:
                                                    const Text(
                                                        'Publish',
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 16,
                                    top: 15,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            imageFile = null;
                                            _video = null;
                                            location.text = "";
                                            pollAnswer.text = '';
                                            poll.text = '';
                                          },
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.4),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Image(
                                          image: AssetImage('assets/images/reject.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        });
                  },
                  child: TextFormField(
                    enabled: false,
                    // onTap: () {
                    //   Add_A_Post(
                    //     context: context,
                    //   );
                    // },
                    decoration: InputDecoration(
                        hintText: 'What\'s your vibe',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                          left: 15,
                          bottom: 10,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: grayMed,
                        )),
                  ),
                ),
              ),
            ),
            Container(
              height: width * 0.11,
              width: width * 0.11,
              child: SvgPicture.asset(
                'assets/svg/chat/plus.svg',
              ),
            )
          ],
        ),
      );
    });
  }
}
