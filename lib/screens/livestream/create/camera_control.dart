import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/utils/constant.dart';

class CameraControl extends StatefulWidget {
  const CameraControl({super.key});

  @override
  State<CameraControl> createState() => _CameraControlState();
}

class _CameraControlState extends State<CameraControl> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.75,
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
                    'Camera Control',
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
            margin: spacing(
              horizontal: 15,
            ),
            height: height * 0.25,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/camera_control.png'),
                gap(h: 10),
                Container(
                  width: width * 0.5,
                  child: Text(
                    'Allow your camera so others can see you',
                    style: TextStyle(
                      color: grayMed,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                gap(h: 10),
                Container(
                  padding: spacing(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: borderRadius(5),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset.zero,
                        color: Color.fromARGB(25, 0, 0, 0),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    'Use Camera',
                    style: TextStyle(
                      color: grayMed,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                gap(h: 5),
              ],
            ),
          ),
          gap(h: 15),
          Container(
            margin: spacing(
              horizontal: 15,
            ),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: grayLight,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset.zero,
                          color: Color.fromARGB(35, 0, 0, 0),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: borderRadius(
                        10,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: spacing(
                              horizontal: 18,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(10),
                              border: Border.all(
                                width: 1.5,
                                color: grayMed,
                              ),
                            ),
                            child: Container(
                              width: 28,
                              child: Image.asset(
                                'assets/new/icons/livestream/Voice.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          gap(
                            w: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'MicroPhone',
                                style: TextStyle(
                                  color: blackPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'On',
                                style: TextStyle(
                                  color: green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: spacing(horizontal: 15),
                        child: Image.asset(
                          'assets/new/icons/livestream/arrow_down.png',
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          gap(h: 15),
          Container(
            margin: spacing(
              horizontal: 15,
            ),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: grayLight,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset.zero,
                          color: Color.fromARGB(35, 0, 0, 0),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: borderRadius(
                        10,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: spacing(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(10),
                              border: Border.all(
                                width: 1.5,
                                color: grayMed,
                              ),
                            ),
                            child: Container(
                              width: 45,
                              child: Image.asset(
                                'assets/new/icons/livestream/off_camera.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          gap(
                            w: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Camera',
                                style: TextStyle(
                                  color: blackPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Off',
                                style: TextStyle(
                                  color: red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: spacing(horizontal: 15),
                        child: Image.asset(
                            'assets/new/icons/livestream/arrow_down.png'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 25),
            child: Container(
              width: double.maxFinite,
              padding: spacing(
                vertical: 10,
              ),
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
