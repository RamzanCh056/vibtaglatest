import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/constant.dart';

class Suggested extends StatelessWidget {
  const Suggested({super.key});

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return SingleChildScrollView(
      child: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              width: double.infinity,
              height: height * 0.27,
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    height: height * 0.25,
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.3,
                          height: height * 0.2,
                          margin: spacing(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            color: HexColor('#E2E2E2'),
                            borderRadius: borderRadius(10),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          'Lorum Ipsum',
                          style: TextStyle(
                            color: HexColor('#BEBEBE'),
                          ),
                        ),
                        Text(
                          'Dolar dash',
                          style: TextStyle(
                            color: HexColor('#BEBEBE'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width * 0.9,
              alignment: Alignment.center,
              height: height * 0.8,
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: HexColor('#E6E6E6'),
                        borderRadius: borderRadius(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: height * 0.12,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                    10,
                                  ),
                                  bottomRight: Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: const Text(
                                      'Raqoni Car Parts',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: spacing(
                                      horizontal: 0,
                                      vertical: 2,
                                    ),
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: const Text(
                                      'Cars and Vehicles',
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: spacing(
                                      horizontal: 0,
                                      vertical: 2,
                                    ),
                                    padding: spacing(
                                      horizontal: 10,
                                      vertical: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: width * 0.17,
                                          alignment: Alignment.center,
                                          padding: spacing(
                                            horizontal: 3,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 0.5,
                                              color: Colors.orange,
                                            ),
                                            borderRadius: borderRadius(4),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Like',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 3,
                                            vertical: 2,
                                          ),
                                          width: width * 0.17,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 0.5,
                                              color: Colors.orange,
                                            ),
                                            borderRadius: borderRadius(4),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Post',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '148',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Center(
                                    child: Container(
                                      margin: spacing(
                                        horizontal: 5,
                                        vertical: 2,
                                      ),
                                      padding: spacing(
                                        horizontal: 0,
                                        vertical: 2,
                                      ),
                                      width: width * 0.35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: borderRadius(3),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          top: 1,
                                        ),
                                        child: Text(
                                          'Like',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
