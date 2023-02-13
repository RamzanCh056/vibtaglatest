import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../../utils/constant.dart';

class MyAlbum extends StatefulWidget {
  const MyAlbum({super.key});

  @override
  State<MyAlbum> createState() => _MyAlbumState();
}

class _MyAlbumState extends State<MyAlbum> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBar(),
                Header(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      gap(h: 10),
                      Row(
                        children: [
                          gap(w: 15),
                          Container(
                            padding: spacing(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  HexColor('#FF9200'),
                                  HexColor('#FDBA31')
                                ],
                              ),
                              borderRadius: borderRadius(width),
                            ),
                            child: Text(
                              'My Albums',
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ),
                          gap(w: 10),
                          Container(
                            padding: spacing(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: borderRadius(width),
                              border: Border.all(
                                width: 1,
                                color: orange,
                              ),
                            ),
                            child: Text(
                              'Create',
                              style: TextStyle(
                                color: orange,
                              ),
                            ),
                          )
                        ],
                      ),
                      gap(h: 20),
                      Container(
                        height: height * 0.8,
                        width: double.maxFinite,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: spacing(horizontal: 15, vertical: 5),
                              padding: spacing(horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: borderRadius(10),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Album List one'),
                                          SvgPicture.asset(
                                            'assets/new/svg/buzzin/more_h.svg',
                                            color: grayMed,
                                          )
                                        ],
                                      ),
                                      gap(h: 10),
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: borderRadius(10),
                                            child: Image.asset(
                                              'assets/images/streamer.jpg',
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                    'assets/images/Image-2.png'),
                                                gap(w: 5),
                                                Text(
                                                  '3',
                                                  style: TextStyle(
                                                    color: white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  i % 3 == 0
                                      ? Positioned(
                                          top: 15,
                                          right: 20,
                                          child: Container(
                                            padding: spacing(
                                                horizontal: 15, vertical: 15),
                                            decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: borderRadius(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: spacing(
                                                    vertical: 3,
                                                  ),
                                                  child: Text('Share'),
                                                ),
                                                Container(
                                                  padding: spacing(
                                                    vertical: 3,
                                                  ),
                                                  child: Text('Edit'),
                                                ),
                                                Container(
                                                  padding: spacing(
                                                    vertical: 3,
                                                  ),
                                                  child: Text('Delete'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : gap(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
