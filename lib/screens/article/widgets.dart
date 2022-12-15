import 'package:flutter/widgets.dart';

import '../../utils/constant.dart';

Widget MyArticles({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Column(
    children: [
      Container(
        width: width,
        height: height * 0.72,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            return Container(
              width: width * 0.7,
              height: height * 0.25,
              margin: spacing(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: medGray,
                borderRadius: borderRadius(10),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      child: Text(
                        'Cars and Vehicles',
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: Container(
                      child: Text(
                        'Cars Love',
                        style: TextStyle(
                          color: white,
                          fontSize: textLg,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 10,
                    child: Container(
                      width: width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2K views',
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                          Container(
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius(7),
                              color: white,
                            ),
                          ),
                          Text(
                            '2K views',
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.2,
                            padding: spacing(
                              horizontal: 10,
                              vertical: 7,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius(7),
                              color: lightGray,
                            ),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: width * 0.2,
                            padding: spacing(
                              horizontal: 10,
                              vertical: 7,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius(7),
                              color: lightGray,
                            ),
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
