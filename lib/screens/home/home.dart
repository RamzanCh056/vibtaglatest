import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/model/useprofile_model.dart';
import 'package:vibetag/screens/home/comments.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/popup/drawer/drawer.dart';
import 'package:vibetag/widgets/popup/story/add_story.dart';

import '../../controller/home_controller.dart';
import '../../res/static_info.dart';
import '../../utils/constant.dart';
import '../../widgets/live.dart';
import '../../widgets/post_option.dart';
var postData = [];
var loadData = [];
var showLocation;
String? addres;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool yourFeeds = true;
  bool activeTheme = true;
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();



  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
   controller.getHomeData();
   controller.loadMore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: _key,
      drawer: DrawerMenu(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width,
              child: Column(
                children: [
                  NavBar(),
                  Header(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                width: width,
                height: height * 0.87,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                          future: controller.getUserData(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.data != null || StaticInfo.getUserInfo != null) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  // scrollDirection: ax,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 1, //photoList.length,
                                  itemBuilder: (context, index) {
                                    return     Column(children: [
                                      Container(
                                        width: width,
                                        height: height * 0.23,
                                        decoration:  BoxDecoration(
                                          color: Colors.black,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage( StaticInfo.getUserInfo["cover"],),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: width,
                                        height: height * 0.08,
                                        padding: spacing(
                                          horizontal: width * 0.02,
                                          vertical: 0,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: width * 0.48,
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: width * 0.06,
                                                    foregroundImage: NetworkImage( StaticInfo.getUserInfo["avatar"],),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children:  [
                                                      Row(children: [
                                                        Text(
                                                          StaticInfo.getUserInfo["first_name"],
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          StaticInfo.getUserInfo["last_name"],
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],),
                                                      Text(
                                                        "@ ${ StaticInfo.getUserInfo["username"]}",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black54,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'United State',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black38,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: width * 0.48,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Text(
                                                        'Post',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.01,
                                                      ),
                                                      Text(
                                                        StaticInfo.getUserInfo['details']
                                                        ["post_count"],
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black54,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Text(
                                                        'Following',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.01,
                                                      ),
                                                      Text(
                                                        StaticInfo.getUserInfo['details']
                                                        ["following_count"],
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black54,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,

                                                    children: [
                                                      const Text(
                                                        'Followers',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.01,
                                                      ),
                                                      Text(
                                                        StaticInfo.getUserInfo['details']
                                                        ["followers_count"],
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black54,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Padding(
                                        padding: spacing(
                                          horizontal: width * 0.01,
                                          vertical: 0,
                                        ),
                                        child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Moments',

                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,

                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Container(
                                        width: width,
                                        height: height * 0.3,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 10,
                                          shrinkWrap: true,
                                          itemBuilder: (context, i) {
                                            if (i < 1) {
                                              return InkWell(
                                                onTap: () {
                                                  addStory(context: context);
                                                },
                                                child: Container(
                                                  width: width * 0.3,
                                                  height: height * 0.2,
                                                  margin: spacing(
                                                    horizontal: width * 0.01,
                                                    vertical: height * 0.001,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                      width * 0.03,
                                                    ),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.white,
                                                        offset: Offset.zero,
                                                        spreadRadius: 1,
                                                        blurRadius: 3,
                                                      )
                                                    ],
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
                                                              width * 0.03,
                                                            ),
                                                            child: Image.network(
                                                              StaticInfo.getUserInfo["avatar"],
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        child: Center(
                                                          child: Container(
                                                            width: width * 0.2,
                                                            height: width * 0.2,
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: Color.fromARGB(132, 255, 255, 255),
                                                              borderRadius: BorderRadius.circular(
                                                                width * 0.1,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Colors.white,
                                                              size: width * 0.15,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                            return Container(
                                              width: width * 0.3,
                                              height: height * 0.3,
                                              margin: spacing(
                                                horizontal: width * 0.01,
                                                vertical: height * 0.001,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                  width * 0.03,
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset.zero,
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                  )
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                  width * 0.03,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/streamer.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      Container(
                                        width: double.maxFinite,
                                        height: height * 0.13,
                                        padding: spacing(
                                          horizontal: width * 0.02,
                                          vertical: height * 0.01,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            width * 0.02,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             CircleAvatar(
                                              foregroundImage:  NetworkImage(StaticInfo.getUserInfo["avatar"],),
                                            ),
                                            //const CircleAvatar(foregroundImage:   AssetImage('assets/images/streamer.jpg'),),
                                            SizedBox(
                                              width: width * 0.03,
                                            ),
                                            Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    add_A_Post();
                                                  },
                                                  child: Container(
                                                    width: width * 0.8,
                                                    height: height * 0.04,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          child: Container(
                                                            width: width * 0.8,
                                                            height: height * 0.04,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          left: 0,
                                                          right: 0,
                                                          child: Container(
                                                            height: height * 0.001,
                                                            width: double.maxFinite,
                                                            color: const Color.fromARGB(255, 126, 123, 123),
                                                          ),
                                                        ),
                                                        const Positioned(
                                                          top: 5,
                                                          left: 5,
                                                          child: Text(
                                                            'What\'s going on? #Hastag.. @Mention.. Link..',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 2,
                                                          right: 5,
                                                          child: InkWell(
                                                            onTap: () {
                                                              LivePopUp(
                                                                context: context,
                                                              );
                                                            },
                                                            child: const SvgIcon(
                                                              'assets/svg/live-streaming.svg',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                Container(
                                                  width: width * 0.75,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: height * 0.04,
                                                        padding: spacing(
                                                          horizontal: width * 0.03,
                                                          vertical: 0,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: backgroundColor,
                                                          borderRadius: BorderRadius.circular(width * 0.1),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            const Text(
                                                              'Your Feeds',
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 9,
                                                              ),
                                                            ),
                                                            Switch(
                                                              value: yourFeeds,
                                                              onChanged: (value) {
                                                                setState(() {
                                                                  yourFeeds = value;
                                                                  if (value == true) {
                                                                    StaticInfo.feedId = 0;
                                                                    print("feed is ${StaticInfo.feedId}");
                                                                  controller.getFeed();
                                                                    controller.getHomeData();

                                                                  } else if (value == false) {
                                                                    StaticInfo.feedId = 1;
                                                                    print("feed is ${StaticInfo.feedId}");
                                                                  setState(() {
                                                                    controller.getFeed();
                                                                    controller.getHomeData();
                                                                  });
                                                                  }
                                                                });
                                                              },
                                                            ),
                                                            const Text(
                                                              'All',
                                                              style: TextStyle(
                                                                color: Colors.orange,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 9,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: height * 0.04,
                                                        padding: spacing(
                                                          horizontal: width * 0.03,
                                                          vertical: 0,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: backgroundColor,
                                                          borderRadius: BorderRadius.circular(width * 0.1),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            const Text(
                                                              'Day',
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 9,
                                                              ),
                                                            ),
                                                            Switch(
                                                              value: activeTheme,
                                                              onChanged: (value) {
                                                                setState(() {
                                                                  activeTheme = value;
                                                                });
                                                              },
                                                            ),
                                                            const Text(
                                                              'Night',
                                                              style: TextStyle(
                                                                color: Colors.orange,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 9,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],);
                                  });
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),

                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: height * 0.16,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  width * 0.02,
                                ),
                              ),
                              child: Column(
                                children: [
                                  DefaultTabController(
                                    length: 8,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const TabBar(
                                          unselectedLabelColor: Color.fromARGB(255, 110, 107, 107),
                                          labelColor: Colors.orange,
                                          indicatorColor: Colors.orange,
                                          labelStyle: TextStyle(
                                            fontSize: 24,
                                          ),
                                          tabs: [
                                            Tab(
                                              icon: SvgIcon('assets/svg/list-text.svg'),
                                            ),
                                            Tab(
                                              icon: SvgIcon('assets/svg/writing.svg'),
                                            ),
                                            Tab(
                                              icon: SvgIcon('assets/svg/photo.svg'),
                                            ),
                                            Tab(
                                              icon: SvgIcon('assets/svg/play-button.svg'),
                                            ),
                                            Tab(
                                              icon: SvgIcon('assets/svg/music.svg'),
                                            ),
                                            Tab(
                                              icon: SvgIcon('assets/svg/copy.svg'),
                                            ),
                                            Tab(
                                              icon: SvgIcon('assets/svg/position.svg'),
                                            ),
                                            Tab(
                                              icon: SvgIcon('assets/svg/live.svg'),
                                            ),
                                          ],
                                        ),
                                        Container(),
                                        Container(),
                                        Container(),
                                        Container(),
                                        Container(),
                                        Container(),
                                        Container(),
                                        Container(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    width: width * 0.8,
                                    height: height * 0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        width * 0.1,
                                      ),
                                      border: Border.all(
                                        width: width * 0.004,
                                        color: Color.fromARGB(255, 116, 113, 113),
                                      ),
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          left: 10,
                                          right: 10,
                                          top: 6,
                                        ),
                                        suffix: Icon(Icons.search),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            FutureBuilder(
                                future: controller.getHomeData(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.data != null || postData != null) {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: postData.length, //photoList.length,
                                        itemBuilder: (context, index) {
                                          showLocation = LatLng(double.parse(postData[index]['lat_']),
                                              double.parse(postData[index]['lng_']));

                                          addres = postData[index]['postMap'].toString();
                                         // StaticInfo.lastPostId= postData[8]['post_id'];

                                          return Container(
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                width * 0.02,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: CircleAvatar(
                                                    foregroundImage: NetworkImage(
                                                      postData[index]['publisher']['avatar'],
                                                    ),
                                                  ),
                                                  title: Text(
                                                    postData[index]['publisher']['username'],
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  subtitle: Row(
                                                    children: [
                                                      Text(
                                                        DateFormat('hh:mm a')
                                                            .format(DateTime.fromMillisecondsSinceEpoch(int.parse(
                                                                  postData[index]['time'],
                                                                ) *
                                                                1000)),
                                                        style: TextStyle(
                                                          fontSize: 10, color: Colors.grey,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      const SvgIcon(
                                                        'assets/svg/globe.svg',
                                                        height: 10,
                                                        width: 10,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                postData[index]['postText'] != ""
                                                    ? Container(
                                                        width: double.infinity,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              postData[index]['postText'],
                                                              style: (TextStyle(color: Colors.black, fontSize: 16)),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            postData[index]['postFile_full'] != ""
                                                                ? postData[index]['postFileThumb'] != ""
                                                                    ? Container(
                                                                        color: Colors.transparent,
                                                                        // height: 380.0,
                                                                        child: Center(child: Text("video")
                                                                            // VideoPlay(
                                                                            //
                                                                            //
                                                                            //
                                                                            // pathh: postData[
                                                                            // index][
                                                                            // 'postFile_full'],
                                                                            // )
                                                                            ))
                                                                    : Container(
                                                                        height: 300.0,
                                                                        child: Image.network(
                                                                          postData[index]['postFile_full'],
                                                                          width: double.infinity,
                                                                          height: height * 0.3,
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                      )
                                                                : Container(),
                                                          ],
                                                        ))
                                                    : postData[index]['postMap'] != ""
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              print("longitude and lat is == $showLocation");
                                                              print("adrees == $addres");
                                                            },
                                                            child: Container(
                                                                height: 300.0,
                                                                width: double.infinity,
                                                                alignment: Alignment.center,
                                                                child: Text("Maps")
                                                                // GoogleMap(
                                                                // zoomGesturesEnabled:false,
                                                                // initialCameraPosition:
                                                                // CameraPosition(
                                                                // target: LatLng(
                                                                // double.parse(postData[index]
                                                                // ['lat_']),
                                                                // double.parse(postData[index]
                                                                // ['lng_'])),
                                                                // //showLocation,
                                                                //
                                                                // zoom:
                                                                // 15.151926040649414, //initial zoom level
                                                                // ),
                                                                //
                                                                //
                                                                //
                                                                // onMapCreated: (controller) =>
                                                                // _googleMapController =
                                                                // controller,
                                                                // markers:getmarkers(),
                                                                // ),
                                                                ))
                                                        : postData[index]['postFile_full'] != ""
                                                            ? postData[index]['postFile'].split(".").last == "mp4" ||
                                                                    postData[index]['postFileThumb'] != ""
                                                                ? Container(
                                                                    color: Colors.transparent,
                                                                    //kAppColor,
                                                                    // height: 380.0,
                                                                    child: const Center(child: Text("video")
                                                                        // VideoPlay(
                                                                        // pathh: postData[index]
                                                                        // ['postFile_full'],
                                                                        // )
                                                                        ))
                                                                : Image.network(
                                                                  postData[index]['postFile_full'],
                                                                  width: width * 1.0,
                                                                  height: height * 0.3,
                                                                  fit: BoxFit.cover,
                                                                )
                                                            :
                                                            //Container()
                                                            Image.network(
                                                                postData[index]['product']['images'][0]['image'],
                                                                width: width * 1.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                Padding(
                                                  padding: spacing(
                                                    horizontal: width * 0.01,
                                                    vertical: 0,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 30,
                                                            child: Image.asset(
                                                              'assets/icons/like1.png',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width * 0.02,
                                                          ),
                                                          Column(
                                                            children: const [
                                                              Text(
                                                                'Likes',
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              SizedBox(height: 5),
                                                              Text(
                                                                '465',
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 30,
                                                            child: Image.asset(
                                                              'assets/icons/comment1.png',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width * 0.02,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              commentIndex = index;

                                                              var comment = postData[index]
                                                              ['all_comments']
                                                                  .isNotEmpty;
                                                              Get.to(
                                                                const CommentsScreen(),
                                                                arguments: [index, comment],
                                                              );
                                                            },
                                                            child: Column(
                                                              children:  [
                                                                const Text(
                                                                  'Comments',
                                                                  style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 14,
                                                                  ),
                                                                ),
                                                                const SizedBox(height: 5),
                                                                Text(
                                                                  postData[index]
                                                                  ['total_comments'],
                                                                  style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 12,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 30,
                                                            child: Image.asset(
                                                              'assets/icons/revibe1.png',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width * 0.02,
                                                          ),
                                                          Column(
                                                            children: const [
                                                              Text(
                                                                'Revibed',
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              SizedBox(height: 5),
                                                              Text(
                                                                '212',
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                            SizedBox(height: height * 0.02),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children:  [
                            //     const Text("Load more", style: TextStyle(color: Colors.blue, fontSize: 16),),
                            //     GestureDetector(
                            //         onTap: (){
                            //           print("LAST POST ID == ${StaticInfo.lastPostId}");
                            //         },
                            //         child: Icon(Icons.refresh, color: Colors.blue,))
                            //   ],),
//                             FutureBuilder(
//                                 future: controller.getHomeData(),
//                                 builder: (context, AsyncSnapshot snapshot) {
//                                   if (snapshot.data != null || loadData != null) {
//                                     return ListView.builder(
//                                         shrinkWrap: true,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         itemCount: loadData.length, //photoList.length,
//                                         itemBuilder: (context, index) {
//                                           showLocation = LatLng(double.parse(loadData[index]['lat_']),
//                                               double.parse(loadData[index]['lng_']));
//
//                                           addres = loadData[index]['postMap'].toString();
//                                           return Container(
//                                             width: double.maxFinite,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius: BorderRadius.circular(
//                                                 width * 0.02,
//                                               ),
//                                             ),
//                                             child: Column(
//                                               children: [
//                                                 ListTile(
//                                                   leading: CircleAvatar(
//                                                     foregroundImage: NetworkImage(
// loadData[index]['publisher']['avatar'],
//                                                     ),
//                                                   ),
//                                                   title: Text(
//                                                   loadData[index]['publisher']['username'],
//                                                   ),
//                                                   subtitle: Row(
//                                                     children: [
//                                                       Text(
//                                                         DateFormat('hh:mm a')
//                                                             .format(DateTime.fromMillisecondsSinceEpoch(int.parse(
// loadData[index]['time'],
//                                                         ) *
//                                                             1000)),
//                                                       ),
//                                                       SizedBox(
//                                                         width: width * 0.02,
//                                                       ),
//                                                       const SvgIcon(
//                                                         'assets/svg/globe.svg',
//                                                         width: 16,
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
// loadData[index]['postText'] != ""
//                                                     ? Container(
//                                                     width: double.infinity,
//                                                     child: Column(
//                                                       children: [
//                                                         Text(
// loadData[index]['postText'],
//                                                           style: (TextStyle(color: Colors.black, fontSize: 16)),
//                                                         ),
//                                                         SizedBox(
//                                                           height: 20,
//                                                         ),
// loadData[index]['postFile_full'] != ""
//                                                             ? loadData[index]['postFileThumb'] != ""
//                                                             ? Container(
//                                                             color: Colors.transparent,
//                                                             // height: 380.0,
//                                                             child: Center(child: Text("video")
//                                                               // VideoPlay(
//                                                               //
//                                                               //
//                                                               //
//                                                               // pathh: postData[
//                                                               // index][
//                                                               // 'postFile_full'],
//                                                               // )
//                                                             ))
//                                                             : Container(
//                                                           height: 300.0,
//                                                           child: Image.network(
// loadData[index]['postFile_full'],
//                                                             width: double.infinity,
//                                                             height: height * 0.3,
//                                                             fit: BoxFit.cover,
//                                                           ),
//                                                         )
//                                                             : Container(),
//                                                       ],
//                                                     ))
//                                                     : loadData[index]['postMap'] != ""
//                                                     ? GestureDetector(
//                                                     onTap: () {
//                                                       print("longitude and lat is == $showLocation");
//                                                       print("adrees == $addres");
//                                                     },
//                                                     child: Container(
//                                                         height: 300.0,
//                                                         width: double.infinity,
//                                                         alignment: Alignment.center,
//                                                         child: Text("Maps")
//                                                       // GoogleMap(
//                                                       // zoomGesturesEnabled:false,
//                                                       // initialCameraPosition:
//                                                       // CameraPosition(
//                                                       // target: LatLng(
//                                                       // double.parse(postData[index]
//                                                       // ['lat_']),
//                                                       // double.parse(postData[index]
//                                                       // ['lng_'])),
//                                                       // //showLocation,
//                                                       //
//                                                       // zoom:
//                                                       // 15.151926040649414, //initial zoom level
//                                                       // ),
//                                                       //
//                                                       //
//                                                       //
//                                                       // onMapCreated: (controller) =>
//                                                       // _googleMapController =
//                                                       // controller,
//                                                       // markers:getmarkers(),
//                                                       // ),
//                                                     ))
//                                                     : loadData[index]['postFile_full'] != ""
//                                                     ? loadData[index]['postFile'].split(".").last == "mp4" ||
// loadData[index]['postFileThumb'] != ""
//                                                     ? Container(
//                                                     color: Colors.transparent,
//                                                     //kAppColor,
//                                                     // height: 380.0,
//                                                     child: Center(child: Text("video")
//                                                       // VideoPlay(
//                                                       // pathh: postData[index]
//                                                       // ['postFile_full'],
//                                                       // )
//                                                     ))
//                                                     : Container(
//                                                   //height: 300.0,
//                                                   child: Image.network(
// loadData[index]['postFile_full'],
//                                                     width: width * 1.0,
//                                                     height: height * 0.3,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 )
//                                                     :
//                                                 //Container()
//                                                 Image.network(
//                                                   loadData[index]['product']['images'][0]['image'],
//                                                   width: width * 1.0,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                                 SizedBox(
//                                                   height: height * 0.02,
//                                                 ),
//                                                 Padding(
//                                                   padding: spacing(
//                                                     horizontal: width * 0.01,
//                                                     vertical: 0,
//                                                   ),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           Container(
//                                                             width: 30,
//                                                             child: Image.asset(
//                                                               'assets/icons/like1.png',
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: width * 0.02,
//                                                           ),
//                                                           Column(
//                                                             children: const [
//                                                               Text(
//                                                                 'Likes',
//                                                                 style: TextStyle(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 14,
//                                                                 ),
//                                                               ),
//                                                               SizedBox(height: 5),
//                                                               Text(
//                                                                 '465',
//                                                                 style: TextStyle(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 12,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       Row(
//                                                         children: [
//                                                           Container(
//                                                             width: 30,
//                                                             child: Image.asset(
//                                                               'assets/icons/comment1.png',
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: width * 0.02,
//                                                           ),
//                                                           Column(
//                                                             children:  [
//                                                               Text(
//                                                                 'Comments',
//                                                                 style: TextStyle(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 14,
//                                                                 ),
//                                                               ),
//                                                               SizedBox(height: 5),
//                                                               Text(
//                                                                 postData[index]
//                                                                 ['total_comments'],
//                                                                 style: TextStyle(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 12,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       Row(
//                                                         children: [
//                                                           Container(
//                                                             width: 30,
//                                                             child: Image.asset(
//                                                               'assets/icons/revibe1.png',
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: width * 0.02,
//                                                           ),
//                                                           Column(
//                                                             children: const [
//                                                               Text(
//                                                                 'Revibed',
//                                                                 style: TextStyle(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 14,
//                                                                 ),
//                                                               ),
//                                                               SizedBox(height: 5),
//                                                               Text(
//                                                                 '212',
//                                                                 style: TextStyle(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 12,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: height * 0.02,
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         });
//                                   } else {
//                                     return Center(
//                                       child: CircularProgressIndicator(),
//                                     );
//                                   }
//                                 }),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Container(
                        width: width,
                        height: height * 0.1,
                        child: AppFooter(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  add_A_Post() {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: ((context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              backgroundColor: Colors.white,
              iconPadding: EdgeInsets.only(
                top: height * 0.01,
                right: height * 0.01,
                left: width * 0.95,
              ),
              icon: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                    padding: EdgeInsets.all(
                      width * 0.01,
                    ),
                    decoration: BoxDecoration(
                        color: HexColor('#DDDDDD'),
                        borderRadius: BorderRadius.circular(
                          width * 0.3,
                        )),
                    child: Icon(Icons.close)),
              ),
              content: Container(
                width: width * 0.95,
                height: height * 0.85,
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: spacing(
                        horizontal: width * 0.05,
                        vertical: 0,
                      ),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'What\'s happening',
                              style: TextStyle(
                                color: HexColor('#7C7C7C'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.15,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: spacing(
                                        horizontal: width * 0.015,
                                        vertical: 0,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/svg/post/color-circle.svg',
                                        fit: BoxFit.cover,
                                        width: width * 0.06,
                                      ),
                                    ),
                                    Container(
                                      padding: spacing(
                                        horizontal: width * 0.015,
                                        vertical: 5,
                                      ),
                                      margin: spacing(
                                        horizontal: width * 0.015,
                                        vertical: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor('#F0F0F0'),
                                        borderRadius: BorderRadius.circular(width * 0.02),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: width * 0.04,
                                            child: const SvgIcon(
                                              'assets/svg/post/world.svg',
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.015,
                                          ),
                                          const Text(
                                            'Everyone',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: spacing(
                                              horizontal: width * 0.015,
                                              vertical: 9,
                                            ),
                                            decoration: BoxDecoration(
                                              color: HexColor('#F0F0F0'),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(
                                                  width * 0.02,
                                                ),
                                                topLeft: Radius.circular(
                                                  width * 0.02,
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  'Category',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: HexColor('#F0F0F0'),
                                              borderRadius: BorderRadius.circular(
                                                width * 0.02,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Colors.black38,
                                                          ),
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(
                                                              width * 0.02,
                                                            ),
                                                          ),
                                                        ),
                                                        child: const Icon(
                                                          Icons.keyboard_arrow_up_rounded,
                                                          size: 14,
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Colors.black38,
                                                          ),
                                                          borderRadius: BorderRadius.only(
                                                            bottomRight: Radius.circular(
                                                              width * 0.02,
                                                            ),
                                                          ),
                                                        ),
                                                        child: const Icon(
                                                          Icons.keyboard_arrow_down_rounded,
                                                          size: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/post/hashtag.svg',
                                      fit: BoxFit.cover,
                                      width: width * 0.05,
                                    ),
                                    SizedBox(
                                      width: width * 0.025,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/post/at-sign.svg',
                                      fit: BoxFit.cover,
                                      width: width * 0.05,
                                    ),
                                    SizedBox(
                                      width: width * 0.025,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/post/smile1.svg',
                                      fit: BoxFit.cover,
                                      width: width * 0.05,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: height * 0.001,
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      height: height * 0.45,
                      padding: spacing(
                        horizontal: width * 0.03,
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
                          return postOptions[i];
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
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
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
