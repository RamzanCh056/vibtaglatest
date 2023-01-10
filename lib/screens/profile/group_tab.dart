import 'package:flutter/material.dart';

import '../../utils/constant.dart';

Widget GroupTab({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return SingleChildScrollView(
    child: SingleChildScrollView(
      child: Column(
        children: [
          gap(h: 10),
          Container(
            height: height * 0.38,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: width * 0.65,
                    margin: spacing(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Container(
                            height: height * 0.2,
                            width: width * 0.65,
                            child: Image.asset(
                              'assets/new/images/wwe.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: spacing(horizontal: 10),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              gap(h: 10),
                              Container(
                                width: width * 0.6,
                                child: const Text(
                                  'WWE Wrestling',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              gap(h: 5),
                              Row(
                                children: [
                                  Text(
                                    'Public Group',
                                    style: TextStyle(
                                      color: grayMed,
                                      fontSize: 12,
                                    ),
                                  ),
                                  gap(w: 5),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(4),
                                      color: grayMed,
                                    ),
                                  ),
                                  gap(w: 5),
                                  Text(
                                    '170k members',
                                    style: TextStyle(
                                      color: grayMed,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              gap(h: 10),
                              Center(
                                child: Container(
                                  width: width * 0.55,
                                  padding: spacing(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: orangePrimary,
                                    borderRadius: borderRadius(10),
                                  ),
                                  child: Text(
                                    'Join Now',
                                    style: TextStyle(
                                      color: whitePrimary,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              gap(h: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          gap(h: 5),
          Center(
            child: Container(
              height: height * 0.525,
              width: width * 0.95,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: width * 0.25,
                      width: width * 0.95,
                      margin: spacing(
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            child: Container(
                              height: width * 0.25,
                              width: width * 0.25,
                              child: Image.asset(
                                'assets/new/images/wwe.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: spacing(horizontal: 10),
                            height: width * 0.25,
                            width: width * 0.7,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                gap(h: 10),
                                Container(
                                  width: width * 0.6,
                                  child: const Text(
                                    'WWE Wrestling',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                gap(h: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Public Group',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 10,
                                      ),
                                    ),
                                    gap(w: 5),
                                    Container(
                                      width: 4,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius(4),
                                        color: grayMed,
                                      ),
                                    ),
                                    gap(w: 5),
                                    Text(
                                      '170k members',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                gap(h: 5),
                                Container(
                                  width: width * 0.5,
                                  padding: spacing(
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: orangePrimary,
                                    borderRadius: borderRadius(5),
                                  ),
                                  child: Text(
                                    'Join Now',
                                    style: TextStyle(
                                      color: whitePrimary,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                gap(h: 5),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    ),
  );
}
