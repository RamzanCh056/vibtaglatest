import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';

import '../home/post_comment_bar.dart';
import '../home/revibe.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  List<String> buttonText = [
    'Ongoing',
    'Invited',
  ];

  final Completer<GoogleMapController> gcontroller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  bool isShowReactions = false;
  bool isLoading = false;
  Future<void> _goToTheLake() async {
    setState(() {
      isLoading = true;
    });
    final GoogleMapController controller = await gcontroller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _goToTheLake();
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: white,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(),
                  ],
                ),
                Container(
                  height: height * 0.88,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.35,
                          child: Stack(
                            children: [
                              Container(
                                height: height * 0.3,
                                width: double.infinity,
                                child: Image.asset(
                                  'assets/images/psl.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: height * 0.25,
                                right: 0,
                                left: 0,
                                child: Center(
                                  child: Container(
                                    width: width * 0.8,
                                    height: height * 0.1,
                                    padding: spacing(horizontal: 15),
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                left: 0,
                                                child: Image.asset(
                                                  'assets/new/images/user.png',
                                                  width: 35,
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                left: 25,
                                                child: Image.asset(
                                                  'assets/new/images/user.png',
                                                  width: 35,
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                left: 50,
                                                child: Image.asset(
                                                  'assets/new/images/user.png',
                                                  width: 35,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '+20 Going',
                                          style: TextStyle(
                                            color: orange,
                                          ),
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: orange,
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Text(
                                            'Invite',
                                            style: TextStyle(
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        gap(h: 15),
                        Container(
                          margin: spacing(horizontal: 15),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cricket Match PSL 8 this year'),
                              gap(h: 5),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem dummy text ever since the 1500s... Read more',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: grayMed,
                                ),
                              ),
                              gap(h: 15),
                              Container(
                                margin: spacing(horizontal: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          spacing(horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: grayLight,
                                        borderRadius: borderRadius(width),
                                      ),
                                      child: Image.asset(
                                          'assets/new/icons/Calendar.png'),
                                    ),
                                    gap(w: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '14 December, 2021',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: blackPrimary,
                                          ),
                                        ),
                                        Text(
                                          'Tuesday, 4:00PM - 9:00PM',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: grayMed,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              gap(h: 10),
                              Container(
                                margin: spacing(horizontal: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          spacing(horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: grayLight,
                                        borderRadius: borderRadius(width),
                                      ),
                                      child: Image.asset(
                                          'assets/new/icons/location_event.png'),
                                    ),
                                    gap(w: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Gala Convention Center',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: blackPrimary,
                                          ),
                                        ),
                                        Text(
                                          '36 Rot street, Los angeles',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: grayMed,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        gap(h: 15),
                        Container(
                          color: grayLight,
                          child: Container(
                            padding: spacing(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/new/gif/thumbs_up.gif',
                                      width: 25,
                                    ),
                                    Image.asset(
                                      'assets/new/gif/sparkling_heart.gif',
                                      width: 25,
                                    ),
                                    gap(w: 10),
                                    Text(
                                      '23.4k',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "2 Comments | 4 Revibed",
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        gap(h: 15),
                        Container(
                          padding: spacing(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isShowReactions = !isShowReactions;
                                  });
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.04,
                                      height: width * 0.04,
                                      child: Image.asset(
                                        'assets/new/icons/heart.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'React',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  PostComments(
                                      context: context, postId: '1724025');
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.04,
                                      height: width * 0.04,
                                      child: Image.asset(
                                        'assets/new/icons/comment.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Comment',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Revibe(context: context);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.04,
                                      height: width * 0.04,
                                      child: Image.asset(
                                        'assets/new/icons/revibe.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Revibe',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        gap(h: 15),
                        Container(
                          height: 2,
                          color: grayLight,
                          width: double.infinity,
                          margin: spacing(horizontal: 25),
                        ),
                        gap(h: 15),
                        Container(
                          margin: spacing(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/circle.png'),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: CircleAvatar(
                                        radius: width * 0.05,
                                        foregroundImage: AssetImage(
                                            'assets/images/streamer.jpg'),
                                      ),
                                    ),
                                  ),
                                  gap(w: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Gwen Stacy',
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                      Text(
                                        '1hr ago',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: grayMed,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: spacing(horizontal: 20, vertical: 7),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: orange,
                                  ),
                                  borderRadius: borderRadius(width),
                                ),
                                child: Text(
                                  'Message',
                                  style: TextStyle(
                                    color: orange,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        isLoading
                            ? gap()
                            : Container(
                                height: height * 0.4,
                                child: GoogleMap(
                                  mapType: MapType.hybrid,
                                  initialCameraPosition: _kGooglePlex,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    gcontroller.complete(controller);
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
