import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vibetag/screens/story/add_story.dart';


import '../../../utils/constant.dart';

Widget HomeStory({required Map<String, dynamic> modelUser}) {
  return StatefulBuilder(builder: ((context, setState) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width,
      height: height * 0.4,
      padding: spacing(
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: white,
      ),
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
                width: width * 0.45,
                margin: spacing(
                  horizontal: width * 0.01,
                  vertical: height * 0.001,
                ),
                padding: spacing(
                  horizontal: 2,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: orangePrimary,
                  ),
                  borderRadius: BorderRadius.circular(
                    width * 0.015,
                  ),
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
                            width * 0.015,
                          ),
                          child: Image.network(
                          modelUser['avatar'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: InkWell(
                        onTap: () {
                          addStory(context: context);
                        },
                        child: Center(
                          child: Container(
                            width: width * 0.2,
                            height: width * 0.2,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(192, 255, 255, 255),
                              borderRadius: borderRadius(width),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: white,
                                size: 44,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Stack(
            children: [
              Container(
                width: width * 0.45,
                height: height * 0.36,
                margin: spacing(
                  horizontal: width * 0.015,
                  vertical: height * 0.001,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    width * 0.015,
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
                    width * 0.015,
                  ),
                  child: Image.asset(
                    'assets/images/cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: width * 0.09,
                  height: width * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(width),
                  ),
                  child: ClipRRect(
                    borderRadius: borderRadius(width),
                    child: Image.asset(
                      'assets/images/streamer.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: spacing(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: borderRadius(5),
                  ),
                  child: Text(
                    'Live',
                    style: TextStyle(
                      color: white,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }));
}
