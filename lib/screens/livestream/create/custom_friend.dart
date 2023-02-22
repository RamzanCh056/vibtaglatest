import 'package:flutter/material.dart';
import 'package:vibetag/utils/constant.dart';

class CustomFriends extends StatefulWidget {
  const CustomFriends({super.key});

  @override
  State<CustomFriends> createState() => _CustomFriendsState();
}

class _CustomFriendsState extends State<CustomFriends> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.8,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: spacing(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/new/icons/livestream/icons_left.png'),
                Container(
                  padding: spacing(
                    vertical: 20,
                  ),
                  child: Text(
                    'Custom Friends',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                gap(),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: grayMed,
          ),
          gap(h: 15),
          Container(
            padding: spacing(horizontal: 20),
            child: Text('Share with'),
          ),
          gap(h: 5),
          Container(
            height: height * 0.05,
            margin: spacing(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(width),
            ),
            child: Stack(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search friends',
                    contentPadding: EdgeInsets.only(
                      left: 45,
                      bottom: 0,
                      top: 0,
                    ),
                    hintStyle: TextStyle(
                      color: grayMed,
                    ),
                  ),
                  style: TextStyle(
                    color: grayMed,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 10,
                  bottom: 0,
                  child: Container(
                    width: 30,
                    child: Image.asset(
                      'assets/new/icons/search.png',
                      color: grayMed,
                    ),
                  ),
                )
              ],
            ),
          ),
          gap(h: 15),
          Container(
            height: height * 0.13,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Container(
                  margin: spacing(horizontal: 5),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: width * 0.09,
                            foregroundImage:
                                AssetImage('assets/images/streamer.jpg'),
                          ),
                          gap(h: 8),
                          Text(
                            'Mark J.',
                            style: TextStyle(
                              fontSize: 12,
                              color: grayMed,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: white,
                            ),
                            borderRadius: borderRadius(width),
                          ),
                          child: Image.asset(
                            'assets/new/icons/searched_user.png',
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          gap(h: 15),
          Container(
            height: 10,
            width: double.maxFinite,
            color: grayLight,
          ),
          gap(h: 30),
          Container(
            padding: spacing(horizontal: 20),
            child: Text('Don\'t share with'),
          ),
          gap(h: 5),
          Container(
            height: height * 0.05,
            margin: spacing(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(width),
            ),
            child: Stack(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search friends',
                    contentPadding: EdgeInsets.only(
                      left: 45,
                      bottom: 0,
                      top: 0,
                    ),
                    hintStyle: TextStyle(
                      color: grayMed,
                    ),
                  ),
                  style: TextStyle(
                    color: grayMed,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 10,
                  bottom: 0,
                  child: Container(
                    width: 30,
                    child: Image.asset(
                      'assets/new/icons/search.png',
                      color: grayMed,
                    ),
                  ),
                )
              ],
            ),
          ),
          gap(h: 15),
          Container(
            height: height * 0.13,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Container(
                  margin: spacing(horizontal: 5),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: width * 0.09,
                            foregroundImage:
                                AssetImage('assets/images/streamer.jpg'),
                          ),
                          gap(h: 8),
                          Text(
                            'Mark J.',
                            style: TextStyle(
                              fontSize: 12,
                              color: grayMed,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: white,
                            ),
                            borderRadius: borderRadius(width),
                          ),
                          child: Image.asset(
                            'assets/new/icons/searched_user.png',
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 15),
            padding: spacing(vertical: 10),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: borderRadius(10),
              border: Border.all(
                width: 2,
                color: orange,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'Done',
              style: TextStyle(
                color: orange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
