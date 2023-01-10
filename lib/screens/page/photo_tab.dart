import 'package:flutter/material.dart';

import '../../utils/constant.dart';

Widget PhotoTab({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Container(
    child: Center(
      child: Container(
        width: width * 0.96,
        height: height * 0.8,
        margin: spacing(
          horizontal: width * 0.02,
          vertical: width * 0.02,
        ),
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: width * 0.47,
                    height: height * 0.25,
                    child: ClipRRect(
                      borderRadius: borderRadius(7),
                      child: Image.asset(
                        'assets/images/post_cover.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  gap(w: 5),
                  Container(
                    height: height * 0.25,
                    width: width * 0.47,
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.12,
                          width: width * 0.47,
                          child: ClipRRect(
                            borderRadius: borderRadius(7),
                            child: Image.asset(
                              'assets/images/post_cover.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        gap(h: height * 0.01),
                        Container(
                          height: height * 0.12,
                          width: width * 0.47,
                          child: ClipRRect(
                            borderRadius: borderRadius(7),
                            child: Image.asset(
                              'assets/images/post_cover.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              gap(h: 5),
              Container(
                width: width * 0.96,
                height: height * 0.235,
                child: Center(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, i) {
                      return Container(
                        child: ClipRRect(
                          borderRadius: borderRadius(7),
                          child: Image.asset(
                            'assets/images/post_cover.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              gap(h: 5),
              Row(
                children: [
                  Container(
                    width: width * 0.47,
                    height: height * 0.25,
                    child: ClipRRect(
                      borderRadius: borderRadius(7),
                      child: Image.asset(
                        'assets/images/post_cover.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  gap(w: 5),
                  Container(
                    height: height * 0.25,
                    width: width * 0.47,
                    child: Row(
                      children: [
                        Container(
                          height: height * 0.25,
                          width: width * 0.227,
                          child: ClipRRect(
                            borderRadius: borderRadius(7),
                            child: Image.asset(
                              'assets/images/post_cover.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        gap(w: 5),
                        Container(
                          height: height * 0.25,
                          width: width * 0.227,
                          child: ClipRRect(
                            borderRadius: borderRadius(7),
                            child: Image.asset(
                              'assets/images/post_cover.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
